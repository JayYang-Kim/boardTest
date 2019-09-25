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
	<form name="searchForm" method="post">
		<div class="list_search">
			<button type="button" class="button" onclick="javascript:location.href='<%=cp%>/board/list'">새로고침</button>
			<select name="searchKey" title="검색조건선택">
				<option value="all" ${searchKey == 'all' ? "selected='selected'" : ""}>전체</option>
	            <option value="subject" ${searchKey == 'subject' ? "selected='selected'" : ""}>제목</option>
	            <option value="writer" ${searchKey == 'writer' ? "selected='selected'" : ""}>작성자</option>
	            <option value="created" ${searchKey == 'created' ? "selected='selected'" : ""}>작성일</option>
			</select>
			<input type="text" name="searchValue" value="${searchValue}" title="검색내용입력" />
			<span class="btn">
				<button type="button" onclick="sendSearch();" class="button">검색</button>
				<!-- <a href="javascript:void(0)" onclick="sendSearch();" class="button">검색</a> -->
			</span>
		</div>
	</form>
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
		<c:forEach var="dto" items="${list}">
			<tr>
				<td>${dto.boardNum}</td>
				<td><a class="udline" href="${articleUrl}&boardCode=${dto.boardCode}">${dto.subject}</a></td>
				<td>${dto.id}<br>(${dto.name})</td>
				<td>${dto.hitCount}</td>
				<td>${dto.created}</td>
	            <td>
	            	<c:if test="${not empty dto.saveFilename}">
	            		<img src="<%=cp%>/resources/images/common/icon_file.png" class="file" alt="첨부파일" />
	            	</c:if>
	            	
	            </td>
			</tr>
		</c:forEach>
		<c:if test="${empty list}">
			<tr>
				<td colspan="6">등록된 정보가 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
</table>
<div class="t_center mt30">
	${paging}
</div>
<div class="btn_wrap">
	<p class="f_right"><a href="<%=cp%>/board/write" class="button h30 btn_brown w70">등록</a></p>
</div>

<script type="text/javascript">
	function sendSearch() {
		var f = document.searchForm;
		
		f.action = "<%=cp%>/board/list";
		f.submit();
	}
</script>