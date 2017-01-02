<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html><body><div class="entry">
 <div class="copyright-area">
  本文由
  <a href="http://www.importnew.com">
   ImportNew
  </a>
  -
  <a href="http://www.importnew.com/author/qiaoyongqi">
   乔永琪
  </a>
  翻译自
  <a class="external" href="http://www.javaworld.com/article/2853780/java-app-dev/socket-programming-for-scalable-systems.html" rel="nofollow" target="_blank">
   javaworld
  </a>
  。欢迎加入
  <a class="external" href="http://group.jobbole.com/category/feedback/trans-team/" rel="nofollow" target="_blank">
   翻译小组
  </a>
  。转载请见文末要求。
 </div>
 <h3>
  从简单I/O到异步非阻塞channel的Java Socket模型演变之旅
 </h3>
 <p>
  上世纪九十年代后期，我在一家在线视频游戏工资工作，在哪里我主要的工作就是编写Unix Unix Berkley Socket和Windows WinSock代码。我的任务是确保视频游戏客户端和一个游戏服务器通信。很幸运有这样的机会写一些Java Socket代码，我对Java流式网络编程和简洁明了的API着迷。这一点都不让人惊讶，Java最初就是设计促进智能设备之间的通信，这一点很好的转移到了桌面应用和服务器应用。
 </p>
 <p>
  1996年，JavaWorld刊登了Qusay H. Mahmoud的文章《
  <a class="external" href="http://www.javaworld.com/article/2077322/core-java/sockets-programming-in-java-a-tutorial.html" rel="nofollow" target="_blank">
   Sockets programming in Java: A tutorial
  </a>
  》。文章概述了Java的Socket编程模型。从那以后的18年，这个模型少有变化。这篇文章依然是网络系统Java socket编程的入门经典。我将在此基础之上，首先列出一个简单的客户端/服务器例子，开启Java I/O谦卑之旅。此例展示来自java.io包和NIO——Java1.4引起的新的非阻塞I/O API的特性，最后一个例子会涉及Java 7引入的 NIO2 某些特性。
 </p>
 <h3>
  Java的Socket编程：TCP和UDP
 </h3>
 <p>
  Socket编程拆分为两个系统之间的相互通信，网络通信有两种方式：ransport Control Protocol（TCP）和User Datagram Protocol（UDP）。TCP和UDP用途不一，并且有各自独特的约束：
 </p>
 <ul>
  <li>
   TCP协议相对简单稳定，可以帮助客户端与一台服务器建立连接，这样两个系统就可以通信。在TCP协议中，每个实体都能保证其通信载荷（communication payload）会被接受。
  </li>
  <li>
   UDP是一种非连接协议，适用于那些无需保证每个包都能抵达终点的场景，比如流媒体。
  </li>
 </ul>
 <p>
  如何区分这两者的差异？试想，倘若你在自己喜欢的网站上观看流媒体视频，这时掉帧会发生什么。你是倾向于客户端放缓视频接收丢失的帧，还是继续观看视频呢？典型的流媒体协议采用UDP协议，因为TCP协议保障传输，HTTP、FTP、SMTP、POP3等协议会选择TCP。
 </p>
 <h3>
  以往的Socket编程
 </h3>
 <p>
  早在NIO以前，Java TCP客户端socket代码主要由java.net.Socket类来实现。下面的代码开启了一个对服务器的连接：
 </p>
 <pre class="brush: java; gutter: true">Socket socket = new Socket( server, port );</pre>
 <p>
  一旦Socket实例与服务器相连，我们就可以获得服务器端的输入输出流。输入流用来读取服务器端的数据，输出流用来将数据写回到服务器端。可以执行以下的方法获取输入输出流:
 </p>
 <pre class="brush: java; gutter: true">InputStream in = socket.getInputStream();
