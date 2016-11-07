<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

.main {
	width: 300px;
	height: 900px;
	margin: 0 auto;
}

#search-submit:hover {
	cursor: pointer;
	background-color: #c32020;
}

.right-image {
	width: 300px;
	height: 120px;
	margin-top: 10px;
	background: url(image/right-image.jpg);
}

.right-ul {
	margin-top: 20px;
}

.right-ul li {
	position: relative;
	list-style: none;
	margin-bottom: -1px;
	padding: 10px;
	float: left;
	background: #fff;
}

.ulActive {
	border: 1px solid #e8e8e8;
	background: #fff;
	border-bottom-color: #fff;
}

.right-title-swapper {
	clear: both;
	height: 330px;
	border: 1px solid #e8e8e8;
	width: 300px;
}

.right-title-swapper div {
	float: left;
	width: 300px;
	height: 330px;
	background:#fff;
	opacity: 0;
	
}

.right-title-swapper div {
	position: absolute;
}

.search-swapper {
	width: 302px;
	height: 50px;
}

.right-list{
	margin-top:20px;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var oUl = document.getElementById("right-ul");
		var oLi = oUl.getElementsByTagName("li");
		var oCon = document.getElementById("right-content");
		var oCons = oCon.getElementsByTagName("div");
		for (var i = 0; i < oLi.length; i++) {
			oLi[i].index = i;
			oLi[i].onclick = function() {
				show(this.index);
			}
		}
		function show(index) {
			for (var j = 0; j < oLi.length; j++) {
				oLi[j].setAttribute("class", "");
				oCons[j].style.opacity = 0;
			}
			/* oLi[index].addClass("active"); */
			oLi[index].setAttribute("class", "active"); 
			oCons[index].style.opacity = 1;
		}
	}
</script>
</head>
<body>
	<div class="main">
		<!-- search label  annonation by ashin-->
		<div class="search-swapper">
			<form class="navbar-form navbar-left" role="search"
				style="display: block;">
				<div class="form-group">
					<input type="text" class="form-control input-default"
						placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default btn-default">Submit</button>
			</form>
		</div>
		<div class="right-image"></div>
		<div class="right-list">
			<ul class="nav nav-pills" role="tablist" id="right-ul">
			<li role="presentation" class="active "><a href="#">本周热门文章</a></li>
			<li role="presentation" class=""><a href="#">本月热门</a></li>
			<li role="presentation" class=""><a href="#">热门标签</a></li>
		</ul>
		<div class="right-title-swapper" id="right-content">
			<div class="hot-article" style="opacity: 1;">
				<span>0</span> <a href="#">sample</a>
			</div>
			<div class="month-hot">222222</div>
			<div class="label-hot">33333</div>
		</div>
		</div>
		
	</div>

</body>
</html>