<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  本文作者：
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  -
  <a href="http://www.importnew.com/author/roycewong">
   Royce Wong
  </a>
  未经许可，禁止转载！
 </div>
 <p>
  英文原文:
  <a class="external" href="http://blog.cloudera.com/blog/2013/05/tracking-hadoop-jobs-from-your-mac-theres-an-app-for-that/" rel="nofollow" target="_blank">
   Cloudera
  </a>
  ，编译：
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  –
  <a href="http://www.importnew.com/author/roycewong">
   Royce Wong
  </a>
 </p>
 <p>
  先把感谢送给Etsy开发者Brad Greenlee (
  <a class="external" href="https://twitter.com/bgreenlee" rel="nofollow" target="_blank">
   @bgreenlee
  </a>
  )。他开发的针对JobTracer的Mac OS应用非常棒！
 </p>
 <p>
  <a class="external" href="http://bgreenlee.github.io/JobTracker" rel="nofollow" target="_blank">
   JobTracker.app
  </a>
  是一个针对Hadoop JobTracker的Mac菜单栏应用。它提供了对Mapreduce 任务启动、完成、失败的通知，可以通过它轻松访问这些任务的详细页面。
 </p>
 <p>
  当我在
  <a class="external" href="https://www.etsy.com/" rel="nofollow" target="_blank">
   Etsy
  </a>
  进行Apache Hadoop 的开发工作时，我发现为了查看任务的执行进度，我不得不不断的查看Jobtracker页面，这占据了非常多的时间(话说译者坚决同意)。当时我们尝试着去解决这个问题，写了一个
  <a class="external" href="https://github.com/twitter/scalding" rel="nofollow" target="_blank">
   Scalding
  </a>
  工作流监听器，将已经完成和失败的任务发布给IRC，但是这个有点烦。所以我写了这个JobTracker.app。
  <span id="more-4203">
  </span>
 </p>
 <h3>
  安装和使用
 </h3>
 <p>
  你可以从
  <a class="external" href="https://github.com/bgreenlee/JobTracker" rel="nofollow" target="_blank">
   GitHub项目页面
  </a>
  下载二进制文件。解压之后将它放到你的应用文件夹里。
 </p>
 <p>
  运行时，菜单栏会多出一个小帽子的图标，如下图：
  <br/>
  <a href="http://www.importnew.com/wp-content/uploads/2013/05/pith_helmet_sm.png" rel="lightbox[4203]" title="专为Mac本跟踪Hadoop任务的应用">
   <img alt="" class="alignnone" height="18" src="http://www.importnew.com/wp-content/uploads/2013/05/pith_helmet_sm.png" width="18"/>
  </a>
  <br/>
  点击它就会看到下面的菜单。
 </p>
 <p>
  <a href="http://www.importnew.com/?attachment_id=4206">
   <img alt="" height="223" src="http://www.importnew.com/wp-content/uploads/2013/05/jobtracker_menu.png" title="jobtracker_menu" width="235"/>
  </a>
 </p>
 <p>
  首先你必须在Preferences里输入你的JobTracker URL地址:
 </p>
 <p>
  <a href="http://www.importnew.com/?attachment_id=4207">
   <img alt="" height="237" src="http://www.importnew.com/wp-content/uploads/2013/05/perferences-300x237.png" title="perferences" width="300"/>
  </a>
 </p>
 <p>
 </p>
 <p>
  默认情况下，它会跟踪所有任务。很可能你不希望这样，所以将你的用户名和其他你想查看的用户名输入到”Usernames to track”文本框中，多个使用英文逗号隔开即可。
 </p>
 <p>
  注意应用仅在Etsy内部使用的Hadoop版本测试过。这个APP使用了有点可怕的方式获取JobTracker数据（通过解析JobTracker页面，因为当前除了通过Java程序还没有API去访问JobTracker），在不同的版本上应用可能会失败。如果你想使用它但没有成功，在GitHub上
  <a class="external" href="https://github.com/bgreenlee/JobTracker/issues" rel="nofollow" target="_blank">
   提交一个issue
  </a>
  ，我会为你解决。
 </p>
 <h3>
  未来发展
 </h3>
 <p>
  待开发的特性列表中，下步将会是
  <a class="external" href="https://github.com/bgreenlee/JobTracker/issues/2" rel="nofollow" target="_blank">
   同时跟踪多个集群
  </a>
  。如果你有任何请求，请联系应用
  <a href="brad@etsy.com">
   作者
  </a>
  。
 </p>
 <p>
 </p>
 <p>
  英文原文:
  <a class="external" href="http://blog.cloudera.com/blog/2013/05/tracking-hadoop-jobs-from-your-mac-theres-an-app-for-that/" rel="nofollow" target="_blank">
   Cloudera
  </a>
  ，编译：
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  -
  <a href="http://www.importnew.com/author/roycewong">
   Royce Wong
  </a>
 </p>
 <p>
  本文链接：
  <a href="http://www.importnew.com/4203.html">
   http://www.importnew.com/4203.html
  </a>
 </p>
 <p>
  <span style="color: #ff0000;">
   【如需转载，请在正文中标注并保留原文链接、译文链接和译者等信息，谢谢合作！】
  </span>
 </p>
 <p>
  <!-- This document was created with MarkdownPad, the Markdown editor for Windows (http://markdownpad.com) -->
 </p>
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