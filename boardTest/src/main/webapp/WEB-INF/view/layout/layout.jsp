<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String cp = request.getContextPath();
%>

<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="ko"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="ko"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="ko"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="ko"> <!--<![endif]-->
<head>
	
</head>
	<tiles:insertAttribute name="import"/>
<body>
	<!-- skipNavi -->
	<div id="skipNavi">
		<a href="#gnb">주메뉴 바로가기</a>
		<a href="#contents">본문 바로가기</a>
		<a href="#footer">사이트정보 바로가기</a>
	</div>
	<!-- //skipNavi -->
	<!-- wrap -->
	<div id="wrap">
		<!-- header -->
		<header id="header">
            <tiles:insertAttribute name="header"/>
		</header>
		<!-- //header -->
		
		<!-- left_menu -->
		<aside class="left_menu">
			<tiles:insertAttribute name="left"/>
		</aside>
		<!-- //left_menu -->

		<!-- container -->
		<div id="container">
			<!-- contents -->
			<section id="contents">
				<tiles:insertAttribute name="body"/>
			</section>
		</div>
		<!-- //container -->
	</div>
	<!-- //wrap -->
	<!-- footer -->
	<footer id="footer">
		<p>Copyright (c) JINYANG All rights reserved.</p>
	</footer>
	<!-- //footer -->

	<!-- pop_layer -->
	<div id="popup" class="pop_bg">
		<article class="pop_wrap">
			<h1>카테고리생성</h1>
			<div class="pop_cont">
				<p>내용<br/>내용</p>
				<p class="t_center mt20">
					<a href="#" class="button w72 btn_gray">취소</a>
					<a href="#" class="button w72 btn_red">등록</a>
				</p>
			</div>
			<!-- 팝업을 닫을때는 .pop_close 클래스를 활용 하거나, popupHide 함수 활용 -->
			<a href="#" class="btn_close pop_close">닫기</a>
		</article>
	</div>
	
	<!-- javascript -->
	<script src="<%=cp%>/resources/js/lib/util.js"></script>
	<script src="<%=cp%>/resources/js/lib/util-jquery.js"></script>
	<script src="<%=cp%>/resources/js/lib/jquery.form.js"></script>
</body>
</html>
