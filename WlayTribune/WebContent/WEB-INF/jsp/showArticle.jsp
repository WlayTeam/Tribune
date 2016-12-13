<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="image/head.ico" />
<title>WlayTeam Tribune</title>
<link rel="stylesheet" href="./css/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="./css/index.css">
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/bootstrap/bootstrap.js"></script>
<script src="./js/bootstrap/bootstrap.min.js"></script>
</head>
<div id="tp-weather-widget"></div>
<script>
	(function(T, h, i, n, k, P, a, g, e) {
		g = function() {
			P = h.createElement(i);
			a = h.getElementsByTagName(i)[0];
			P.src = k;
			P.charset = "utf-8";
			P.async = 1;
			a.parentNode.insertBefore(P, a)
		};
		T["ThinkPageWeatherWidgetObject"] = n;
		T[n] || (T[n] = function() {
			(T[n].q = T[n].q || []).push(arguments)
		});
		T[n].l = +new Date();
		if (T.attachEvent) {
			T.attachEvent("onload", g)
		} else {
			T.addEventListener("load", g, false)
		}
	}(window, document, "script", "tpwidget",
			"//widget.thinkpage.cn/widget/chameleon.js"))
</script>
<script>
	tpwidget("init", {
		"flavor" : "bubble",
		"location" : "WTW3SJ5ZBJUY",
		"geolocation" : "enabled",
		"position" : "top-right",
		"margin" : "0px 0px",
		"language" : "en",
		"unit" : "c",
		"theme" : "black",
		"uid" : "UD7A00585E",
		"hash" : "445f809d426a797f237b28ce39fe8877"
	});
	tpwidget("show");