OutputStream out = socket.getOutputStream();</pre>
 <p>
  这是基本的流——用来读取或者写入一个文件的流是相同的，所以我们能够将其转换成最好的形式服务于用例中。比如，我们可以用一个PrintStream 包装 OutputStream，这样我们就能轻易地用println()等方法对文本进行写的操作。再比如，我们用BufferedReader包装 InputStream，再通过InputStreamReader可以很容易的用readLine()等方法对文本进行读操作。
 </p>
 <h3>
  Java I/O示例第一部分：HTTP客户端
 </h3>
 <p>
  通过一个简短的例子来看如何执行HTTP GET获取一个HTTP服务。HTTP比本例更加复杂成熟，在我们只写一个客户端代码去处理简单案例。发出一个请求，从服务器端获取一个资源，同时服务器端返回响应，并关闭流。本案例所需的步骤如下：
 </p>
 <ol>
  <li>
   创建端口为80的网络服务器所对应的客户端Socket。
  </li>
  <li>
   从服务器端获取一个PrintStream，同时发送一个GET PATH HTTP/1.0请求，其中PATH就是服务器上的请求资源。比如，假设你想打开一个网站根目录，那么path就是 / 。
  </li>
  <li>
   获取服务器端的InputStream，用一个BufferedReader将其包装，然后按行读取响应。
  </li>
 </ol>
 <h4>
  列表1、 SimpleSocketClientExample.java
 </h4>
 <pre class="brush: java; gutter: true">package com.geekcap.javaworld.simplesocketclient;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.Socket;

