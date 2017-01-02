<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  本文由
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  -
  <a href="http://www.importnew.com/author/roycewong">
   Royce Wong
  </a>
  翻译自
  <a class="external" href="http://blog.cloudera.com/blog/2013/08/how-improved-short-circuit-local-reads-bring-better-performance-and-security-to-hadoop/" rel="nofollow" target="_blank">
   Cloudera
  </a>
  。欢迎加入
  <a class="external" href="http://group.jobbole.com/category/feedback/trans-team/" rel="nofollow" target="_blank">
   翻译小组
  </a>
  。转载请见文末要求。
 </div>
 <p>
  大家都知道，apache hadoop的一个关键思想就是移动计算比移动数据更廉价。所以只要可能，我们就乐忠移动计算到数据地方。因此，HDFS通常使用许多的本地读，在本地机器构造读对象读出数据。
 </p>
 <p>
  <img alt="localread1.png" src="http://www.importnew.com/wp-content/uploads/2013/08/localread1.png"/>
 </p>
 <p>
  最初，hdfs本地读其实和远程读使用的同一种方式：client端通过TCP 连接DN，并通过DataTransferProtocol传输数据。该方法简单，但是有一些不好的地方。例如，DN需要维护一个线程运行，并为每个client打开的tcp套接字建立连接传输数据。在linux内核中tcp协议是有开销的，同时DataTransferProtocol本身也有开销。这里有优化空间。
 </p>
 <p>
  本文大家将会了解到一项HDFS新的优化，叫做“secure short-circuit local reads”,学习该优化如何实现并怎样提速本地读的。
 </p>
 <h3>
  HDFS-2246 曾经实现的Short-Circuit LocalReads
 </h3>
 <p>
  <a class="external" href="https://issues.apache.org/jira/browse/HDFS-2246" rel="nofollow" target="_blank">
   HDFS-2246
  </a>
  ，ndrew Purtell, Suresh Srinivas, Jitendra Nath Pandey, and Benoy Antony等人添加了一项称为“short-circuit local reads”优化。
 </p>
 <p>
  其关键思想如下：因为客户端和数据在同一个节点，所以没必要再去和DN交互。客户端本身直接就从本地磁盘读出数据。这个性能优化被加入了CDH3u3。
 </p>
 <p>
  <img alt="localread2.png" src="http://www.importnew.com/wp-content/uploads/2013/08/localread2.png"/>
 </p>
 <p>
  HDFS-2246实现的short-circuit local read 是一个好的开始，但其带来了许多配置上麻烦。系统管理员必须改变DN数据目录权限，允许客户端打开相关文件。还需要定义一个白名单用户，可以使用这个特性。其他用户不允许。通常，这些用户被搞到一个特殊的UNIX 用户组里。
 </p>
 <p>
  不幸的是，这种权限改变带来了安全漏洞。有这种权限的用户就可以直接浏览所有数据了，不仅是他们需要的数据。简直就是超级用户啊！这个在一些场景下可以接受，比如 hbase用户，但是一般来讲，它还是带来了问题。这不是一个通用的方式。
 </p>
 <h3>
  HDFS-347：让Short-Circuit Local Reads 安全
 </h3>
 <p>
  HDFS-2246的主要问题就是它将DN的所有数据路径直接开放给了客户端。其实，客户端只是想要几个其关心的数据文件。
 </p>
 <p>
  幸亏Unix提供了可以这样做的机制，文件描述符。
  <a class="external" href="https://issues.apache.org/jira/browse/HDFS-347" rel="nofollow" target="_blank">
   HDFS-347
  </a>
  使用该机制实现安全的short-circuit local reads. 客户端向DN请求数据时，DN简单地打开blockfile和元数据文件，并直接传给客户端，而不是将路径传给客户端。因为文件描述符是只读的，客户端不能修改接收到的文件。同时不支持对block所在路径的访问，所以也就不能访问其他数据。
 </p>
 <p>
  Windows 有类似的机制允许将文件描述符在进程间传递。CDH目前还不支持该特性，同时Windows用户可以配置dfs.cient.use.legacy.blockreader.local为true使用legacy block reader。
  <br/>
  <img alt="localread3.png" src="http://www.importnew.com/wp-content/uploads/2013/08/localread3.png"/>
 </p>
 <h3>
  Cache 文件描述符
 </h3>
 <p>
  HDFS客户端经常多次读取相同的block文件（y尤其对HBase而言）。为了提高这种场景下的本地读，HDFS-2246实现的机制中有一个block 路径的Cache。Cache允许客户端重新打开block文件，而不需要再去访问DN。
 </p>
 <p>
  相对于路径Cache，新机制实现了一个FileInputStreamCache，缓存文件描述符。优点在于不需要客户端重新打开数据文件。该处实现性能优于老的读取机制。
 </p>
 <p>
  cache的大小可以通过dfs.client.read.shortcircuit.stream.cache.size调整,cache超时时间通过dfs.client.read.shortcircuit.streams.cache.expiry.ms设定。也可以关掉该cache，设置cache大小为0即可。大多数情况下，默认配置就可以了。如果你面对的是特殊的大规模的工作集和高文件描述符限制，你可以试着提高参数值。
 </p>
 <h3>
  HDFS-347配置
 </h3>
 <p>
  HDFS-347实现的新机制，所有hdfs用户都可以使用该特性，而不是局限于配置的几个用户。也没有必要去修改Unix用户组来设定谁可以访问DN路径。然而，java标准库并不包含支持文件描述符传递的库，所以该特性需要使用JNI。同时需要安装libhadoop.so库.
 </p>
 <p>
  HDFS-347也需要一个Unix域套接字路径，可通过dfs.domain.socket.path设置。该路径必须安全地阻止无优先级进程进行中间人攻击(MITM攻击,man-in-the-middle attack)。每个套接字路径必须是root拥有或者DN用户拥有，不能使用人人都可以写或者用户组可写方式的路径。
 </p>
 <p>
  如果你安装cloudera包 rpm，deb，cloudera会创建一个默认的安全的unix域套接字路径。同时会讲libhadoop.so安装到正确路径下。
 </p>
 <p>
  详细配置信息可以参考
  <a class="external" href="http://archive.cloudera.com/cdh4/cdh/4/hadoop/hadoop-project-dist/hadoop-hdfs/ShortCircuitLocalReads.html" rel="nofollow" target="_blank">
   the upstream documentation
  </a>
 </p>
 <h3>
  性能
 </h3>
 <p>
  新实现到底咋样呢？作者使用
  <strong>
   hio_bench
  </strong>
  程序获取到一些性能统计数据。hio
  <em>
   bench github 地址
   <a class="external" href="https://github.com/cmccabe/hiotest" rel="nofollow" target="_blank">
    https://github.com/cmccabe/hio
   </a>
  </em>
  <a class="external" href="https://github.com/cmccabe/hiotest" rel="nofollow" target="_blank">
   test
  </a>
  。
 </p>
 <p>
  测试案例运行在8核 intelXeon 2.13 12块磁盘服务器上，集群使用CDH4.3.1，底层使用ext4文件系统。 下图每个值是运行三次的平均值。
  <br/>
  <img alt="localread4.png" src="http://www.importnew.com/wp-content/uploads/2013/08/localread4.png"/>
 </p>
 <p>
  <img alt="localread5.png" src="http://www.importnew.com/wp-content/uploads/2013/08/localread5.png"/>
 </p>
 <p>
  在所有测试案例中，HDFS-347实现是最快的，可能归功于FileInputStreamCache.相反HDFS-2246实现会重复打开ext4 块文件多次，打开文件是一个重操作。
 </p>
 <p>
  short-circuit实现在随机读场景下比顺序读相对于hdfs初始的读取机制有相对优势。部分原因是为short-circuit local reads场景的 高速预读（readahead）还未实现。可以参考
  <a class="external" href="https://issues.apache.org/jira/browse/HDFS-4697" rel="nofollow" target="_blank">
   HDFS-4697
  </a>
  参与相关讨论。
 </p>
 <h3>
  结论
 </h3>
 <p>
  SCR （short-circuit local reads）是hadoop模型下优化的一项极好的案例。他们也有如何解决规模不断增长的挑战，Cloudera目前正挑战在集群中获取每个节点更多性能方向的研究。
 </p>
 <p>
  如果你正使用CDH4.2 或以上版本，用下新的实现把！
 </p>
 <p>
  Colin McCabe is a Software Engineer on the Platform team, and a Hadoop Committer.
 </p>
 <p>
 </p>
 原文链接：
 <a class="external" href="http://blog.cloudera.com/blog/2013/08/how-improved-short-circuit-local-reads-bring-better-performance-and-security-to-hadoop/" rel="nofollow" target="_blank">
  Cloudera
 </a>
 翻译：
 <a href="http://www.importnew.com">
  ImportNew.com
 </a>
 -
 <a href="http://www.importnew.com/author/roycewong">
  Royce Wong
 </a>
 <br/>
 译文链接：
 <a href="http://www.importnew.com/6151.html">
  http://www.importnew.com/6151.html
 </a>
 <br/>
 [
 <span style="color:#ff0000">
  <b>
   转载请保留原文出处、译者和译文链接。
  </b>
 </span>
 ]
 <br/>
 <br/>
 <!-- BEGIN #author-bio -->
 <div id="author-bio">
  <h3 class="widget-title">
   关于作者：
   <a href="http://www.importnew.com/author/roycewong">
    Royce Wong
   </a>
  </h3>
  <div class="alignleft">
   <a href="http://www.importnew.com/author/roycewong">
   </a>
  </div>
  <p>
   微博：http://weibo.com/wfeng1982
  </p>
  <p>
   <a href="http://www.importnew.com/author/roycewong" style="text-decoration: none;">
    查看Royce Wong的更多文章 &gt;&gt;
   </a>
  </p>
  <div class="clear">
  </div>
 </div>
 <!-- END #author-bio -->
</div>
</body></html>