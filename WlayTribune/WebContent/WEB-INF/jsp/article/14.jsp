<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  本文由
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  -
  <a href="http://www.importnew.com/author/lijuanlong">
   汤米猫
  </a>
  翻译自
  <a class="external" href="http://zeroturnaround.com/rebellabs/10-reasons-why-java-rocks-more-than-ever-part-5-high-performance-jvm/" rel="nofollow" target="_blank">
   zeroturnaround
  </a>
  。欢迎加入
  <a class="external" href="http://group.jobbole.com/category/feedback/trans-team/" rel="nofollow" target="_blank">
   翻译小组
  </a>
  。转载请见文末要求。
 </div>
 <p>
  就我而言，会议季已经过去了。我仍然会在半夜醒来为第二天的谈话做最后的准备，结果在进浴室的一刻突然意识到在可预见的将来没有任何演讲的计划了！好吧，回到码砖和写作，这里我们谈谈“Java 10大优点”系列的第五章。
 </p>
 <p>
  友情提示，这里再次列举了我最喜欢的Java平台的10个理由。
 </p>
 <ul>
  <li>
   <a href="http://www.importnew.com/6268.html">
    Java编译器
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/7522.html">
    Core API
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/7520.html">
    开源
   </a>
  </li>
  <li>
   <a href="http://www.importnew.com/7526.html">
    Java内存模型
   </a>
  </li>
  <li>
   高性能虚拟机（VM）
  </li>
  <li>
   字节码（Bytecode）
  </li>
  <li>
   聪明的IDE
  </li>
  <li>
   性能分析工具
  </li>
  <li>
   向后兼容性
  </li>
  <li>
   成熟与创新
  </li>
 </ul>
 <p>
  这次我来谈一谈 “高性能虚拟机（JVM）”的细节。
 </p>
 <p>
  <strong>
   是什么让Java虚拟机（JVM）牛气冲天?
  </strong>
 </p>
 <p>
  这个问题很简单，对吧。大多数人都会告诉你Java和其它语言的区别就是它的跨平台特性。Java提供了write-one-run-anywhere（一次开发，到处运行）的特性，这个特性就是就是虚拟机提供的。虽然这个特性并非JVM独有，很多其它语言和平台也采用虚拟机技术。甚至Java都不是第一个采用虚拟机的编程语言，Smalltalk在Java发明前10年就用虚拟机了。
 </p>
 <p>
  那么，到底是什么让Java虚拟机牛气冲天呢？简而言之，目前为止JVM仍然是
  <em>
   <strong>
    虚拟
   </strong>
  </em>
  机，而且是所有应用虚拟机中最完善的。它跨平台、开源、速度超快、提供字节码安全验证，既可以作为静态语言主机，也可以作为动态语言主机。它还提供自动内存管理以及运行时的可调整特性。
 </p>
 <p>
  <strong>
   为什么这些特性对程序员很重要？
  </strong>
 </p>
 <p>
  在我多用C++编程的那些年，我简直不敢相信在实体机上直接写软件是那么地复杂。我们不得不保证正确地测试并编译了所有目标架构，而且实实在在地实现软件实在是一件烦人的事。程序员们必须要精通不同版本的主流操作系统，并且保证自己的开发环境可以和这些操作系统共存。这使得编译工具这类基础事物的复杂性成倍增加。
 </p>
 <p>
  想当初，CPython的开发过程就饱受Python虚拟机不成熟之苦。它远不如JVM优化，而且受限于糟糕的“
  <a class="external" href="http://en.wikipedia.org/wiki/Global_Interpreter_Lock" rel="nofollow" target="_blank">
   Global Interpreter Lock
  </a>
  ”(全局解析器锁），此物使得并行非常难以控制。所以我们不得不经常地减少效率关键代码而使用原生代码，并且付出在非虚拟机开发的情况下才有的代价，虽然我们使用的是虚拟机。
 </p>
 <p>
  Java虚拟机速度很快，在不要求实时运算操作时可以得到两方面的最佳功效。其实，绝大多数应用程序都不需要这种操作。因此，多亏有了如此的高效能，Java的开发者才能真正利用好基于虚拟机开发的种种好处。
 </p>
 <p>
  <strong>
   Java虚拟机的未来如何？
  </strong>
 </p>
 <p>
  如今，
  <a class="external" href="http://en.wikipedia.org/wiki/Internet_of_Things" rel="nofollow" target="_blank">
   物联网
  </a>
  正风行一时。我们看到大量不同的设备在市场上出现，每一种的更新速度都越来越快。
 </p>
 <p>
  想知道每一个硬件架构的来龙去脉是几乎不可能的。但你肯定会想让你的应用程序运行在大多数设备上，利用互联特性来广泛地利用你的软件。因此，一个高效的虚拟机正变得比以前更重要。
 </p>
 <p>
  在Java8中，Oracle推出了一个新版、针对小型设备（例如
  <a class="external" href="http://www.raspberrypi.org/" rel="nofollow" target="_blank">
   Raspberry Pi
  </a>
  、
  <a class="external" href="https://blogs.oracle.com/hinkmond/entry/beaglebone_black_great_raspberry_pi" rel="nofollow" target="_blank">
   BeagleBone
  </a>
  等）设计的Java SE。
 </p>
 <p>
  Java嵌入式开发曾经是在一个完全不同的平台——JavaME上进行的。你在Java的标准版或企业版上磨练出的开发技能几乎没有任何用武之地。而
  <a class="external" href="http://www.oracle.com/technetwork/java/embedded/overview/javase/index.html" rel="nofollow" target="_blank">
   Java SE Embeded
  </a>
  包含了所有Java8 的语言特性。JVM已经针对为每一种嵌入式平台进行裁剪并优化，API也是精心定义过的Java标准版API子集。通过“
  <a class="external" href="http://openjdk.java.net/jeps/161" rel="nofollow" target="_blank">
   Three Profiles
  </a>
  ”（Java SE的一个子集），你总是可以精确地做出选择，最大程度降低内存占用。你可以继续使用桌面版和标准版Java开发中学到的知识和工具。
  <a class="external" href="http://www.oracle.com/technetwork/java/embedded/overview/java-embedded-suite/index.html" rel="nofollow" target="_blank">
   Java Embedded Suite
  </a>
  甚至为你提供了经过优化的应用程序服务器、服务层和数据库。因此，创建RESTful Web应用程序与其它设备交流变得非常容易。
 </p>
 <p>
  <strong>
   嵌入式设备与物联网的乐趣
  </strong>
 </p>
 <p>
  在ZeroTurnaround，我们致力于供优质的骇客集会，就像我们在Devoxx活动中做的那样！通过共同主办
  <a class="external" href="http://zeroturnaround.com/rebellabs/devoxx-hackfest-in-action-attracts-developers/" rel="nofollow" target="_blank">
   为期两天的研讨会
  </a>
  ，使用
  <a class="external" href="http://www.globalcode.com.br/home" rel="nofollow" target="_blank">
   Yara 和 Vinicius Senger
  </a>
  组成的嵌入式设备面板，我们发现Java SE Embeded在大范围的设备上使用的可能性。在研讨会的最后，我本人
  <a class="external" href="http://www.youtube.com/watch?v=ihc4Nvw9RUA" rel="nofollow" target="_blank">
   让我们的彩虹图标复活
  </a>
  ，并且通过手势远程控制了它们。（通过手势控制了彩虹图标颜色的变化，这个彩虹图标是一个嵌入式Java 设备）。
 </p>
 <p>
  无论你的兴趣和需求是什么都大可放心，从高吞吐率的web程序到通过Java SE Embedded设置Raspberry Pi而驱动的啤酒机，再到自动清洗猫咪器，JVM都能够胜任你的需求。
 </p>
 <p>
  你有任何关于Java和物联网IoT的经验吗？你有什么有趣的项目愿意分享吗，请在下面留下评论或者tweet
  <a class="external" href="http://twitter.com/gbevin" rel="nofollow" target="_blank">
   @gbevin
  </a>
  或
  <a class="external" href="http://twitter.com/rebellabs" rel="nofollow" target="_blank">
   @RebelLabs
  </a>
  。
 </p>
 原文链接：
 <a class="external" href="http://zeroturnaround.com/rebellabs/10-reasons-why-java-rocks-more-than-ever-part-5-high-performance-jvm/" rel="nofollow" target="_blank">
  zeroturnaround
 </a>
 翻译：
 <a href="http://www.importnew.com">
  ImportNew.com
 </a>
 -
 <a href="http://www.importnew.com/author/lijuanlong">
  汤米猫
 </a>
 <br/>
 译文链接：
 <a href="http://www.importnew.com/7889.html">
  http://www.importnew.com/7889.html
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
   <a href="http://www.importnew.com/author/lijuanlong">
    汤米猫
   </a>
  </h3>
  <div class="alignleft">
   <a href="http://www.importnew.com/author/lijuanlong">
   </a>
  </div>
  <p>
  </p>
  <p>
   <a href="http://www.importnew.com/author/lijuanlong" style="text-decoration: none;">
    查看汤米猫的更多文章 &gt;&gt;
   </a>
  </p>
  <div class="clear">
  </div>
 </div>
 <!-- END #author-bio -->
</div>
</body></html>