public class SimpleSocketClientExample
{
    public static void main( String[] args )
    {
        if( args.length &lt; 2 )
        {
            System.out.println( "Usage: SimpleSocketClientExample &lt;server&gt; &lt;path&gt;" );
            System.exit( 0 );
        }
        String server = args[ 0 ];
        String path = args[ 1 ];

        System.out.println( "Loading contents of URL: " + server );

        try
        {
            // 创建与端口为80的网络服务器对应的客户端socket
            Socket socket = new Socket( server, 80 );

            //从服务器端获取一个PrintStream
            PrintStream out = new PrintStream( socket.getOutputStream() );
            //获取服务器端的InputStream，用一个BufferedReader将其包装
            BufferedReader in = new BufferedReader( new InputStreamReader( socket.getInputStream() ) );

            //发送一个GET PATH HTTP/1.0请求到服务器端
            out.println( "GET " + path + " HTTP/1.0" );
            out.println();

            //按行的读取服务器端的返回的响应数据
            String line = in.readLine();
            while( line != null )
            {
                System.out.println( line );
                line = in.readLine();
            }

            // 关闭流
            in.close();
            out.close();
            socket.close();
        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
    }
}</pre>
 <p>
  列表1接受两个命令行参数：需要连接的服务器，需要取回的资源。创建一个Socket指向服务器端，并且显式地为其指定端口号80，接着程序会指向这个命令：
 </p>
 <pre class="brush: shell; gutter: true">GET PATH HTTP/1.0</pre>
 <p>
  比如
 </p>
 <pre class="brush: shell; gutter: true">GET / HTTP/1.0</pre>
 <h3>
  这个过程中发生了什么？
 </h3>
 <p>
  当你准备从一个web服务器获取一个网页，比如 www.google.com， HTTP client利用DNS服务器去获取服务器地址：从最高域名服务器开始查询com域名，哪里存有 www.google.com 的权威域名服务器，接着 HTTP client询问域名服务器 www.google.com 的IP地址。接下来，它会打开一个Socket通向端口80的服务器。最后， HTTP Client执行特定的HTTP方法，比如GET、POST、PUT、DELETE、HEAD 或者OPTI/ONS。每种方法都有自己的语法，如上述的代码列表中，GET方法后面依次需要一个path、HTTP/版本号、一个空行。如果想加入 HTTP headers，我们必须在进入新的一行之前完成。
 </p>
 <p>
  在列表1中，获取了一个 OutputStream，并用 PrintStream 包装了它，这样我们就能容易的执行基于文本的命令。 同样，从 InputStream 获取的代码，InputStreamReader 包装之后，流被转化成一个Reader，再用 BufferedReader 包装。这样我们就能用PrintStream执行GET方法，用BufferedReader 按行读取响应直到获取的响应为 null 时结束，最后关闭Socket。
 </p>
 <p>
  现在我们执行这个类，传入以下的参数：
 </p>
 <pre class="brush: java; gutter: true">java com.geekcap.javaworld.simplesocketclient.SimpleSocketClientExample www.javaworld.com /</pre>
 <p>
  你应该能够看到类似下面的输出：
 </p>
 <pre class="brush: shell; gutter: true">Loading contents of URL: www.javaworld.com
HTTP/1.1 200 OK
Date: Sun, 21 Sep 2014 22:20:13 GMT
Server: Apache
X-Gas_TTL: 10
Cache-Control: max-age=10
X-GasHost: gas2.usw
X-Cooking-With: Gasoline-Local
X-Gasoline-Age: 8
Content-Length: 168
Last-Modified: Tue, 24 Jan 2012 00:09:09 GMT
Etag: "60001b-a8-4b73af4bf3340"
Content-Type: text/html
Vary: Accept-Encoding
Connection: close

&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
	&lt;meta charset="utf-8" /&gt;
	&lt;title&gt;Gasoline Test Page&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;br&gt;&lt;br&gt;
&lt;center&gt;Success&lt;/center&gt;
&lt;/body&gt;
&lt;/html&gt;</pre>
 <p>
  本输出显示了JavaWorld网站测试页面，网页HTTP version 1.1，响应200 OK.
 </p>
 <h2>
  Java I/O示例第二部分：HTTP服务器
 </h2>
 <p>
  刚才我们说了客户端，幸运的是，服务器端的通信也是很容易。从一个简单的视角看，处理过程如下:
 </p>
 <ol>
  <li>
   创建一个ServerSocket，并指定一个监听端口。
  </li>
  <li>
   调用 ServerSocket的 accept() 方法监听来自客户端的连接。
  </li>
  <li>
   一旦有客户端连接服务器，accept() 方法通过服务器与客户端通信，返回一个Socket。在客户端用过同样的Socket类，那么处理过程相同，获取 InputStream 读取客户端信息，OutputStream 写数据到客户端。
  </li>
  <li>
   如果服务器需要扩展，你需要将Socket传给其他的线程去处理，因此服务器可以持续的监听后来的连接。
  </li>
  <li>
   再次调用 ServerSocket的 accept() 方法监听其它连接。
  </li>
 </ol>
 <p>
  正如你所看到的，NIO处理此场景略有不同。可以直接创建ServerSocket，并将一个端口号传给它用于监听（关于 ServerSocketFactory 的更多信息会在后面讨论）：
 </p>
 <pre class="brush: java; gutter: true">ServerSocket serverSocket = new ServerSocket( port );</pre>
 <p>
  通过 accept() 方法接收传入的连接：
 </p>
 <pre class="brush: java; gutter: true">Socket socket = serverSocket.accept();
// 处理连接……</pre>
 <h3>
  多线程Socket编程
 </h3>
 <p>
  在如下的列表2中，所有的服务器代码放在一起组成一个更加健壮的例子，本例中线程处理多个请求。服务器是一个ECHO服务器，就是说会将所有接收到的消息返回。
 </p>
 <p>
  列表2中的例子不是很复杂，但已经提前介绍了一部分NIO的内容。在线程代码上花费一些精力，是为了构建一个处理多并发请求的服务器。
 </p>
 <h4>
  列表2、SimpleSocketServer.java
 </h4>
 <pre class="brush: java; gutter: true">package com.geekcap.javaworld.simplesocketclient;

import java.io.BufferedReader;
import java.io.I/OException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class SimpleSocketServer extends Thread
{
    private ServerSocket serverSocket;
    private int port;
    private boolean running = false;

    public SimpleSocketServer( int port )
    {
        this.port = port;
    }

    public void startServer()
    {
        try
        {
            serverSocket = new ServerSocket( port );
            this.start();
        }
        catch (I/OException e)
        {
            e.printStackTrace();
        }
    }

    public void stopServer()
    {
        running = false;
        this.interrupt();
    }

    @Override
    public void run()
    {
        running = true;
        while( running )
        {
            try
            {
                System.out.println( "Listening for a connection" );

                // 调用 accept() 处理下一个连接
                Socket socket = serverSocket.accept();

                // 向 RequestHandler 线程传递socket对象进行处理
                RequestHandler requestHandler = new RequestHandler( socket );
                requestHandler.start();
            }
            catch (I/OException e)
            {
                e.printStackTrace();
            }
        }
    }

    public static void main( String[] args )
    {
        if( args.length == 0 )
        {
            System.out.println( "Usage: SimpleSocketServer &lt;port&gt;" );
            System.exit( 0 );
        }
        int port = Integer.parseInt( args[ 0 ] );
        System.out.println( "Start server on port: " + port );

        SimpleSocketServer server = new SimpleSocketServer( port );
        server.startServer();

        // 1分钟后自动关闭
        try
        {
            Thread.sleep( 60000 );
        }
        catch( Exception e )
        {
            e.printStackTrace();
        }

        server.stopServer();
    }
}

class RequestHandler extends Thread
{
    private Socket socket;
    RequestHandler( Socket socket )
    {
        this.socket = socket;
    }

