<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  本文由
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  -
  <a href="http://www.importnew.com/author/huangsuoyuan">
   黄索远
  </a>
  翻译自
  <a class="external" href="https://www.xda-developers.com/android/the-evolution-of-android-part-ii/" rel="nofollow" target="_blank">
   xda-developers
  </a>
  。欢迎加入
  <a class="external" href="http://group.jobbole.com/category/feedback/trans-team/" rel="nofollow" target="_blank">
   翻译小组
  </a>
  。转载请见文末要求。
 </div>
 <div>
  <p>
   安卓已经六岁了。一周前我们推出了《安卓的历史：第一部分》。现在让我们继续踏上安卓的成长旅程。
  </p>
  <p>
   很久很久以前，有一个遥远的银河系（出自《星球大战》）。在山景城（
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    总部）安卓系统的第一个版本诞生了，这个系统是为了平板而设计的。
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    称其为“
    <strong>
     蜂窝
    </strong>
   </span>
   <span style="font-family: Times New Roman;">
    3.0
   </span>
   <span style="font-family: 宋体;">
    ”，并将其与
    <a class="external" href="http://forum.xda-developers.com/motorola-xoom" rel="nofollow" target="_blank">
     摩托罗拉
    </a>
   </span>
   <span style="font-family: Times New Roman;">
    Xoom
   </span>
   <span style="font-family: 宋体;">
    一起发布。
   </span>
  </p>
  <p>
   刚开始的时候，
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    决定闭源开发。显然，他们试图实现一些独特的功能——并且实际也做到了。他们在系统中引入了通知区域切换功能，并且在图像处理单元中加入了图像补偿技术，这让系统能够响应日趋丰富的
   </span>
   <span style="font-family: Times New Roman;">
    UI
   </span>
   <span style="font-family: 宋体;">
    表现。说到性能，这是多内核系统第一次用在了流行的安卓设备上——这一趋势一直延续到我们正在进行的规格战争。
   </span>
  </p>
  <p>
   <a href="http://www.importnew.com/?attachment_id=7736" rel="attachment wp-att-7736">
    <img alt="" class="aligncenter size-full wp-image-7736" height="171" src="http://www.importnew.com/wp-content/uploads/2013/12/Google-Galaxy-Nexus-300x171.jpg" title="Google-Galaxy-Nexus-300x171" width="300"/>
   </a>
  </p>
  <p>
   Google
   <span style="font-family: 宋体;">
    引入的第二个版本是“
   </span>
   <strong>
    <span style="font-family: Times New Roman;">
     4.0
    </span>
   </strong>
   <span style="font-family: 宋体;">
    <strong>
     冰淇淋三明治
    </strong>
    ”（
   </span>
   <span style="font-family: Times New Roman;">
    ICS
   </span>
   <span style="font-family: 宋体;">
    ）。这个版本像支持平板一样支持手机，
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    将这个系统发布在三星
   </span>
   <a class="external" href="http://forum.xda-developers.com/galaxy-nexus" rel="nofollow" target="_blank">
    <span style="font-family: Times New Roman;">
     Galaxy Nexus
    </span>
   </a>
   <span style="font-family: 宋体;">
    （
   </span>
   <span style="font-family: Times New Roman;">
    GNex
   </span>
   <span style="font-family: 宋体;">
    ）这样一款非常流行的设备上。
   </span>
   <span style="font-family: Times New Roman;">
    ICS
   </span>
   <span style="font-family: 宋体;">
    在
   </span>
   <span style="font-family: Times New Roman;">
    2011
   </span>
   <span style="font-family: 宋体;">
    年的
   </span>
   <span style="font-family: Times New Roman;">
    10
   </span>
   <span style="font-family: 宋体;">
    月
   </span>
   <span style="font-family: Times New Roman;">
    19
   </span>
   <span style="font-family: 宋体;">
    号与大众见面。
   </span>
   <span style="font-family: Times New Roman;">
    Linux3.0.1
   </span>
   <span style="font-family: 宋体;">
    版本的内核被首次采用，“蜂窝”上大多数功能都被移植到内核中。
   </span>
   <span style="font-family: Times New Roman;">
    GNex
   </span>
   <span style="font-family: 宋体;">
    将减少一些按钮，这些按钮的功能将会由软件取代。这样做的目的是最大限度地利用
   </span>
   <span style="font-family: Times New Roman;">
    4.65
   </span>
   <span style="font-family: 宋体;">
    寸的屏幕面积。用户能够通过自拍进行屏幕解锁，并且“蜂窝”中非常简陋的“
   </span>
   <span style="font-family: Times New Roman;">
    Holo
   </span>
   <span style="font-family: 宋体;">
    ”得到了一些改善。
   </span>
  </p>
  <p>
   <a href="http://www.importnew.com/?attachment_id=7737" rel="attachment wp-att-7737">
    <img alt="" class="aligncenter size-full wp-image-7737" height="187" src="http://www.importnew.com/wp-content/uploads/2013/12/Android-Jelly-Bean-Logo-300x187.jpg" title="Android-Jelly-Bean-Logo-300x187" width="300"/>
   </a>
  </p>
  <p>
   ICS
   <span style="font-family: 宋体;">
    发布半年后，
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    揭开了“
    <strong>
     安卓
    </strong>
   </span>
   <strong>
    <span style="font-family: Times New Roman;">
     4.1
    </span>
   </strong>
   <span style="font-family: 宋体;">
    <strong>
     果冻豆
    </strong>
    ”的神秘面纱。
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    在由华硕生产的
   </span>
   <a class="external" href="http://forum.xda-developers.com/nexus-7" rel="nofollow" target="_blank">
    <span style="font-family: Times New Roman;">
     Google Nexus 7
    </span>
   </a>
   <span style="font-family: 宋体;">
    上发布了这个系统。“果冻豆”后续有三个主要更新：
   </span>
   <span style="font-family: Times New Roman;">
    4.1
   </span>
   <span style="font-family: 宋体;">
    、
   </span>
   <span style="font-family: Times New Roman;">
    4.2
   </span>
   <span style="font-family: 宋体;">
    和
   </span>
   <span style="font-family: Times New Roman;">
    4.3
   </span>
   <span style="font-family: 宋体;">
    。这三个版本一起成为了
    <a class="external" href="http://developer.android.com/about/dashboards/index.html" rel="nofollow" target="_blank">
     最受欢迎的操作系统
    </a>
    。最近数据显示，接入
   </span>
   <span style="font-family: Times New Roman;">
    Google Play
   </span>
   <span style="font-family: 宋体;">
    的设备中超过百分之五十使用了“果冻豆”系统。
   </span>
  </p>
  <p>
   安卓
   <span style="font-family: Times New Roman;">
    4.1
   </span>
   <span style="font-family: 宋体;">
    有了
    <a class="external" href="http://www.xda-developers.com/android/highlights-from-day-1-at-google-io-2012/" rel="nofollow" target="_blank">
     大量的改进
    </a>
    ，如“黄油计划”——丰富的屏幕通知、室内地图、
   </span>
   <span style="font-family: Times New Roman;">
    Google Now
   </span>
   <span style="font-family: 宋体;">
    等等。
    <strong>
     安卓
    </strong>
   </span>
   <strong>
    <span style="font-family: Times New Roman;">
     4.2
    </span>
   </strong>
   <span style="font-family: 宋体;">
    第一次发布是在市面非常流行的
   </span>
   <a class="external" href="http://forum.xda-developers.com/nexus-4" rel="nofollow" target="_blank">
    <span style="font-family: Times New Roman;">
     Google Nexus 4
    </span>
   </a>
   <span style="font-family: 宋体;">
    上，这款手机由
   </span>
   <span style="font-family: Times New Roman;">
    LG
   </span>
   <span style="font-family: 宋体;">
    生产。接下来，安卓
   </span>
   <span style="font-family: Times New Roman;">
    4.3
   </span>
   <span style="font-family: 宋体;">
    第一次发布在华硕生产的
   </span>
   <a class="external" href="http://forum.xda-developers.com/nexus-7-2013" rel="nofollow" target="_blank">
    <span style="font-family: Times New Roman;">
     Google Nexus 7（2013）
    </span>
   </a>
   <span style="font-family: 宋体;">
    上。这个版本引入了大量的增强功能，如
    <a class="external" href="http://www.xda-developers.com/android/android-4-4-security-enhancements/" rel="nofollow" target="_blank">
     之前讨论过
    </a>
    的
   </span>
   <span style="font-family: Times New Roman;">
    SELinux
   </span>
   <span style="font-family: 宋体;">
    。同时，摄像头软件进行了大幅更新，如
   </span>
   <span style="font-family: Times New Roman;">
    swipe-to-dismiss UI
   </span>
   <span style="font-family: 宋体;">
    模式、
   </span>
   <span style="font-family: Times New Roman;">
    Photosphere
   </span>
   <span style="font-family: 宋体;">
    等。
   </span>
  </p>
  <p>
   4.3
   <span style="font-family: 宋体;">
    发布以后，很多人猜测安卓的下个版本会是“
   </span>
   <span style="font-family: Times New Roman;">
    5.0
   </span>
   <span style="font-family: 宋体;">
    酸橙派”。不过正如现在知道的那样，
   </span>
   <span style="font-family: Times New Roman;">
    4.3
   </span>
   <span style="font-family: 宋体;">
    的下个版本最终定为了
   </span>
   <strong>
    <span style="font-family: Times New Roman;">
     4.4
    </span>
   </strong>
   <span style="font-family: 宋体;">
    <strong>
     “奇巧”
    </strong>
    。
   </span>
  </p>
  <p>
   2013
   <span style="font-family: 宋体;">
    年的万圣节，这个新操作系统在万众期待的
   </span>
   <a class="external" href="http://forum.xda-developers.com/nexus-5" rel="nofollow" target="_blank">
    <span style="font-family: Times New Roman;">
     Google Nexus 5
    </span>
   </a>
   <span style="font-family: 宋体;">
    上发布。新版本
    <a class="external" href="http://www.xda-developers.com/android/new-in-android-4-4-kitkat-everything-you-need-to-know/" rel="nofollow" target="_blank">
     增加了大量的功能
    </a>
    ，其中一个主要目标是使系统能在低端设备上运行的更好，比如那些只有
   </span>
   <span style="font-family: Times New Roman;">
    512MB
   </span>
   <span style="font-family: 宋体;">
    内存的设备。
   </span>
   <span style="font-family: Times New Roman;">
    4.4
   </span>
   <span style="font-family: 宋体;">
    版本中还引入了
    <a class="external" href="http://www.xda-developers.com/android/new-runtime-compiler-in-android-4-4/" rel="nofollow" target="_blank">
     新的
    </a>
   </span>
   <a class="external" href="http://www.xda-developers.com/android/new-runtime-compiler-in-android-4-4/" rel="nofollow" target="_blank">
    <span style="font-family: Times New Roman;">
     ART
    </span>
   </a>
   <span style="font-family: 宋体;">
    <a class="external" href="http://www.xda-developers.com/android/new-runtime-compiler-in-android-4-4/" rel="nofollow" target="_blank">
     编译器
    </a>
    ，并且很可能在未来的取代
   </span>
   <span style="font-family: Times New Roman;">
    Dalvik
   </span>
   <span style="font-family: 宋体;">
    的地位。
   </span>
  </p>
  <p>
   然而，并不是所有的疑虑都随着安卓最新版本的发布而消散。正如很多人担心的那样，
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    正试图恢复对于安卓平台的控制——如果脱离了
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    的闭源应用，很可能无法使用。不幸的是，
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    已经决定舍弃很多开源应用，转而使用那些
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    自己的闭源应用。这些闭源应用包括
   </span>
   <span style="font-family: Times New Roman;">
    Chrome
   </span>
   <span style="font-family: 宋体;">
    、
   </span>
   <span style="font-family: Times New Roman;">
    Hangouts
   </span>
   <span style="font-family: 宋体;">
    和新的
   </span>
   <span style="font-family: Times New Roman;">
    Google Experience Launcher
   </span>
   <span style="font-family: 宋体;">
    。虽然现在这种变化对于终端用户可能还没有太大的影响，但是没人知道这对于安卓平台的未来意味着什么。
   </span>
  </p>
  <p>
   过去的
   <span style="font-family: Times New Roman;">
    6
   </span>
   <span style="font-family: 宋体;">
    年里，安卓已经从过去那个可爱的小绿机器人变成了现如今的强大势力。在现在的移动市场上
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    是最大的玩家，最新的智能手机中大多数都在使用安卓系统。这个成功一部分是由安卓软件提供的自由与可定制所带来的。在功能已经非常丰富的操作系统上，新的设备制造商们可以增加额外的功能，根据自己的要求进行定制，如三星的
   </span>
   <span style="font-family: Times New Roman;">
    TouchWiz
   </span>
   <span style="font-family: 宋体;">
    和
   </span>
   <span style="font-family: Times New Roman;">
    HTC
   </span>
   <span style="font-family: 宋体;">
    的
   </span>
   <span style="font-family: Times New Roman;">
    Sense
   </span>
   <span style="font-family: 宋体;">
    。我们只能希望
   </span>
   <span style="font-family: Times New Roman;">
    Google
   </span>
   <span style="font-family: 宋体;">
    重新考虑关于使用专有平台取代开源应用程序的计划，因为这最终将会带走我们热爱的自由。
   </span>
  </p>
 </div>
 原文链接：
 <a class="external" href="https://www.xda-developers.com/android/the-evolution-of-android-part-ii/" rel="nofollow" target="_blank">
  xda-developers
 </a>
 翻译：
 <a href="http://www.importnew.com">
  ImportNew.com
 </a>
 -
 <a href="http://www.importnew.com/author/huangsuoyuan">
  黄索远
 </a>
 <br/>
 译文链接：
 <a href="http://www.importnew.com/7735.html">
  http://www.importnew.com/7735.html
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
   <a href="http://www.importnew.com/author/huangsuoyuan">
    黄索远
   </a>
  </h3>
  <div class="alignleft">
   <a href="http://www.importnew.com/author/huangsuoyuan">
   </a>
  </div>
  <p>
   （新浪微博：
   <a class="external" href="http://weibo.com/u/2429454764" rel="nofollow" target="_blank">
    @黄索远
   </a>
   ）
  </p>
  <p>
   <a href="http://www.importnew.com/author/huangsuoyuan" style="text-decoration: none;">
    查看黄索远的更多文章 &gt;&gt;
   </a>
  </p>
  <div class="clear">
  </div>
 </div>
 <!-- END #author-bio -->
</div>
</body></html>