<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<nav id="gnb">
	<ul>
		<li><a href="<%=cp%>/myInfo">마이페이지</a></li>
		<li><a href="#">커뮤니티</a>
			<div>
				<ul>
					<li><a href="<%=cp%>/community/list"><span class="blind">커뮤니티</span> 리스트</a></li>
					<li><a href="<%=cp%>/community/write"><span class="blind">커뮤니티</span> 등록</a></li>
				</ul>
				<!-- Sample Source -->
				<!--<ul>
					<li><a href="#"><span class="blind">커뮤니티</span> 리스트</a></li>
					<li><a href="#"><span class="blind">커뮤니티</span> 등록</a>
						<div>
							<ul>
								<li><a href="#">출석관리</a></li>
								<li><a href="#">근무일지</a></li>
							</ul>
						</div>
					</li>
				</ul>-->
			</div>
		</li>
		<li><a href="#">게시글</a>
			<div>
				<ul>
					<li><a href="<%=cp%>/board/list"><span class="blind">게시글</span> 리스트</a></li>
					<li><a href="<%=cp%>/board/write"><span class="blind">게시글</span> 등록</a></li>
				</ul>
			</div>
		</li>
	</ul>
</nav>