    @Override
    public void run()
    {
        try
        {
            System.out.println( "Received a connection" );

            // 获取输入和输出流
            BufferedReader in = new BufferedReader( new InputStreamReader( socket.getInputStream() ) );
            PrintWriter out = new PrintWriter( socket.getOutputStream() );

            // 向客户端写出头信息
            out.println( "Echo Server 1.0" );
            out.flush();

            // 向客户端回写信息，直到客户端关闭连接或者收到空行
            String line = in.readLine();
            while( line != null &amp;&amp; line.length() &gt; 0 )
            {
                out.println( "Echo: " + line );
                out.flush();
                line = in.readLine();
            }

            // 关闭自己的连接
            in.close();
            out.close();
            socket.close();

            System.out.println( "Connection closed" );
        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
    }
}</pre>
 <p>
  在列表2中，我们创建了一个新的 SimpleSocketServer 实例，并开启了这个服务器。继承 Thread 的 SimpleSocketServer 创建一个新的线程，处理存在于 run() 方法中的阻塞方法 accept() 调用。
 </p>
 <p>
  run() 方法中存在一个循环，用来接收客户端请求，并创建RequestHandler线程去处理这些请求。再次强调，这是一个相对简单的编程，但涉及了相当的线程编程。
 </p>
 <p>
  RequestHandler 处理客户端通信代码与列表1相似：PrintStream 包装后的 OutputStream 更容易进行写操作。同 样，BufferedReader 包装后的InputStream 更易于读取。只要服务器在跑，RequestHandler 就会将客户端的信息按行读取，并将它们返回给客户端。如果客户端发过来的是空行，那对话就结束了，RequestHandler 关闭Socket 。
 </p>
 <h3>
  NIO、NIO2 Socket编程
 </h3>
 <p>
  对于多数应用而言，Java基础的Socket编程，我们已经做了充分的探讨。对于涉及到高强度的 I/O 或者异步输入输出，大家就有了熟悉Java NIO和NIO.2中非阻塞API的需要。
 </p>
 <p>
  JDK1.4 NIO包提供了如下重要特性：
 </p>
 <ul>
  <li>
   <strong>
    Channel
   </strong>
   被设计用来支持块（bulk）转移，从一个NIO转到另一个NIO。
  </li>
  <li>
   <strong>
    Buffer
   </strong>
   提供了连续的内存块，由一组简单的操作提供接口。
  </li>
  <li>
   <strong>
    非阻塞I/O 是
   </strong>
   一组class文件，它们可以将 Channel 开放给普通的I/O资源，比如文件和Socket。
  </li>
 </ul>
 <p>
  用NIO编码时，你可以打开一个到目的地的Channel，接着从目的地读取数据到一个buffer中；写入数据到一个buffer中，接着将其发送到目的地。我会创建一个Socket，并为此获取一个Channel。但首先让我们回顾一下buffer的处理流程：
 </p>
 <ol>
  <li>
   写数据到一个buffer中。
  </li>
  <li>
   调用buffer的 flip() 方法准备读的操作。
  </li>
  <li>
   从buffer中读取数据。
  </li>
  <li>
   调用buffer中的 clear() 或者 compact() 方法准备读取更多的数据。
  </li>
 </ol>
 <p>
  当数据写入buffer后，buffer知道写入其中的数据量。它维护了三个属性，在读模式和写模式中其含义不尽相同。
 </p>
 <ul>
  <li>
   <strong>
    Position
   </strong>
   ：在写模式中，初始position值为0，它存储的是写入buffer后的当前位置；一旦flip一个buffer使其进入读模式，它会将位置的值重置为0，然后存储读取buffer后的当前位置。
  </li>
  <li>
   <strong>
    Capacity
   </strong>
   ：指的是buffer的固定大小。
  </li>
  <li>
   <strong>
    Limit
   </strong>
   ：在写模式中，limit定义了写入buffer的数据大小；在读模式中，limit定义了可以从buffer中读取的数据大小。
  </li>
 </ul>
 <h3>
  Java I/O示例第三部分：基于NIO.2的ECHO服务器
 </h3>
 <p>
  JDK 7引入的NIO.2添加了非阻塞I/O库去支持文件系统任务，比如 java.nio.file 包和 java.nio.file.Path 类，并提供了一个 新的文件系统API。记住，我们采用IO.2 AsynchronousServerSocketChannel 写一个新的ECHO服务器。
 </p>
 <p style="padding-left: 30px;">
  ”NIO在提供处理性能方法大放异彩，但NIO的结果跟底层平台紧密相连。比如，或许你会发现，NIO加速应用性能不光取决于OS，还跟特定的JVM有关，主机的虚拟化上下文、大存储特性、甚至数据……”
  <br/>
  ——摘自”
  <a class="external" href="http://www.javaworld.com/article/2078654/java-se/five-ways-to-maximize-java-nio-and-nio-2.html" rel="nofollow" target="_blank">
   Five ways to maximize Java NIO and NIO.2
  </a>
  “
 </p>
 <p>
  AsynchronousServerSocketChannel 提供了一个非阻塞异步Channel作为流定向监听的Socket。为了用这个Channel，首先需要执行它的 open() 静态方法。然后调用 bind() 为其绑定一个端口号。接着，将一个实现CompletionHandler接口的类传给 accept() 并执行。多数时候，你会发现 handler作为匿名内部类被创建。
 </p>
 <p>
  列表3显示新的异步ECHO服务器源码。
 </p>
 <h4>
  列表3、SimpleSocketServer.java
 </h4>
 <pre class="brush: java; gutter: true">package com.geekcap.javaworld.nio2;

import java.io.I/OException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.AsynchronousServerSocketChannel;
import java.nio.channels.AsynchronousSocketChannel;
import java.nio.channels.CompletionHandler;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

public class NioSocketServer
{
    public NioSocketServer()
    {
        try
        {
            // 创建一个 AsynchronousServerSocketChannel 侦听 5000 端口
            final AsynchronousServerSocketChannel listener =
                    AsynchronousServerSocketChannel.open().bind(new InetSocketAddress(5000));

            // 侦听新的请求
            listener.accept( null, new CompletionHandler&lt;AsynchronousSocketChannel,Void&gt;() {

                @Override
                public void completed(AsynchronousSocketChannel ch, Void att)
                {
                    // 接受下一个连接
                    listener.accept( null, this );

                    // 向客户端发送问候信息
                    ch.write( ByteBuffer.wrap( "Hello, I am Echo Server 2020, let's have an engaging conversation!n".getBytes() ) );

                    // 分配(4K)字节缓冲用于从客户端读取信息
                    ByteBuffer byteBuffer = ByteBuffer.allocate( 4096 );
                    try
                    {
                        // Read the first line
                        int bytesRead = ch.read( byteBuffer ).get( 20, TimeUnit.SECONDS );

                        boolean running = true;
                        while( bytesRead != -1 &amp;&amp; running )
                        {
                            System.out.println( "bytes read: " + bytesRead );

                            // 确保有读取到数据
                            if( byteBuffer.position() &gt; 2 )
                            {
                                // 准备缓存进行读取
                                byteBuffer.flip();

                                // 把缓存转换成字符串
                                byte[] lineBytes = new byte[ bytesRead ];
                                byteBuffer.get( lineBytes, 0, bytesRead );
                                String line = new String( lineBytes );

                                // Debug
                                System.out.println( "Message: " + line );

                                // 向调用者回写
                                ch.write( ByteBuffer.wrap( line.getBytes() ) );

                                // 准备缓冲进行写操作
                                byteBuffer.clear();

                                // 读取下一行
                                bytesRead = ch.read( byteBuffer ).get( 20, TimeUnit.SECONDS );
                            }
                            else
                            {
                                // 在我们的协议中，空行表示会话结束
                                running = false;
                            }
                        }
                    }
                    catch (InterruptedException e)
                    {
                        e.printStackTrace();
                    }
                    catch (ExecutionException e)
                    {
                        e.printStackTrace();
                    }
                    catch (TimeoutException e)
                    {
                        // 用户达到20秒超时，关闭连接
                        ch.write( ByteBuffer.wrap( "Good Byen".getBytes() ) );
                        System.out.println( "Connection timed out, closing connection" );
                    }

                    System.out.println( "End of conversation" );
                    try
                    {
                        // 如果需要，关闭连接
                        if( ch.isOpen() )
                        {
                            ch.close();
                        }
                    }
                    catch (I/OException e1)
                    {
                        e1.printStackTrace();
                    }
                }

                @Override
                public void failed(Throwable exc, Void att) {
                    ///...
                }
            });
        }
        catch (I/OException e)
        {
            e.printStackTrace();
        }
    }

