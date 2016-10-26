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

.search-swapper {
	margin-left: 5px;
	margin-top: 20px;
	position: relative;
	background: #f8f8f8;
	padding: 5px;
	margin-top: 20px;
}

#search-input {
	border: 1px solid #e8e8e8;
	width: 275px;
	height: 28px;
	line-height: 28px;
	padding: 0 4px;
}

#search-submit {
	border: 1px solid #e8e8e8;
	border-left: none;
	display: block;
	border: none;
	position: absolute;
	width: 27px;
	height: 27px;
	right: 6px;
	top: 6px;
	background-color: #0099cc;
	backgroun-position:right;
	background-image: url(image/search.png);
	display: block;
}

#search-submit:hover {
	cursor: pointer;
	background-color: #c32020;
}

.right-image {
	width: 300px;
	height: 120px;
	margin-top: 20px;
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
	height: 358px;
	border: 1px solid #e8e8e8;
	width: 300px;
}

.right-title-swapper div {
	float: left;
	width: 270px;
	height: 330px;
	opacity: 0;
}
.right-title-swapper div{
	position:absolute;
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
				oLi[j].setAttribute("class","");
				oCons[j].style.opacity = 0;
			}
			oLi[index].setAttribute("class","ulActive");
			oCons[index].style.opacity = 1; 
		}
	}
</script>
</head>
<body>
	<div class="main">
		<div class="search-swapper">
			<input type="text" id="search-input" placeholder="search" /> <input
				type="submit" value="" id="search-submit" />
		</div>
		<div class="right-image"></div>
		<ul class="right-ul" id="right-ul">
			<li class="ulActive">本周热门文章</li>
			<li>本月热门</li>
			<li>热门标签</li>
		</ul>
		<div class="right-title-swapper" id="right-content">
			<div class="hot-article" style="opacity: 1;">
				<span>0</span> <a href="#">sample</a>
			</div>
			<div class="month-hot">222222</div>
			<div class="label-hot">33333</div>
		</div>
	</div>

</body>
</html>