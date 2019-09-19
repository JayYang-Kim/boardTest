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
	<h2>게시글</h2>
	<p>게시글 &gt; <strong>리스트</strong></p>
</div>

<div class="list_search_wrap">
	<div class="list_search">
		<select title="검색조건선택">
			<option value="전체">전체</option>
            <option value="제목">제목</option>
            <option value="작성자">작성자</option>
            <option value="작성일">작성일</option>
		</select>
		<input type="text" title="검색내용입력" />
		<span class="btn">
			<a href="#" class="button">검색</a>
		</span>
	</div>
</div>
<table class="table tbl_hover">
	<caption>게시글 리스트</caption>
	<colgroup>
		<col style="width:5%" />
		<col />
		<col style="width:10%" />
		<col style="width:5%" />
		<col style="width:10%" />
        <col style="width:5%" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">NO</th>
			<th scope="col">제목</th>
			<th scope="col">작성자</th>
			<th scope="col">조회수</th>
            <th scope="col">작성일</th>
            <th scope="col">첨부</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>1</td>
			<td><a class="udline" href="boardView.html">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td><img src="<%=cp%>/resources/images/common/icon_file.png" class="file" alt="첨부파일" /></td>
		</tr>
		<tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td><img src="<%=cp%>/resources/images/common/icon_file.png" class="file" alt="첨부파일" /></td>
		</tr>
        <tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td><img src="<%=cp%>/resources/images/common/icon_file.png" class="file" alt="첨부파일" /></td>
		</tr>
        <tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td><img src="<%=cp%>/resources/images/common/icon_file.png" class="file" alt="첨부파일" /></td>
		</tr>
        <tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td><img src="<%=cp%>/resources/images/common/icon_file.png" class="file" alt="첨부파일" /></td>
		</tr>
        <tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td></td>
		</tr>
        <tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td></td>
		</tr>
        <tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td></td>
		</tr>
        <tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td></td>
		</tr>
        <tr>
			<td>1</td>
			<td><a class="udline" href="#">테스트 입니다.</a></td>
			<td>홍길동</td>
			<td>1</td>
			<td>2019-09-18</td>
            <td></td>
		</tr>
	</tbody>
</table>
<div class="t_center mt30">
	<ul class="pagination">
		<li class="disabled"><a href="#"><i class="fa fa-angle-double-left"></i></a></li>
		<li class="disabled"><a href="#"><i class="fa fa-angle-left"></i></a></li>
		<li class="active"><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
		<li><a href="#">4</a></li>
		<li><a href="#">5</a></li>
		<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
		<li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
	</ul>
</div>
<div class="btn_wrap">
	<p class="f_right"><a href="<%=cp%>/board/write" class="button h30 btn_brown w70">등록</a></p>
</div>
