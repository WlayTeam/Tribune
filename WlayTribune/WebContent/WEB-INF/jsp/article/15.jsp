<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  原文出处：
  <a href="http://blog.csdn.net/wenniuwuren/article/details/51131741" ref="nofollow" target="_blank">
   文牛武人
  </a>
 </div>
 <p>
  <strong>
   零. 简介
  </strong>
 </p>
 <div>
  垃圾收集器长时间停顿，表现在 Web 页面上可能是页面响应码 500 之类的服务器错误问题，如果是个支付过程可能会导致支付失败，将造成公司的直接经济损失，程序员要尽量避免或者说减少此类情况发生。
 </div>
 <p>
  <strong>
   一. 并发模式失败（concurrent mode failure）
  </strong>
 </p>
 <p>
  并发模式失败日志：
 </p>
 <div>
  <pre class="brush: html; gutter: true">2016-02-21T13:53:07.974+0800: 171467.254: [GC [1 CMS-initial-mark: 1436199K(1560576K)] 1512927K(2504320K), 0.0618140 secs] [Times: user=0.06 sys=0.00, real=0.07 secs]  
2016-02-21T13:53:08.036+0800: 171467.316: [CMS-concurrent-mark-start]  
2016-02-21T13:53:08.377+0800: 171467.657: [CMS-concurrent-mark: 0.340/0.340 secs] [Times: user=2.11 sys=0.15, real=0.34 secs]  
2016-02-21T13:53:08.377+0800: 171467.657: [CMS-concurrent-preclean-start]  
2016-02-21T13:53:08.385+0800: 171467.665: [CMS-concurrent-preclean: 0.008/0.008 secs] [Times: user=0.01 sys=0.00, real=0.01 secs]  
2016-02-21T13:53:08.385+0800: 171467.665: [CMS-concurrent-abortable-preclean-start]  
{Heap before GC invocations=88667 (full 45):  
 par new generation   total 943744K, used 914399K [0x0000000757000000, 0x0000000797000000, 0x0000000797000000)  
  eden space 838912K, 100% used [0x0000000757000000, 0x000000078a340000, 0x000000078a340000)  
  from space 104832K,  72% used [0x000000078a340000, 0x000000078ecf7d98, 0x00000007909a0000)  
  to   space 104832K,   0% used [0x00000007909a0000, 0x00000007909a0000, 0x0000000797000000)  
 concurrent mark-sweep generation total 1560576K, used 1436199K [0x0000000797000000, 0x00000007f6400000, 0x00000007f6400000)  
 concurrent-mark-sweep perm gen total 159744K, used 78413K [0x00000007f6400000, 0x0000000800000000, 0x0000000800000000)  
2016-02-21T13:53:09.535+0800: 171468.815: [GC2016-02-21T13:53:09.535+0800: 171468.815: [ParNew  
Desired survivor size 53673984 bytes, new threshold 6 (max 6)  
- age   1:    7100568 bytes,    7100568 total  
- age   2:    4676456 bytes,   11777024 total  
- age   3:    8773736 bytes,   20550760 total  
- age   4:    7709744 bytes,   28260504 total  
- age   5:   10891960 bytes,   39152464 total  
- age   6:   11735032 bytes,   50887496 total  
: 914399K-&gt;75616K(943744K), 0.0414860 secs] 2350599K-&gt;1517225K(2504320K), 0.0417710 secs] [Times: user=0.32 sys=0.05, real=0.05 secs]  
Heap after GC invocations=88668 (full 45):  
 par new generation   total 943744K, used 75616K [0x0000000757000000, 0x0000000797000000, 0x0000000797000000)  
  eden space 838912K,   0% used [0x0000000757000000, 0x0000000757000000, 0x000000078a340000)  
  from space 104832K,  72% used [0x00000007909a0000, 0x0000000795378128, 0x0000000797000000)  
  to   space 104832K,   0% used [0x000000078a340000, 0x000000078a340000, 0x00000007909a0000)  
 concurrent mark-sweep generation total 1560576K, used 1441609K [0x0000000797000000, 0x00000007f6400000, 0x00000007f6400000)  
 concurrent-mark-sweep perm gen total 159744K, used 78413K [0x00000007f6400000, 0x0000000800000000, 0x0000000800000000)  
}  
2016-02-21T13:53:10.202+0800: 171469.482: [CMS-concurrent-abortable-preclean: 1.772/1.817 secs] [Times: user=4.94 sys=0.06, real=1.81 secs]  
2016-02-21T13:53:10.204+0800: 171469.483: [GC[YG occupancy: 497152 K (943744 K)]2016-02-21T13:53:10.204+0800: 171469.483: [Rescan (parallel) , 1.3691900 secs]2016-02-21T13:53:11.573+0800: 171470.853: [weak refs processing, 0.1009300 secs]2016-02-21T13:53:11.674+0800: 1714  
70.954: [class unloading, 0.0153470 secs]2016-02-21T13:53:11.689+0800: 171470.969: [scrub symbol table, 0.0110770 secs]2016-02-21T13:53:11.700+0800: 171470.980: [scrub string table, 0.0016360 secs] [1 CMS-remark: 1441609K(1560576K)] 1938761K(2504320K), 1.5079530 secs] [Ti  
mes: user=13.01 sys=0.08, real=1.51 secs]  
2016-02-21T13:53:11.712+0800: 171470.992: [CMS-concurrent-sweep-start]  
{Heap before GC invocations=88668 (full 45):  
 par new generation   total 943744K, used 914528K [0x0000000757000000, 0x0000000797000000, 0x0000000797000000)  
  eden space 838912K, 100% used [0x0000000757000000, 0x000000078a340000, 0x000000078a340000)  
  from space 104832K,  72% used [0x00000007909a0000, 0x0000000795378128, 0x0000000797000000)  
  to   space 104832K,   0% used [0x000000078a340000, 0x000000078a340000, 0x00000007909a0000)  
 concurrent mark-sweep generation total 1560576K, used 1441606K [0x0000000797000000, 0x00000007f6400000, 0x00000007f6400000)  
 concurrent-mark-sweep perm gen total 159744K, used 78413K [0x00000007f6400000, 0x0000000800000000, 0x0000000800000000)  
2016-02-21T13:53:11.775+0800: 171471.055: [GC2016-02-21T13:53:11.775+0800: 171471.055: [ParNew (promotion failed)  
Desired survivor size 53673984 bytes, new threshold 6 (max 6)  
- age   1:    4030872 bytes,    4030872 total  
- age   2:    5959704 bytes,    9990576 total  
- age   3:    4628680 bytes,   14619256 total  
- age   4:    8773080 bytes,   23392336 total  
- age   5:    7707144 bytes,   31099480 total  
- age   6:   10890224 bytes,   41989704 total  
: 914528K-&gt;907344K(943744K), 1.0312010 secs]2016-02-21T13:53:12.807+0800: 171472.086: [CMS2016-02-21T13:53:14.455+0800: 171473.735: [CMS-concurrent-sweep: 1.684/2.743 secs] [Times: user=3.69 sys=0.36, real=2.74 secs]  
 (concurrent mode failure): 1451903K-&gt;475795K(1560576K), 3.9644230 secs] 2356134K-&gt;475795K(2504320K), [CMS Perm : 78413K-&gt;78413K(159744K)], 4.9959570 secs] [Times: user=5.65 sys=0.34, real=5.00 secs]  
Heap after GC invocations=88669 (full 46):  
 par new generation   total 943744K, used 0K [0x0000000757000000, 0x0000000797000000, 0x0000000797000000)  
  eden space 838912K,   0% used [0x0000000757000000, 0x0000000757000000, 0x000000078a340000)  
  from space 104832K,   0% used [0x000000078a340000, 0x000000078a340000, 0x00000007909a0000)  
  to   space 104832K,   0% used [0x00000007909a0000, 0x00000007909a0000, 0x0000000797000000)  
 concurrent mark-sweep generation total 1560576K, used 475795K [0x0000000797000000, 0x00000007f6400000, 0x00000007f6400000)  
 concurrent-mark-sweep perm gen total 159744K, used 78413K [0x00000007f6400000, 0x0000000800000000, 0x0000000800000000)  
}</pre>
 </div>
 <div>
  两个原因：
 </div>
 <ul>
  <li>
   在 CMS 启动过程中，新生代提升速度过快，老年代收集速度赶不上新生代提升速度
  </li>
  <li>
   在 CMS 启动过程中，老年代碎片化严重，无法容纳新生代提升上来的大对象
  </li>
 </ul>
 <div>
  发送这种情况，应用线程将会全部停止（相当于网站这段时间无法响应用户请求），进行压缩式垃圾收集（回退到 Serial Old 算法）
 </div>
 <div>
 </div>
 <div>
  解决办法：
 </div>
 <ul>
  <li>
   新生代提升过快问题：（1）如果频率太快的话，说明空间不足，首先可以尝试调大新生代空间和晋升阈值。（2）如果内存有限，可以设置 CMS 垃圾收集在老年代占比达到多少时启动来减少问题发生频率（越早启动问题发生频率越低，但是会降低吞吐量，具体得多调整几次找到平衡点），参数如下：如果没有第二个参数，会随着 JVM 动态调节 CMS 启动时间
  </li>
 </ul>
 <div>
  -XX:CMSInitiatingOccupancyFraction=68 （默认是 68）
 </div>
 <div>
  -XX:+UseCMSInitiatingOccupancyOnly
 </div>
 <div>
 </div>
 <ul>
  <li>
   老年代碎片严重问题：（1）如果频率太快或者 Full GC 后空间释放不多的话，说明空间不足，首先可以尝试调大老年代空间（2）如果内存不足，可以设置进行 n 次 CMS 后进行一次压缩式 Full GC，参数如下：
  </li>
 </ul>
 <div>
  -XX:+UseCMSCompactAtFullCollection：允许在 Full GC 时，启用压缩式 GC
 </div>
 <div>
  -XX:CMSFullGCBeforeCompaction=n     在进行 n 次，CMS 后，进行一次压缩的 Full GC，用以减少 CMS 产生的碎片
 </div>
 <p>
  <strong>
   二. 提升失败（promotion failed）
  </strong>
 </p>
 <div>
  在 Minor GC 过程中，Survivor Unused 可能不足以容纳 Eden 和另一个 Survivor 中的存活对象， 那么多余的将被移到老年代， 称为过早提升（Premature Promotion）。 这会导致老年代中短期存活对象的增长， 可能会引发严重的性能问题。  再进一步， 如果老年代满了， Minor GC 后会进行 Full GC， 这将导致遍历整个堆， 称为提升失败（Promotion Failure）。
 </div>
 <div>
 </div>
 <div>
  提升失败日志：
 </div>
 <div>
  <div>
   <div>
    <pre class="brush: html; gutter: true">2016-01-07T18:54:26.948+0800: 18782.967: [GC2016-04-07T18:54:26.948+0800: 18782.967: [ParNew (promotion failed)  
Desired survivor size 117833728 bytes, new threshold 10 (max 10)  
- age   1:    6141680 bytes,    6141680 total  
- age   2:    6337936 bytes,   12479616 total  
- age   3:     549120 bytes,   13028736 total  
- age   4:      87768 bytes,   13116504 total  
- age   5:     221384 bytes,   13337888 total  
- age   6:     934168 bytes,   14272056 total  
- age   7:     146072 bytes,   14418128 total  
- age   8:     626064 bytes,   15044192 total  
- age   9:     398000 bytes,   15442192 total  
- age  10:     429616 bytes,   15871808 total  
: 1969227K-&gt;1929200K(2071808K), 0.7452140 secs]2016-01-07T18:54:27.693+0800: 18783.713: [CMS: 1394703K-&gt;632845K(2097152K), 4.0993640 secs] 3301676K-&gt;632845K(4168960K), [CMS Perm : 77485K-&gt;77473K(159744K)], 4.8450240 secs] [Times: user=5.18 sys=0.56, real=4.84 secs]  
Heap after GC invocations=5847 (full 7):  
 par new generation   total 2071808K, used 0K [0x00000006e9c00000, 0x0000000776400000, 0x0000000776400000)  
  eden space 1841664K,   0% used [0x00000006e9c00000, 0x00000006e9c00000, 0x000000075a280000)  
  from space 230144K,   0% used [0x0000000768340000, 0x0000000768340000, 0x0000000776400000)  
  to   space 230144K,   0% used [0x000000075a280000, 0x000000075a280000, 0x0000000768340000)  
 concurrent mark-sweep generation total 2097152K, used 632845K [0x0000000776400000, 0x00000007f6400000, 0x00000007f6400000)  
 concurrent-mark-sweep perm gen total 159744K, used 77473K [0x00000007f6400000, 0x0000000800000000, 0x0000000800000000)  
}</pre>
   </div>
  </div>
 </div>
 <div>
  提升失败原因：Minor GC 时发现 Survivor 空间放不下，而老年代的空闲也不够
 </div>
 <ul>
  <li>
   新生代提升太快
  </li>
  <li>
   老年代碎片太多，放不下大对象提升（表现为老年代还有很多空间但是，出现了 promotion failed）
  </li>
 </ul>
 <div>
  解决方法：
 </div>
 <div>
  两条和上面 concurrent mode failure 一样
 </div>
 <div>
  另一条，是因为 Survivor Unused 不足，那么可以尝试调大 Survivor 来尝试下
 </div>
 <p>
  <strong>
   三. 在 GC 的时候其他系统活动影响
  </strong>
 </p>
 <div>
  有些时候系统活动诸如内存换入换出（vmstat）、网络活动（netstat）、I/O （iostat）在 GC 过程中发生会使 GC 时间变长。
 </div>
 <div>
 </div>
 <div>
  前提是你的服务器上是有 SWAP 区域（用 top、 vmstat 等命令可以看出）用于内存的换入换出，那么操作系统可能会将 JVM 中不活跃的内存页换到 SWAP 区域用以释放内存给线程使用（这也透露出内存开始不够用了）。内存换入换出是一个开销巨大的磁盘操作，比内存访问慢好几个数量级。
 </div>
 <div>
 </div>
 <div>
  看一段 GC 日志：耗时 29.47 秒
 </div>
 <div>
  <pre class="brush: html; gutter: true">{Heap before GC invocations=132 (full 0):  
par new generation total 2696384K, used 2696384K [0xfffffffc20010000, 0xfffffffce0010000, 0xfffffffce0010000)  
eden space 2247040K, 100% used [0xfffffffc20010000, 0xfffffffca9270000, 0xfffffffca9270000)  
from space 449344K, 100% used [0xfffffffca9270000, 0xfffffffcc4940000, 0xfffffffcc4940000)  
to space 449344K, 0% used [0xfffffffcc4940000, 0xfffffffcc4940000, 0xfffffffce0010000)  
concurrent mark-sweep generation total 9437184K, used 1860619K [0xfffffffce0010000, 0xffffffff20010000, 0xffffffff20010000)  
concurrent-mark-sweep perm gen total 1310720K, used 511451K [0xffffffff20010000, 0xffffffff70010000, 0xffffffff70010000)  
2013-07-17T03:58:06.601-0700: 51522.120: [GC Before GC: : 2696384K-&gt;449344K(2696384K), 29.4779282 secs] 4557003K-&gt;2326821K(12133568K) ,29.4795222 secs] [Times: user=915.56 sys=6.35, real=29.48 secs]</pre>
 </div>
 <div>
  再看看此时的 vmstat 命令中 si、so 列的数值，如果数值大说明换入换出严重，这是内存不足的表现。
 </div>
 <div>
 </div>
 <div>
  解决方法：减少线程，这样可以降低内存换入换出；增加内存；如果是 JVM 内存设置过大导致线程所用内存不足，则适当调低 -Xmx 和 -Xms。
 </div>
 <p>
  <strong>
   四. JVM 的 bug
  </strong>
 </p>
 <div>
  这种原因就根据自己使用的 JDK 版本去查一下，如果是 JVM 的 bug，升级到解决的版本一般就能解决。
 </div>
 <p>
  <strong>
   五. 总结
  </strong>
 </p>
 <div>
  <strong>
  </strong>
  长时间停顿问题的排查及解决首先需要一定的信息和方法论：
 </div>
 <ul>
  <li>
   详细的 GC 日志
  </li>
  <li>
   借助 Linux 平台下的 iostat、vmstat、netstat、mpstat 等命令监控系统情况
  </li>
  <li>
   使用 GCHisto 这个 GC 图形用户界面工具，可以统计出 Minor GC 及 Full GC 频率及时长分布，可参考:
   <a class="external" href="http://blog.csdn.net/wenniuwuren/article/details/50760259" rel="nofollow" target="_blank">
    http://blog.csdn.net/wenniuwuren/article/details/50760259
   </a>
  </li>
  <li>
   查看 GC 日志中是否出现了上述的典型内存异常问题（promotion failed, concurrent mode failure），整体来说把上述两个典型内存异常情况控制在可接受的发生频率即可，对 CMS 碎片问题来说杜绝以上问题似乎不太可能，只能靠 G1 来解决了
  </li>
  <li>
   是不是 JVM 本身的 bug 导致的
  </li>
  <li>
   如果程序没问题，参数调了几次还是不能解决，可能说明流量太大，需要加机器把压力分散到更多 JVM 上
  </li>
 </ul>
 <p>
  <strong>
   六. 参考资料
  </strong>
 </p>
 <div>
  《Java 性能优化权威指南》
 </div>
 <div>
  <a class="external" href="https://blogs.oracle.com/poonam/entry/troubleshooting_long_gc_pauses" rel="nofollow" target="_blank">
   https://blogs.oracle.com/poonam/entry/troubleshooting_long_gc_pauses
  </a>
 </div>
 <!-- BEGIN #author-bio -->
 <!-- END #author-bio -->
</div>
</body></html>