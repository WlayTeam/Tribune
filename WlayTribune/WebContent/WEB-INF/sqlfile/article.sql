insert into title (tid,title,introduction) value('1','java NIO详解','我们在写java程序的时候，为了进行优化，把全部的精力用在了处理效率上，但是对IO的关注却很少。这也可能是由以前java早期时JVM在解释字节码时速度慢，运行速率大大低于本地编译代码，因此以前往往忽视了IO的优化。');
insert into title (tid,title,introduction) value('2','Java 异常处理的误区和经验总结','本文着重介绍了 Java 异常选择和使用中的一些误区，希望各位读者能够熟练掌握异常处理的一些注意点和原则，注意总结和归纳。只有处理好了异常，才能提升开发人员的基本素养，提高系统的健壮性，提升用户体验，提高产品的价值。');
insert into title (tid,title,introduction) value('3','JavaEE – JPA（4）：EntityManager相关核心概念','前三篇文章花了一些笔墨介绍了事务的概念以及在EJB和spring Framework中分别是如何完成事务管理的。之所谓花了比较大的代价来介绍事务主要也是因为不管在什么类型的持久化应用中，都包含下面两个关键点：');
insert into title (tid,title,introduction) value('4','如何为可扩展系统进行Socket编程','上世纪九十年代后期，我在一家在线视频游戏工资工作，在哪里我主要的工作就是编写Unix Unix Berkley Socket和Windows WinSock代码。我的任务是确保视频游戏客户端和一个游戏服务器通信。很幸运有这样的机会写一些Java Socket代码，我对Java流式网络编程和简洁明了的API着迷。这一点都不让人惊讶，Java最初就是设计促进智能设备之间的通信，这一点很好的转移到了桌面应用和服务器应用。');
insert into title (tid,title,introduction) value('5','Quartz 入门详解','入门简介：');
insert into title (tid,title,introduction) value('6','安卓的进化—Part2','安卓已经六岁了。一周前我们推出了《安卓的历史：第一部分》。现在让我们继续踏上安卓的成长旅程。');
insert into title (tid,title,introduction) value('7','Quartz快速入门','英文原文： Quartz Scheduler  编译：ImportNew - 唐小娟');
insert into title (tid,title,introduction) value('8','得墨忒耳定律','
  降低耦合度，提高封装……
');
insert into title (tid,title,introduction) value('9','迭代与枚举','正如大家所知，迭代和枚举主要用于遍历集合对象。枚举可以应用于Vector和Hashtable，迭代主要用于集合对象。');
insert into title (tid,title,introduction) value('10','Jsoup代码解读（1）：概述','今天看到一个用python写的抽取正文的东东，美滋滋的用Java实现了一番，放到了webmagic里，然后发现Jsoup里已经有了…觉得自己各种不靠谱啊！算了，静下心来学学好东西吧！');
insert into title (tid,title,introduction) value('11','线程及同步的性能 – 线程池/ ThreadPoolExecutors/ ForkJoinPool','虽然在程序中可以直接使用Thread类型来进行线程操作，但是更多的情况是使用线程池，尤其是在Java EE应用服务器中，一般会使用若干个线程池来处理来自客户端的请求。Java中对于线程池的支持，来自ThreadPoolExecutor。一些应用服务器也确实是使用的ThreadPoolExecutor来实现线程池。');
insert into title (tid,title,introduction) value('12','专为Mac本跟踪Hadoop任务的应用','英文原文: Cloudera，编译：ImportNew – Royce Wong');
insert into title (tid,title,introduction) value('13','安卓开发者必备的42个链接','暑假就要结束了（译注：本文发布在13年8月份），或许你已决定成为一个安卓程序员。假期中，我收集了42个帮助大家学习安卓的链接。有的链接是面向初学者的帮助你从头开始，其他的则面向比较高级的开发者。当然这个列表是相当主观的，如果您也有更多关于安卓内容的链接，欢迎在评论栏中留言。');
insert into title (tid,title,introduction) value('14','Java 10大优点—Part5—高性能虚拟机','就我而言，会议季已经过去了。我仍然会在半夜醒来为第二天的谈话做最后的准备，结果在进浴室的一刻突然意识到在可预见的将来没有任何演讲的计划了！好吧，回到码砖和写作，这里我们谈谈“Java 10大优点”系列的第五章。');
insert into title (tid,title,introduction) value('15','JVM 调优 —— GC 长时间停顿问题及解决方法','零. 简介');
insert into title (tid,title,introduction) value('16','Jsoup代码解读（8）：防御XSS攻击','防御XSS攻击的一般原理');
insert into title (tid,title,introduction) value('17','如何提高hadoop中Short-Circuit Local Reads时的性能及安全性','大家都知道，apache hadoop的一个关键思想就是移动计算比移动数据更廉价。所以只要可能，我们就乐忠移动计算到数据地方。因此，HDFS通常使用许多的本地读，在本地机器构造读对象读出数据。');
insert into title (tid,title,introduction) value('18','初探Java字符串','String是java中的无处不在的类，使用也很简单。初学java，就已经有字符串是不可变的盖棺定论，解释通常是:它是final的。');
insert into title (tid,title,introduction) value('19','MyBatis（6）：MyBatis集成Spring事务管理（下）','前言');
insert into title (tid,title,introduction) value('20','深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）','Java中的FutureTask作为可异步执行任务并可获取执行结果而被大家所熟知，通常可以使用future.get()来获取线程的执行结果，在线程执行结束之前，get方法会一直阻塞状态，直到call()返回，其优点是使用线程异步执行任务的情况下还可以获取到线程的执行结果，但是FutureTask的以上功能却是依靠通过一个叫AbstractQueuedSynchronizer的类来实现，至少在JDK 1.5、JDK1.6版本是这样的（从1.7开始FutureTask已经被其作者Doug Lea修改为不再依赖AbstractQueuedSynchronizer实现了，这是JDK1.7的变化之一）。但是AbstractQueuedSynchronizer在JDK1.8中还有如下图所示的众多子类：');

