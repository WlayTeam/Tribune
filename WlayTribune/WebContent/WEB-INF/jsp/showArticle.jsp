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
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="./js/bootstrap/bootstrap.js"></script>
<script src="./js/bootstrap/bootstrap.min.js"></script>
<style type="text/css">
@IMPORT url("./css/bootstrap/bootstrap.min.css");

@IMPORT url("./css/index.css");
</style>
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
								<a href="">深入解析OutOfMemoryError</a>
							</h1>
						</div>
					</div>

					<div class="post-meta">
						<span class="author">作者：<a href="#">XX</a></span> &bull;
						<time class="post-date" datetime="2016年7月26日星期二上午9点54分"
							title="2016年7月26日星期二上午9点54分">2016年7月26日</time>
					</div>
					<div class="post-content">
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>
						<p>从这周起，我们将 Ghost 推荐 Node.js 版本升级为 Node.js v4 LTS。
							我们这样做其实已经落后于计划了。然而，经过大量测试之后，我们确信 Ghost 可以在 Node.js v4
							平台上流畅的运行并且内存消耗比原来也减少了。目前，Ghost(Pro) 上托</p>


					</div>





					<div class="copyright-area">
						原文出处： <a ref="nofollow" target="_blank"
							href="https://www.evget.com/article/2015/11/19/23028.html">回忆和感动</a>
					</div>
					<p>这是我们今天要讨论的话题，因为我觉得它非常的有趣。</p>
					<p>如果你运行如下代码：</p>
					<div>
						<div id="highlighter_917523"
							class="syntaxhighlighter notranslate java">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td class="gutter"><div class="line number1 index0 alt2">1</div>
											<div class="line number2 index1 alt1">2</div>
											<div class="line number3 index2 alt2">3</div>
											<div class="line number4 index3 alt1">4</div></td>
										<td class="code"><div class="container">
												<div class="line number1 index0 alt2">
													<code class="java plain">Integer a = </code>
													<code class="java value">1000</code>
													<code class="java plain">, b = </code>
													<code class="java value">1000</code>
													<code class="java plain">; </code>
												</div>
												<div class="line number2 index1 alt1">
													<code class="java plain">System.out.println(a == b);</code>
													<code class="java comments">//1</code>
												</div>
												<div class="line number3 index2 alt2">
													<code class="java plain">Integer c = </code>
													<code class="java value">100</code>
													<code class="java plain">, d = </code>
													<code class="java value">100</code>
													<code class="java plain">; </code>
												</div>
												<div class="line number4 index3 alt1">
													<code class="java plain">System.out.println(c == d);</code>
													<code class="java comments">//2</code>
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<p>你会得到以下运行结果：</p>
					<div>
						<div id="highlighter_276384"
							class="syntaxhighlighter notranslate java">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td class="gutter"><div class="line number1 index0 alt2">1</div>
											<div class="line number2 index1 alt1">2</div></td>
										<td class="code"><div class="container">
												<div class="line number1 index0 alt2">
													<code class="java keyword">false</code>
												</div>
												<div class="line number2 index1 alt1">
													<code class="java keyword">true</code>
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<p>我们知道，如果两个引用指向同一个对象，那么==就成立；反之，如果两个引用指向的不是同一个对象，那么==就不成立，即便两个引用的内容是一样的。因此，结果就会出现false。</p>
					<p>这是非常有趣的地方。如果你查看Integer.java类，你会找到IntegerCache.java这个内部私有类，它为-128到127之间的所有整数对象提供缓存。</p>
					<p>这个东西为那些数值比较小的整数提供内部缓存，当进行如此声明时：</p>
					<div>
						<div id="highlighter_646347">
							<div>
								<div id="highlighter_597335"
									class="syntaxhighlighter notranslate java">
									<table cellspacing="0" cellpadding="0" border="0">
										<tbody>
											<tr>
												<td class="gutter"><div
														class="line number1 index0 alt2">1</div></td>
												<td class="code"><div class="container">
														<div class="line number1 index0 alt2">
															<code class="java plain">Integer c = </code>
															<code class="java value">100</code>
															<code class="java plain">;</code>
														</div>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<p>它的内部就是这样的：</p>
					<div>
						<div id="highlighter_39960">
							<div>
								<div id="highlighter_508740"
									class="syntaxhighlighter notranslate java">
									<table cellspacing="0" cellpadding="0" border="0">
										<tbody>
											<tr>
												<td class="gutter"><div
														class="line number1 index0 alt2">1</div></td>
												<td class="code"><div class="container">
														<div class="line number1 index0 alt2">
															<code class="java plain">Integer i =
																Integer.valueOf(</code>
															<code class="java value">100</code>
															<code class="java plain">);</code>
														</div>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<p>如果我们观察valueOf()类函数，我们可以看到</p>
					<div>
						<div id="highlighter_584096">
							<div>
								<div id="highlighter_634009"
									class="syntaxhighlighter notranslate java">
									<table cellspacing="0" cellpadding="0" border="0">
										<tbody>
											<tr>
												<td class="gutter"><div
														class="line number1 index0 alt2">1</div>
													<div class="line number2 index1 alt1">2</div>
													<div class="line number3 index2 alt2">3</div>
													<div class="line number4 index3 alt1">4</div>
													<div class="line number5 index4 alt2">5</div></td>
												<td class="code"><div class="container">
														<div class="line number1 index0 alt2">
															<code class="java keyword">public</code>
															<code class="java keyword">static</code>
															<code class="java plain">Integer valueOf(</code>
															<code class="java keyword">int</code>
															<code class="java plain">i) {</code>
														</div>
														<div class="line number2 index1 alt1">
															<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
															<code class="java keyword">if</code>
															<code class="java plain">(i &gt;= IntegerCache.low
																&amp;&amp; i</code>
														</div>
														<div class="line number3 index2 alt2">
															<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
															<code class="java keyword">return</code>
															<code class="java plain">IntegerCache.cache[i +
																(-IntegerCache.low)];</code>
														</div>
														<div class="line number4 index3 alt1">
															<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
															<code class="java keyword">return</code>
															<code class="java keyword">new</code>
															<code class="java plain">Integer(i);</code>
														</div>
														<div class="line number5 index4 alt2">
															<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code>
															<code class="java plain">}</code>
														</div>
													</div></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<p>如果值在-128到127之间，它就会返回该缓存的实例。</p>
					<p>因此。。。</p>
					<div>
						<div id="highlighter_796931"
							class="syntaxhighlighter notranslate java">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td class="gutter"><div class="line number1 index0 alt2">1</div></td>
										<td class="code"><div class="container">
												<div class="line number1 index0 alt2">
													<code class="java plain">Integer c = </code>
													<code class="java value">100</code>
													<code class="java plain">, d = </code>
													<code class="java value">100</code>
													<code class="java plain">;</code>
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<p>两者指向同样的对象。</p>
					<p>这就是为什么这段代码的结果为true了：</p>
					<div>
						<div id="highlighter_210749"
							class="syntaxhighlighter notranslate java">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td class="gutter"><div class="line number1 index0 alt2">1</div></td>
										<td class="code"><div class="container">
												<div class="line number1 index0 alt2">
													<code class="java plain">System.out.println(c == d);</code>
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<p>现在你可能会问，为什么会为-128到127之间的所有整数设置缓存？</p>
					<p>这是因为在这个范围内的小数值整数在日常生活中的使用频率要比其它的大得多，多次使用相同的底层对象这一特性可以通过该设置进行有效的内存优化。你可以使用reflection
						API任意使用这个功能。</p>
					<p>运行下面的这段代码，你就会明白它的神奇所在了。</p>
					<div>
						<div id="highlighter_532853"
							class="syntaxhighlighter notranslate java">
							<table cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td class="gutter"><div class="line number1 index0 alt2">1</div>
											<div class="line number2 index1 alt1">2</div>
											<div class="line number3 index2 alt2">3</div>
											<div class="line number4 index3 alt1">4</div>
											<div class="line number5 index4 alt2">5</div>
											<div class="line number6 index5 alt1">6</div>
											<div class="line number7 index6 alt2">7</div>
											<div class="line number8 index7 alt1">8</div>
											<div class="line number9 index8 alt2">9</div>
											<div class="line number10 index9 alt1">10</div>
											<div class="line number11 index10 alt2">11</div>
											<div class="line number12 index11 alt1">12</div>
											<div class="line number13 index12 alt2">13</div></td>
										<td class="code"><div class="container">
												<div class="line number1 index0 alt2">
													<code class="java keyword">public</code>
													<code class="java keyword">static</code>
													<code class="java keyword">void</code>
													<code class="java plain">main(String[] args) </code>
													<code class="java keyword">throws</code>
													<code class="java plain">NoSuchFieldException,
														IllegalAccessException {</code>
												</div>
												<div class="line number2 index1 alt1">&nbsp;</div>
												<div class="line number3 index2 alt2">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java plain">Class cache = Integer.</code>
													<code class="java keyword">class</code>
													<code class="java plain">.getDeclaredClasses()[</code>
													<code class="java value">0</code>
													<code class="java plain">]; </code>
													<code class="java comments">//1</code>
												</div>
												<div class="line number4 index3 alt1">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java plain">Field myCache =
														cache.getDeclaredField(</code>
													<code class="java string">"cache"</code>
													<code class="java plain">); </code>
													<code class="java comments">//2</code>
												</div>
												<div class="line number5 index4 alt2">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java plain">myCache.setAccessible(</code>
													<code class="java keyword">true</code>
													<code class="java plain">);</code>
													<code class="java comments">//3</code>
												</div>
												<div class="line number6 index5 alt1">&nbsp;</div>
												<div class="line number7 index6 alt2">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java plain">Integer[] newCache =
														(Integer[]) myCache.get(cache); </code>
													<code class="java comments">//4</code>
												</div>
												<div class="line number8 index7 alt1">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java plain">newCache[</code>
													<code class="java value">132</code>
													<code class="java plain">] = newCache[</code>
													<code class="java value">133</code>
													<code class="java plain">]; </code>
													<code class="java comments">//5</code>
												</div>
												<div class="line number9 index8 alt2">&nbsp;</div>
												<div class="line number10 index9 alt1">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java keyword">int</code>
													<code class="java plain">a = </code>
													<code class="java value">2</code>
													<code class="java plain">;</code>
												</div>
												<div class="line number11 index10 alt2">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java keyword">int</code>
													<code class="java plain">b = a + a;</code>
												</div>
												<div class="line number12 index11 alt1">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java plain">System.out.printf(</code>
													<code class="java string">"%d + %d = %d"</code>
													<code class="java plain">, a, a, b); </code>
													<code class="java comments">//</code>
												</div>
												<div class="line number13 index12 alt2">
													<code class="java spaces">&nbsp;&nbsp;&nbsp;&nbsp;</code>
													<code class="java plain">}</code>
												</div>
											</div></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div></div>



					<!-- BEGIN #author-bio -->


					<!-- END #author-bio -->

				</article>
			</div>
			<div class="col-md-4 sidebar">
				<c:import url="right-display.jsp" />
			</div>

		</div>



	</div>

	<c:import url="footer.jsp" />
</body>
</html>