</script>
<body>
<body>
	<!-- 	<div class="main_style">
		 <div class="image-style">
			<div class="inner_image">
				<a href="http://www.bing.com/"> <img src="image/logo1.png"
					alt="WlayTeam" width="137px" height="85px">

				</a>
			</div> -->
	<!--  </div>-->
	<!--<div align="center" class="title-style">-->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">WlayTeam</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="${pageContext.request.contextPath }/toIndex" class="nava">Home</a></li>
					<li><a href="#" class="nava">Article</a></li>
					<li><a href="#News" class="nava">News</a></li>
					<li><a href="#Web" class="nava">web</a></li>
					<li><a href="#Books" class="nava">Books</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Code <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Java</a></li>
							<li><a href="#">Python</a></li>
							<li><a href="#">Java Script</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>


	<div style="height: 80px;"></div>



	<div class="container">
		<!-- 右边的栏位 预留 -->


		<div class="row">

			<div class="col-md-8 main-content">
				<article class="post">
					<div class="post-head">
						<div class="post-title">
							<h1>
								<a href="">对Java意义重大的7个性能指标</a>
							</h1>
						</div>
					</div>
					<div class="copyright-area" style="text-align: center;">
						原文出处： <a
							href="https://www.evget.com/article/2015/11/16/22990.html"
							ref="nofollow" target="_blank"> 王韵菲 </a>
					</div>
					<p>
						本文中，小编搜集了7个最有影响的衡量标注，让你可以不依赖日志文件来了解应用程序。现在，让我们看看这些性能指标，并了解如何查看并收集它们：
					</p>
					<h2>
						<strong> 1.响应时间和吞吐量 </strong>
					</h2>
					<p>
						根据应用程序的响应时间可以知道程序完成传输数据所用的时间。也可以从HTTP请求级别，或者成为数据库级别来看。对那些缓慢的查询你需要做一些优化来缩短时间。吞吐量是另一个角度衡量传输数据的指标，是指单位时间内系统处理的客户请求的数量。
					</p>
					<p>我们可以使用APMs（例如New
						Relic或AppDynamics）来衡量这些指标。使用这些工具，你可以在主报告仪表板中将平均响应时间与昨天的甚至上周的直接进行对比。这有助于我们观察新的部署是否会影响到我们的应用程序。你可以看到网络传输的百分比，测量HTTP完成请求需要多长时间。
					</p>
					<p>推荐工具：</p>
					<ul>
						<li><a class="external" href="http://www.appdynamics.com/"
							rel="nofollow" target="_blank"> <strong> AppDynamics
							</strong>
						</a></li>
						<li><a class="external" href="http://newrelic.com/"
							rel="nofollow" target="_blank"> <strong> New Relic </strong>
						</a></li>
						<li><a class="external" href="https://ruxit.com/"
							rel="nofollow" target="_blank"> <strong> Ruxit </strong>
						</a></li>
					</ul>
					<div>
						<img alt="响应时间和吞吐量"
							src="http://evgetimg.oss-cn-hangzhou.aliyuncs.com/Content/files/2015/11/16/b6ffed055e5747688fd094526df5cad4635832725533427650.jpg" />
					</div>
					<p>New Relic报告：Web传输百分比和吞吐量</p>
					<h2>
						<strong> 2.平均负载 </strong>
					</h2>
					<p>
						第二个应用广泛的指标是平均负载。我们习惯上会把平均负载分为这三步测量，分别是第5分钟、第15分钟和最后1分钟。要保证数量低于机器的内核数。一旦超过内核数，机器就会运行在压力状态下。
					</p>
					<p>
						除了简单测量CPU使用率，还需要关注每个内核的队列中有多少进程。在内核使用率都是100%的情况下，队列中只有1个任务和有6个任务有很大不同。因此，平均负载不能只考虑CPU使用率。
					</p>
					<p>推荐工具：</p>
					<ul>
						<li><a class="external" href="http://hisham.hm/htop/"
							rel="nofollow" target="_blank"> <strong> htop </strong>
						</a></li>
					</ul>
					<div>
						<img alt="平均负载"
							src="http://evgetimg.oss-cn-hangzhou.aliyuncs.com/Content/files/2015/11/16/461fad9870ac4508a46cbebd07649380635832726056107546.jpg" />
					</div>
					<h2></h2>
					<h2>
						<strong> 3.错误率 </strong>
					</h2>
					<p>
						大多数开发人员判断错误率是根据HTTP传输总失败百分比。但是他们忽略了一个更深层的东西：特定传输的错误率。这直接影响到您应用程序的运行状况。这可以显示出代码方法的错误以及错误或异常出现的次数。
					</p>
					<div>
						<img alt="错误率"
							src="http://evgetimg.oss-cn-hangzhou.aliyuncs.com/Content/files/2015/11/16/078acb723ae74f168fb3766dc24ca305635832726366795316.jpg" />
					</div>
					<p>
						但单纯的错误率数据对我们没有多大帮助。最重要的是我们要找到它们的根源并解决问题。随着Takipi的运行，我们要在日志文件中需找线索。你可以找到所有关于服务器状态的信息，包括堆栈跟踪、源代码和变量值。
					</p>
					<p>推荐工具：</p>
					<ul>
						<li><a class="external" href="http://www.takipi.com/"
							rel="nofollow" target="_blank"> <strong> Takipi </strong>
						</a></li>
					</ul>
					<div>
						<img alt="Takipi"
							src="http://evgetimg.oss-cn-hangzhou.aliyuncs.com/Content/files/2015/11/16/932909f574c24083836cbb5d28447fdd635832726726735903.jpg" />
					</div>
					<h2></h2>
					<h2>
						<strong> 4.GC率和暂停时间 </strong>
					</h2>
					<p>
						异常行为垃圾收集器应用程序的吞吐量和响应时间采取深潜的主要原因之一。了解GC暂停频率和持续时间的关键是分析GC日志文件。要分析它们，你需要收集GC日志和JVM参数。你要注意观察不同指标之间的数据是如何相互影响的。
					</p>
					<p>推荐工具：</p>
					<ul>
						<li><a class="external"
							href="http://www.jclarity.com/censum/" rel="nofollow"
							target="_blank"> <strong> jClarity Censum </strong>
						</a></li>
						<li><a class="external"
							href="https://github.com/chewiebug/GCViewer" rel="nofollow"
							target="_blank"> <strong> GCViewer </strong>
						</a></li>
					</ul>
					<h2>
						<strong> 5.业务指标 </strong>
					</h2>
					<p>应用程序的性能不完全取决于响应时间和错误率。业务指标也是一方面，例如收益、用户数。</p>
					<p>推荐工具：</p>
					<ul>
						<li><a class="external" href="http://grafana.org/"
							rel="nofollow" target="_blank"> <strong> Grafana </strong>
						</a></li>
						<li><a class="external" href="https://www.elastic.co/"
							rel="nofollow" target="_blank"> <strong> The ELK
									stack </strong>
						</a></li>
						<li><a class="external" href="https://www.datadoghq.com/"
							rel="nofollow" target="_blank"> <strong> Datadog </strong>
						</a></li>
						<li><a class="external" href="https://www.librato.com/"
							rel="nofollow" target="_blank"> <strong> Librato </strong>
						</a></li>
					</ul>
					<h2>
						<strong> 6.正常运行时间和服务运行状态 </strong>
					</h2>
					<p>
						这一指标奠定了整个应用程序性能的基础。不仅可以当做一个提醒指标，也可以让你定义一段时间内的SKA。我们可以使用Pingdom的servlet功能进行运行状态检查。我们可以查到应用程序的所有传输，包括数据库和S3。
					</p>
					<p>推荐工具：</p>
					<ul>
						<li><a class="external" href="https://www.pingdom.com/"
							rel="nofollow" target="_blank"> <strong> Pingdom </strong>
						</a></li>
					</ul>
					<div>
						<img alt="服务运行状态"
							src="http://evgetimg.oss-cn-hangzhou.aliyuncs.com/Content/files/2015/11/16/a0a85da214fb401bbffda8d29522d272635832727080706149.jpg" />
					</div>
					<h2>
						<strong> 7.日志大小 </strong>
					</h2>
					<p>日志有一个缺点，它是一直在增加的。当您的服务器启动塞满了垃圾，一切都慢下来。因此，我们需要密切的关注日志大小。</p>
					<p>目前通常的解决办法是使用logstash划分使用日志，并将它们发送并存储在Splunk、ELK或其他的日志管理工具中。</p>
					<p>推荐工具：</p>
					<ul>
						<li><a class="external" href="http://www.splunk.com/"
							rel="nofollow" target="_blank"> <strong> Splunk </strong>
						</a></li>
						<li><a class="external" href="http://www.sumologic.com/"
							rel="nofollow" target="_blank"> <strong> Sumo Logic
							</strong>
						</a></li>
						<li><a class="external" href="https://www.loggly.com/"
							rel="nofollow" target="_blank"> <strong> Loggly </strong>
						</a></li>
					</ul>
					<!-- BEGIN #author-bio -->
					<!-- END #author-bio -->
			</div>
			</article>
			<div class="col-md-4 sidebar">
				<c:import url="right-display.jsp" />
			</div>

		</div>



	</div>

	<c:import url="footer.jsp" />
</body>
</html>