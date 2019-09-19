<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<h1 id="logo"><a href="/">JINYANG</a></h1>
<!-- 로고있는 경우 하단 태그 사용 -->
<!-- <h1 id="logo"><a href="/"><img src="" alt="" /></a></h1> -->
<a href="#" class="btn_gnb">
	<i></i>
	<span class="blind">메뉴</span>
</a>
<div>
	<div class="head_timer">
		<div class="date"></div>
		<div class="clock"></div>
	</div>
	<div class="head_info">
		<span>${sessionScope.member.userId}<strong>(${sessionScope.member.userName})</strong>님 안녕하세요.</span>
		<a href="<%=cp%>/member/logout" class="button h22">로그아웃</a>
		<a href="<%=cp%>/myInfo" class="button h22">마이페이지</a>
	</div>
</div>
