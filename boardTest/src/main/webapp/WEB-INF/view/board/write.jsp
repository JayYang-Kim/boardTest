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
	<p>게시글 &gt; <strong>${mode == 'write' ? "등록" : "수정"}</strong></p>
</div>

<form name="boardForm" enctype="multipart/form-data" method="post">
	<table class="table left_tbl form_tbl">
		<caption>게시글 등록</caption>
		<colgroup>
			<col style="width:15%" />
			<col />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">제목</th>
				<td>
					<input type="text" name="subject" value="${dto.subject}" class="w_100" title="제목 입력" placeholder="제목 입력" />
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td>
					<textarea name="content" class="textarea" placeholder="내용입력" title="내용입력">${dto.content}</textarea>
				</td>
			</tr>
			<tr>
				<th scope="row">파일첨부</th>
				<td>
					<input type="file" name="upload" class="w_100" placeholder="파일첨부" title="파일첨부">
				</td>
			</tr>
		</tbody>
	</table>
</form>
<div class="btn_wrap">
	<p class="f_left"><a href="<%=cp%>/board/list${query}" class="button h30 btn_gray w70">목록</a></p>
	<p class="f_right">
		<a href="<%=cp%>/board/list${query}" class="button h30 btn_gray w70">취소</a>  
		<a href="javascript:void(0)" onclick="boardSend('${mode}');" class="button h30 btn_brown w70">${mode == "write" ? '등록' : "수정"}</a>
		<c:if test="${mode == 'update'}">
			<input type="hidden" name="boardCode" value="${dto.boardCode}"/>
			<input type="hidden" name="saveFilename" value="${dto.saveFilename}"/>
			<input type="hidden" name="originalFilename" value="${dto.originalFilename}"/>
		</c:if>
	</p>
</div>

<script type="text/javascript">
	function boardSend(mode) {
		var f = document.boardForm;
		
		if(!f.subject.value) {
			alert("제목을 입력해주세요.");
			f.subject.focus();
			return;
		}
		
		if(!f.content.value) {
			alert("내용을 입력해주세요.");
			f.content.focus();
			return;
		}
		
		var url = "<%=cp%>/board/" + mode;
		var query = new FormData(f);
		
		$.ajax({
			type:"post",
			url:url,
			processData:false,
			contentType:false,
			data:query,
			dataType:"json",
			success:function(data) {
				if(data.state == "success") {
					location.href = "<%=cp%>/board/list";
					return;
				} else {   
					alert("게시글 등록이 실패했습니다.");
					$("form[name='boardForm']")[0].reset();
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