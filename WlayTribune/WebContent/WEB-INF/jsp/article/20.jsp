<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  原文出处：
  <a href="http://www.liuinsect.com/2014/08/07/jdk1-8-abstractqueuedsynchronizer/" ref="nofollow" target="_blank">
   liuinsect
  </a>
 </div>
 <h2>
  前言：
 </h2>
 <p>
  Java中的FutureTask作为可异步执行任务并可获取执行结果而被大家所熟知，通常可以使用future.get()来获取线程的执行结果，在线程执行结束之前，get方法会一直阻塞状态，直到call()返回，其优点是使用线程异步执行任务的情况下还可以获取到线程的执行结果，但是FutureTask的以上功能却是依靠通过一个叫AbstractQueuedSynchronizer的类来实现，至少在JDK 1.5、JDK1.6版本是这样的（从1.7开始FutureTask已经被其作者Doug Lea修改为不再依赖AbstractQueuedSynchronizer实现了，这是JDK1.7的变化之一）。但是AbstractQueuedSynchronizer在JDK1.8中还有如下图所示的众多子类：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image" height="346" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image.png" width="846"/>
  </a>
  <br/>
  这些JDK中的工具类或多或少都被大家用过不止一次，比如ReentrantLock，我们知道ReentrantLock的功能是实现代码段的并发访问控制，也就是通常意义上所说的锁，在没有看到AbstractQueuedSynchronizer前，可能会以为它的实现是通过类似于synchronized，通过对对象加锁来实现的，但事实上它仅仅是一个工具类！没有使用更“高级”的机器指令，不是关键字，也不依靠JDK编译时的特殊处理，仅仅作为一个普普通通的类就完成了代码块的并发访问控制，这就更让人疑问它怎么实现的代码块的并发访问控制的了。那就让我们一起来仔细看下Doug Lea怎么去实现的这个锁。为了方便，本文中使用AQS代替AbstractQueuedSynchronizer。
 </p>
 <h2>
  细说AQS
 </h2>
 <p>
  在深入分析AQS之前，我想先从AQS的功能上说明下AQS，站在使用者的角度，AQS的功能可以分为两类：独占功能和共享功能，它的所有子类中，要么实现并使用了它独占功能的API，要么使用了共享锁的功能，而不会同时使用两套API，即便是它最有名的子类ReentrantReadWriteLock，也是通过两个内部类：读锁和写锁，分别实现的两套API来实现的，为什么这么做，后面我们再分析，到目前为止，我们只需要明白AQS在功能上有独占控制和共享控制两种功能即可。
 </p>
 <p>
  独占锁
  <br/>
  在真正对解读AQS之前，我想先从使用了它独占控制功能的子类ReentrantLock说起，分析ReentrantLock的同时看一看AQS的实现，再推理出AQS独特的设计思路和实现方式。最后，在看其共享控制功能的实现。
 </p>
 <p>
  对于ReentrantLock，使用过的同学应该都知道，通常是这么用它的：
 </p>
 <pre class="brush: java; gutter: true">reentrantLock.lock()
