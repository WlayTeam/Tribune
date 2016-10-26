<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="image/head.ico" />
<title>WlayTeam Tribune</title>
<style type="text/css">
@IMPORT url("css/index.css");
</style>
</head>
<body>
<h1>12</h1>
	<div class="main_style">
		<!--  <div class="image-style">-->
			<div class="inner_image">
				<a href="http://www.bing.com/"> <img src="image/logo1.png"
					alt="WlayTeam" width="137px" height="85px">

				</a>
			</div>
		<!--  </div>-->
		<!--<div align="center" class="title-style">-->
			<div class="inner_title">
				<ul class="list">
					<li><a href="#">首页</a></li>
					<li><a href="${pageContext.request.contextPath }/allArticle">所有文章</a></li>
					<li><a href="#">资讯</a></li>
					<li><a href="#">web</a></li>
					<li><a href="#">架构</a></li>
					<li><a href="#">基础技术</a></li>
					<li><a href="#">书籍</a></li>
					<li><a href="#">教程</a></li>
					<li><a href="http://group.jobbole.com/category/tech/java/"
						target="_blank">java小组</a></li>
					<li><a href="http://hao.jobbole.com/?catid=32" target="_blank">工具资源</a></li>
				</ul>
			</div>
		<!--</div>-->

		<br /> <br />
		<!--<div class="content-style">-->
			<!-- 右边的栏位 预留 -->
			<div class="right-display">
				<div>
					<c:import url="right-display.jsp" />
				</div>
			</div>
			<div class="inner_content">


				<div class="suggestedreading">
					<div class="content-title-style">
						<h5>推荐阅读</h5>
						<hr align="left" />
					</div>

					<div class="suggestedreading_inner"></div>
				</div>

				<div class="new_article">
					<div class="content-middle-style">
						<h5>最新文章</h5>
						<hr align="left" />
					</div>
					<div class="content-midele-left"></div>
				</div>


				<div class="java">
					<div class="content-middle-style">
						<h5>java干货</h5>
						<hr align="left" />
					</div>
					<div class="content-midele-right"></div>
				</div>

				<div class="industry_dynamics">
					<div class="content-bottom-style">
						<h5>业界动态</h5>
						<hr align="left" />
					</div>
					<div class="contet-bottom"></div>
				</div>

				<div class="base_tic">
					<div class="content-mostbottom-style">
						<h5>基础技术</h5>
						<hr align="left" />
					</div>
					<div class="contet-mostbottom"></div>
				</div>

		</div>


	</div>
</body>
</html>