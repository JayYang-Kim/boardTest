<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<h1 id="page_tit">게시글</h1>
<!-- 현재 페이지 정보 -->
<div class="page_info">
	<h2>게시글h2>
	<p>게시글 &gt; <strong>상세</strong></p>
</div>

<table class="table left_tbl">
    <caption>게시글 상세</caption>
    <colgroup>
        <col style="width:15%">
        <col>
        <col style="width:15%">
        <col>
    </colgroup>
    <tbody>
        <tr>
            <th scope="row">제목</th>
            <td colspan="3">제목텍스트 제목텍스트 제목텍스트 제목텍스트 제목텍스트</td>
        </tr>
        <tr>
            <th scope="row">작성자</th>
            <td>홍길동</td>
            <th scope="row">작성일</th>
            <td>2014.11.02</td>
        </tr>
        <tr>
            <th scope="row">조회수</th>
            <td colspan="3">0</td>
        </tr>
        <tr>
            <th scope="row">내용</th>
            <td colspan="3">
                <div class="view_cont">
				        내용<br>
				        내용<br>
				        내용<br>
				        내용<br>
				        내용<br>
				        내용<br>
				        내용<br>
				        내용<br>
                </div>
            </td>
        </tr>
        <tr>
            <th scope="row">파일첨부</th>
            <td colspan="3">
                <p>파일첨부 영역</p>
                <p>파일첨부 영역</p>
                <p>파일첨부 영역</p>
                <p>파일첨부 영역</p>
                <p>파일첨부 영역</p>
                <p>파일첨부 영역</p>
            </td>
        </tr>
    </tbody>
</table>
<div class="btn_wrap">
	<p class="f_left"><a href="boardList.html" class="button h30 btn_gray w70">목록</a></p>
	<p class="f_right">
		<a href="<%=cp%>/board/update" class="button h30 btn_brown w70">수정</a>  
		<a href="<%=cp%>/board/delete" class="button h30 btn_red w70">삭제</a>
	</p>
</div>