    public static void main( String[] args )
    {
        NioSocketServer server = new NioSocketServer();
        try
        {
            Thread.sleep( 60000 );
        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
    }
}</pre>
 <p>
  在列表3中，我们首先创建了一个新的AsynchronousServerSocketChannel，然后为其绑定端口号5000：
 </p>
 <pre class="brush: java; gutter: true">final AsynchronousServerSocketChannel listener =
    AsynchronousServerSocketChannel.open().bind(new InetSocketAddress(5000));</pre>
 <p>
  调用 AsynchronousServerSocketChannel 的 accept()，通知其监听一个连接，并将一个典型的CompletionHandler传给它。一旦调用 accept()，结果会立即返回。注意，本例不同于列表2中的ServerSocket类；除非一个客户端与ServerSocket相连，否则accept()会被阻塞。AsynchronousChannelGroup 的 accept() 会为我们解决这个问题。
 </p>
 <h3>
  完整的Handler处理
 </h3>
 <p>
  接 下来的主要任务就是创建一个 CompletionHandler 类，并实现 completed() 和 failed() 方法。当 AsynchronousServerSocketChannel 接收一个客户端连接，这个连接包含一个连接客户端的 AsynchronousSocketChannel，completed()方法就会被调用。completed()方法第一次被调用从AsynchronousServerSocketChannel 处接收连接，开始与客户端进行通信。首先它做的事情向客户端写入一个“hello”消息：建立一个字符串，并将其转换成字节数组并将其传给 ByteBuffer.wrap()，完了构造一个ByteBuffer。接着ByteBuffer传给 AsynchronousSocketChannel的 write() 方法。
 </p>
 <p>
  为了更够从客户端那里读取数据，我们创建了一个新的ByteBuffer，并调用它的allocate(4096)。接 着我们调用了AsynchronousSocketChannel的 read() 方法，此方法会返回一个 Future&lt;Integer&gt;，调用后者的 get() 方法可以获取读自客户端的字节数。在本例中，我们传递了20秒的timeout参数给 get()；如果20分钟没有得到响应，那 get() 就会抛出一个TimeoutException。本回响服务器的应对策略是，如果20秒没有响应，就终止这个对话。
 </p>
 <p style="padding-left: 30px;">
  异步计算中的Future
  <br/>
  “The Future&lt;V&gt;接口显示一个异步计算的结果，此结果作为一个Future，因为它直到未来的某个时刻才存在。你可以调用它的方法去取消一个任务，返回任务的结果——如果任务没有完成，无限等待或者超时退出——并且决定任务是否已取消或者完成……”。
  <br/>
  ——摘自”
  <a class="external" href="http://www.javaworld.com/article/2078809/java-concurrency/java-101-the-next-generation-java-concurrency-without-the-pain-part-1.html" rel="nofollow" target="_blank">
   Java concurrency without the pain, Part 1
  </a>
  “
 </p>
 <p>
  接下来我们会检测buffer的position，它会定位到最后一个来自客户端的byte。倘若客户端发来的是一个空行，接收两个字节：一个回车和一个换行。检测确保客户端发出一个空白行，我们以此作为客户端对话结束的信号。如果我们拥有有意义的数据，那我们就调用ByteBuffer的 flip() 方法去进入读的状态。我们可以创建一个临时byte数组去存储读自客户端的数据，然后调用ByteBuffer的 get() 加载数据到byte数组中。最后，我们通过创建一个新的String对象将数组转换成一行字符串。我们将这行字符串返回给客户端：将字符串line转换成一个byte数组，作为参数传递给 ByteBuffer.wrap()，然后调用 AsynchronousSocketChannel的write() 方法。接着调用ByteBuffer的clear()，这样position被重置为0并将ByteBuffer置于写的模式，接着我们读取客户端下一行。
 </p>
 <p>
  需要注意的是 main() 方法。它 创建了服务器，同时创建了一个让应用跑60秒的计时器。这是因为AsynchronousSocketChannel的 accept() 会理解返回，如果线程 Thread.sleep() 不执行，应用将会立即停止。为了进行测试，启动服务器后用telnet客户端进行连接：
 </p>
 <pre class="brush: shell; gutter: true">telnet localhost 5000</pre>
 <p>
  发送少量的字符串给服务器，观察它们向你返回结果，然后发送一个空行结束对话。
 </p>
 <h3>
  结语
 </h3>
 <p>
  本文展示了两种Socket Java编程方式：传统的Java 1.0引入的编写方式，Java 1.4和Java 7中分别引入的非阻塞 NIO 和 NIO.2 方式。采用客户端服务器几次迭代的例子，展示了基本 Java I/O的使用，以及一些场景下非阻塞I/O对Java socket编程模型的改进和简化。利用非阻塞I/O，你可以编写网络应用来处理多并发连接，而无需管理多线程集合。同样，你也可以利用构建在NIO和 NIO.2上新的服务器扩展特性。
 </p>
 原文链接：
 <a class="external" href="http://www.javaworld.com/article/2853780/java-app-dev/socket-programming-for-scalable-systems.html" rel="nofollow" target="_blank">
  javaworld
 </a>
 翻译：
 <a href="http://www.importnew.com">
  ImportNew.com
 </a>
 -
 <a href="http://www.importnew.com/author/qiaoyongqi">
  乔永琪
 </a>
 <br/>
 译文链接：
 <a href="http://www.importnew.com/15996.html">
  http://www.importnew.com/15996.html
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
   <a href="http://www.importnew.com/author/qiaoyongqi">
    乔永琪
   </a>
  </h3>
  <div class="alignleft">
   <a href="http://www.importnew.com/author/qiaoyongqi">
   </a>
  </div>
  <p>
   （新浪微博：
   <a class="external" href="http://weibo.com/u/1650702304" rel="nofollow" target="_blank">
    @甜菜碱
   </a>
   ）
  </p>
  <p>
   <a href="http://www.importnew.com/author/qiaoyongqi" style="text-decoration: none;">
    查看乔永琪的更多文章 &gt;&gt;
   </a>
  </p>
  <div class="clear">
  </div>
 </div>
 <!-- END #author-bio -->
</div>
</body></html>