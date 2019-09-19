<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<h1 id="page_tit">마이페이지</h1>
<!-- 현재 페이지 정보 -->
<div class="page_info">
	<h2>마이페이지</h2>
	<p>마이페이지 &gt; <strong>내 정보</strong></p>
</div>

<table class="table left_tbl form_tbl">
	<caption>마이페이지</caption>
	<colgroup>
		<col style="width:15%" />
		<col />
	</colgroup>
	<tbody>
        <tr>
			<th scope="row">아아디</th>
			<td>
                <span>test01</span>
            </td>
		</tr>
		<tr>
			<th scope="row">비밀번호</th>
			<td>
                <input type="text" placeholder="비밀번호" title="비밀번호"/>
            </td>
		</tr>
        <tr>
			<th scope="row">이름</th>
			<td>
                <span>홍길동</span>
            </td>
		</tr>
        <tr>
			<th scope="row">주소</th>
			<td><input type="text" placeholder="주소" title="주소"/></td>
		</tr>
        <tr>
			<th scope="row">전화번호</th>
			<td>
                <input type="text" placeholder="전화번호" title="전화번호"/>
            </td>
		</tr>
        <tr>
			<th scope="row">이메일</th>
			<td>
                <input type="text" placeholder="이메일" title="이메일"/>
            </td>
		</tr>
        <tr>
			<th scope="row">활성여부</th>
			<td>
                <label class="radio">
                    <input name="radio_enabled" type="radio" checked="checked">
                    <span class="lbl">활성화</span>
                </label>
                <label class="radio">
                    <input name="radio_enabled" type="radio">
                    <span class="lbl">비활성</span>
                </label>
            </td>
		</tr>
	</tbody>
</table>
<div class="btn_wrap">
	<p class="f_right">  
		<a href="boardList.html" class="button h30 btn_brown w70">저장</a>
	</p>
</div>