//do something
reentrantLock.unlock()</pre>
 <p>
  ReentrantLock会保证 do something在同一时间只有一个线程在执行这段代码，或者说，同一时刻只有一个线程的lock方法会返回。其余线程会被挂起，直到获取锁。从这里可以看出，其实ReentrantLock实现的就是一个独占锁的功能：有且只有一个线程获取到锁，其余线程全部挂起，直到该拥有锁的线程释放锁，被挂起的线程被唤醒重新开始竞争锁。没错，ReentrantLock使用的就是AQS的独占API实现的。
  <br/>
  那现在我们就从ReentrantLock的实现开始一起看看重入锁是怎么实现的。
  <br/>
  首先看lock方法：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-1.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [1]" height="77" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-1.png" width="472"/>
  </a>
 </p>
 <p>
  如FutureTask（JDK1.6）一样，ReentrantLock内部有代理类完成具体操作，ReentrantLock只是封装了统一的一套API而已。值得注意的是，使用过ReentrantLock的同学应该知道，ReentrantLock又分为公平锁和非公平锁之分，所以，ReentrantLock内部只有有两个sync的实现：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-2.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [2]" height="224" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-2.png" width="580"/>
  </a>
 </p>
 <p>
  公平锁：每个线程抢占锁的顺序为先后调用lock方法的顺序依次获取锁，类似于排队吃饭。
 </p>
 <p>
  非公平锁：每个线程抢占锁的顺序不定，谁运气好，谁就获取到锁，和调用lock方法的先后顺序无关，类似于堵车时，加塞的那些XXXX。
 </p>
 <p>
  到这里，通过ReentrantLock的功能和锁的所谓排不排队的方式，我们是否可以这么猜测ReentrantLock或者AQS的实现（现在不清楚谁去实现这些功能）：有那么一个被volatile修饰的标志位叫做key，用来表示有没有线程拿走了锁，或者说，锁还存不存在，还需要一个线程安全的队列，维护一堆被挂起的线程，以至于当锁被归还时，能通知到这些被挂起的线程，可以来竞争获取锁了。
  <br/>
  至于公平锁和非公平锁，唯一的区别是在获取锁的时候是直接去获取锁，还是进入队列排队的问题了。为了验证我们的猜想，我们继续看一下ReentrantLock中公平锁的实现、
 </p>
 <p>
  ReentrantLock的lock方法会调用到公平锁（FairSync）的lock方法中，FairSync的lock方法时这样的：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-3.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [3]" height="102" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-3.png" width="353"/>
  </a>
 </p>
 <p>
  调用到了AQS的acquire方法：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-4.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [4]" height="131" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-4.png" width="506"/>
  </a>
 </p>
 <p>
  从方法名字上看，语义是，尝试获取一把，获取不到尝试将waiter放到队列中，这和我们猜测的好像很类似。
 </p>
 <p>
  先看下tryAcquire方法:
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-5.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [5]" height="81" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-5.png" width="437"/>
  </a>
 </p>
 <p>
  留空了，是想留给子类去实现（既然要给子类实现，应该用抽象方法，但是Doug Lea没有这么做，原因是AQS有两种功能，面向两种使用场景，需要给子类定义的方法都是抽象方法了，会导致子类无论如何都需要实现另外一种场景的抽象方法，显然，这对子类来说是不友好的。）
 </p>
 <p>
  看下FairSync的tryAcquire方法：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-6.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [6]" height="428" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-6.png" width="509"/>
  </a>
 </p>
 <p>
  getState方法是AQS的方法，因为在AQS里面有个叫statede的标志位 :
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-7.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [7]" height="392" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-7.png" width="587"/>
  </a>
 </p>
 <p>
  事实上，这个state就是前面我们猜想的那个“key”！
 </p>
 <p>
  回到tryAcquire方法：
 </p>
 <pre class="brush: java; gutter: true">protected final boolean tryAcquire(int acquires) {
	final Thread current = Thread.currentThread();//获取当前线程
	int c = getState();  //获取父类AQS中的标志位
	if (c == 0) {
		if (!hasQueuedPredecessors() &amp;&amp; //如果队列中没有其他线程  说明没有线程正在占有锁！
			compareAndSetState(0, acquires)) { //修改一下状态位，注意：这里的acquires是在lock的时候传递来的，从上面的图中可以知道，这个值是写死的1
			setExclusiveOwnerThread(current);//如果通过CAS操作将状态为更新成功则代表当前线程获取锁，因此，将当前线程设置到AQS的一个变量中，说明这个线程拿走了锁。
			return true;
		}
	}
	else if (current == getExclusiveOwnerThread()) {//如果不为0 意味着，锁已经被拿走了，但是，因为ReentrantLock是重入锁，
						 //是可以重复lock,unlock的，只要成对出现行。一次。这里还要再判断一次 获取锁的线程是不是当前请求锁的线程。
		int nextc = c + acquires;//如果是的，累加在state字段上就可以了。
		if (nextc &lt; 0)
			throw new Error("Maximum lock count exceeded");
		setState(nextc);
		return true;
	}
	return false;
}</pre>
 <p>
  到此，如果如果获取锁，tryAcquire返回true，反之，返回false。回到AQS的acquire方法
 </p>
 <p>
  如果没有获取到锁，按照我们的描述，应该讲当前线程放到队列中区，只不过，在放之前，需要做些包装。
 </p>
 <p>
  先看addWaiter方法：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-9.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [9]" height="321" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-9.png" width="551"/>
  </a>
 </p>
 <p>
  用当前线程去构造一个Node对象，mode是一个表示Node类型的字段，仅仅表示这个节点是独占的，还是共享的，或者说，AQS的这个队列中，哪些节点是独占的，哪些是共享的。
 </p>
 <p>
  这里lock调用的是AQS独占的API，当然，可以写死是独占状态的节点。
  <br/>
  创建好节点后，将节点加入到队列尾部，此处，在队列不为空的时候，先尝试通过cas方式修改尾节点为最新的节点，如果修改失败，意味着有并发，这个时候才会进入enq中死循环，“自旋”方式修改。
 </p>
 <p>
  将线程的节点接入到队里中后，当让还需要做一件事:将当前线程挂起！这个事，由acquireQueued来做。
 </p>
 <p>
  在解释acquireQueued之前，我们需要先看下AQS中队列的内存结构，我们知道，队列由Node类型的节点组成，其中至少有两个变量，一个封装线程，一个封装节点类型。
  <br/>
  而实际上，它的内存结构是这样的（第一次节点插入时，第一个节点是一个空节点，代表有一个线程已经获取锁，事实上，队列的第一个节点就是代表持有锁的节点）：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-10.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [10]" height="88" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-10.png" width="525"/>
  </a>
 </p>
 <p>
  黄色节点为队列默认的头节点，每次有线程竞争失败，进入队列后其实都是插入到队列的尾节点（tail节点）后面。这个从enq方法可以看出来，上文中有提到enq方法为将节点插入队列的方法:
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-11.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [11]" height="342" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-11.png" width="430"/>
  </a>
 </p>
 <p>
  再回来看看
 </p>
 <pre class="brush: java; gutter: true">final boolean acquireQueued(final Node node, int arg) {
	boolean failed = true;
	try {
		boolean interrupted = false;
		for (;;) {
		final Node p = node.predecessor();
		if (p == head &amp;&amp; tryAcquire(arg)) {//如果当前的节点是head说明他是队列中第一个“有效的”节点，因此尝试获取，上文中有提到这个类是交给子类去扩展的。
			setHead(node);//成功后，将上图中的黄色节点移除，Node1变成头节点。
			p.next = null; // help GC
			failed = false;
			return interrupted;
		}
		if (shouldParkAfterFailedAcquire(p, node) &amp;&amp; //否则，检查前一个节点的状态为，看当前获取锁失败的线程是否需要挂起。
			parkAndCheckInterrupt()) //如果需要，借助JUC包下的LockSopport类的静态方法Park挂起当前线程。知道被唤醒。
			interrupted = true;
		}
	} finally {
		if (failed) //如果有异常
		cancelAcquire(node);// 取消请求，对应到队列操作，就是将当前节点从队列中移除。
	}
}</pre>
 <p>
  这块代码有几点需要说明：
  <br/>
  1. Node节点中，除了存储当前线程，节点类型，队列中前后元素的变量，还有一个叫waitStatus的变量，改变量用于描述节点的状态，为什么需要这个状态呢？
  <br/>
  原因是：AQS的队列中，在有并发时，肯定会存取一定数量的节点，每个节点 代表了一个线程的状态，有的线程可能可能“等不及”获取锁了，需要放弃竞争，退出队列，有点线程在等待一些条件满足，满足后才恢复执行（这里的描述很像某个J.U.C包下的工具类，ReentrankLock的Condition，事实上，Condition同样也是AQS的子类）等等，总之，各个线程有各个线程的状态，但总需要一个变量买描述它，这个变量就叫waitStatus,它有四种状态：
  <br/>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-12.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [12]" height="261" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-12.png" width="615"/>
  </a>
  <br/>
  分别表示：
  <br/>
  1. 节点取消
  <br/>
  2. 节点等待触发
  <br/>
  3. 节点等待条件
  <br/>
  4. 节点状态需要向后传播。
 </p>
 <p>
  只有当前节点的前一个节点为SIGNAL时，才能当前节点才能被挂起。
 </p>
 <p>
  2. 对线程的挂起及唤醒操作是通过使用UNSAFE类调用JNI方法实现的。当然，还提供了挂起指定时间后唤醒的API，在后面我们会讲到。
 </p>
 <p>
  到此为止，一个线程对于锁的一次竞争才告一段落，结果又两种，要么成功获取到锁（不用进入到AQS队列中，），要么，获取失败，被挂起，等待下次唤醒后继续循环尝试获取锁，值得注意的是，AQS的队列为FIFO队列，所以，每次及时被CPU假唤醒，且当前线程不是出在头节点的位置，也是会被挂起的。AQS通过这样的方式，实现了竞争的排队策略。
 </p>
 <p>
  看完了获取锁，在看看释放锁，具体看代码之前，我们可以先继续猜下，释放操作需要做哪些事情：
  <br/>
  1. 因为获取锁的线程的节点，此时在AQS的头节点位置，所以，可能需要将头节点移除。
  <br/>
  2. 而应该是直接释放锁，然后找到AQS的头节点，通知它可以来竞争锁了。
  <br/>
  是不是这样呢?我们继续来看下，同样我们用ReentrantLock的FairSync来说明：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-13.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [13]" height="76" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-13.png" width="287"/>
  </a>
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-14.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [14]" height="202" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-14.png" width="407"/>
  </a>
 </p>
 <p>
  unlock方法调用了AQS的release方法，同样传入了参数1，和获取锁的相应对应，获取一个锁，标示为+1，释放一个锁，标志位-1
 </p>
 <p>
  同样，release为空方法，子类自己实现逻辑：
 </p>
 <pre class="brush: java; gutter: true">protected final boolean tryRelease(int releases) {
	int c = getState() - releases;
	if (Thread.currentThread() != getExclusiveOwnerThread()) //如果释放的线程和获取锁的线程不是同一个，抛出非法监视器状态异常。
		throw new IllegalMonitorStateException();
	boolean free = false;
	if (c == 0) {//因为是重入的关系，不是每次释放锁c都等于0，直到最后一次释放锁时，才通知AQS不需要再记录哪个线程正在获取锁。
		free = true;
		setExclusiveOwnerThread(null);
	}
	setState(c);
	return free;
}</pre>
 <p>
  释放锁，成功后，找到AQS的头节点，并唤醒它即可：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-15.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [15]" height="578" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-15.png" width="508"/>
  </a>
 </p>
 <p>
  值得注意的是，寻找的顺序是从队列尾部开始往前去找的最前面的一个waitStatus小于0的节点。
 </p>
 <p>
  到此，ReentrantLock的lock和unlock方法已经基本解析完毕了，唯独还剩下一个非公平锁NonfairSync没说，其实， 它和公平锁的唯一区别就是获取锁的方式不同，一个是按前后顺序一次获取锁，一个是抢占式的获取锁，那ReentrantLock是怎么实现的呢？再看两段代码：
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-16.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [16]" height="359" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-16.png" width="702"/>
  </a>
 </p>
 <p>
  非公平锁的lock方法的处理方式是: 在lock的时候先直接cas修改一次state变量（尝试获取锁），成功就返回，不成功再排队，从而达到不排队直接抢占的目的。
 </p>
 <p>
  <a class="external" href="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-17.png" rel="lightbox[22102] nofollow" target="_blank" title="深度解析Java8 – AbstractQueuedSynchronizer的实现分析（上）">
   <img alt="Image [17]" height="147" src="http://www.liuinsect.com/wp-content/uploads/2014/08/Image-17.png" width="597"/>
  </a>
 </p>
 <p>
  而对于公平锁：则是老老实实的开始就走AQS的流程排队获取锁。如果前面有人调用过其lock方法，则排在队列中前面，也就更有机会更早的获取锁，从而达到“公平”的目的。
 </p>
 <h2>
  总结：
 </h2>
 <p>
  这篇文章，我们从ReentrantLock出发，完整的分析了AQS独占功能的API及内部实现，总的来说，思路其实并不复杂，还是使用的标志位+队列的方式，记录获取锁、竞争锁、释放锁等 一系列锁的状态，或许用更准确一点的描述的话，应该是使用的标志位+队列的方式，记录锁，竞争，释放等一系列独占的状态，因为站在AQS的层面state可以表示锁，也可以表示其他状态，它并不关心它的子类把它变成一个什么工具类，而只是提供了一套维护一个独占状态。甚至，最准确的是AQS只是维护了一个状态，因为，别忘了，它还有一套共享状态的API，所以，AQS只是维护一个状态，一个控制各个线程何时可以访问的状态，它只对状态负责，而这个状态表示什么含义，由子类自己去定义。
 </p>
 <!-- BEGIN #author-bio -->
 <!-- END #author-bio -->
</div>
</body></html>