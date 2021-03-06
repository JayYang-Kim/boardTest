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
            <td colspan="3">${dto.subject}</td>
        </tr>
        <tr>
            <th scope="row">작성자</th>
            <td>${dto.id}(${dto.name})</td>
            <th scope="row">작성일</th>
            <td>${dto.created}</td>
        </tr>
        <tr>
            <th scope="row">조회수</th>
            <td>${dto.hitCount}</td>
            <th scope="row">접속 IP</th>
            <td>${dto.ipAddr}</td>
        </tr>
        <tr>
            <th scope="row">내용</th>
            <td colspan="3">
                <div class="view_cont">
					${dto.content}
                </div>
            </td>
        </tr>
        <tr>
            <th scope="row">파일첨부</th>
            <td colspan="3">
            	<c:if test="${not empty dto.saveFilename}">
            		<a href="<%=cp%>/board/download?boardCode=${dto.boardCode}">${dto.originalFilename}</a>
            	</c:if>
            	<c:if test="${empty dto.saveFilename}">
            		<span>첨부파일이 없습니다.</span>
            	</c:if>
            </td>
        </tr>
    </tbody>
</table>
<div class="btn_wrap">
	<p class="f_left"><a href="<%=cp%>/board/list${query}" class="button h30 btn_gray w70">목록</a></p>
	<p class="f_right">
		<c:if test="${sessionScope.member.userIdx == dto.idx}">
			<button type="button" onclick="location.href='<%=cp%>/board/update${query}&boardCode=${dto.boardCode}'" class="button h30 btn_brown w70">수정</button>
			<button type="button" onclick="boardDelete();" class="button h30 btn_red w70">삭제</button>		
		</c:if>  
	</p>
</div>

<script type="text/javascript">	
	function boardDelete() {
		if(!confirm("삭제하시겠습니까?")) {
			return;
		}
		
		var url = "<%=cp%>/board/delete";
		var query = "boardCode=${dto.boardCode}&saveFilename=${dto.saveFilename}";
		
		$.ajax({
			type:"post",
			url:url,
			data:query,
			dataType:"json",
			success:function(data) {
				if(data.state == "success") {
					location.href = "<%=cp%>/board/list";
					return;
				} else {   
					alert("삭제를 실패했습니다.");
					return;
				}
			},
			beforeSend:function(e) {
				console.log(e);
				e.setRequestHeader("AJAX", true);
			},
			error:function(e) {
				alert("로그인이 필요한 기능입니다.");
				if(e.status == 403) {
					location.href = "<%=cp%>/member/login";
					return;
				}
				
				console.log(e.responseText);
			}
		});
	}
</script>