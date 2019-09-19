<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<!doctype html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="ko"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="ko"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="ko"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="ko"> <!--<![endif]-->
<head>
    <meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    
    <title>JINYANG | SITE</title>
    
    <!-- Favicon - 파비콘 (주소창 영역 아이콘) -->
    <link rel="Shortcut Icon" href="<%=cp%>/resources/images/common/favicon.ico"/>
    
    <!-- Css -->
    <link rel="stylesheet" href="<%=cp%>/resources/css/common.css" media="all" />
	<link rel="stylesheet" href="<%=cp%>/resources/css/loginStyle.css" media="all" />

    <!-- Javascript -->
    <script src="<%=cp%>/resources/js/lib/jquery-1.12.4.min.js"></script>
	<script src="<%=cp%>/resources/js/lib/jquery-migrate-1.4.1.min.js"></script>
    <script src="<%=cp%>/resources/js/lib/jquery-ui-1.12.1.min.js"></script>
    
    <script src="<%=cp%>/resources/js/plugins.js"></script>
    <script src="<%=cp%>/resources/js/basic.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
        <script src="resources/js/lib/html5shiv.js"></script>
    <![endif]-->
</head>

<body>
    <!-- Wrap -->
    <div id="wrap" class="login_wrap">
        <!-- Header -->
        <header>
            <div class="login_header">
                <h1 class="title">
                    <a href="main.html">JINYANG | SITE</a>
                </h1>
            </div>
        </header>
        <!-- //Header -->
        
        <!-- container -->
        <div id="container" class="login_container">
            <!-- contents -->
            <div class="register">
                <form name="login_form" method="post">
                    <fieldset>
                        <div class="box_login">
                            <h3 class="title">로그인</h3>
                            <div class="mt30">
                                <label for="txt_id">아이디</label>
                                <div>
                                    <input type="text" name="id" id="txt_id" class="boxTf" autocomplete="off" autofocus/>
                                </div>
                            </div>
                            <div class="mt30">
                                <label for="txt_pwd">비밀번호</label>
                                <div>
                                    <input type="password" name="pwd" id="txt_pwd" class="boxTf" autocomplete="off" autofocus/>
                                </div>
                            </div>
                            <div class="mt50">
                                <button type="button" class="btn_login" onclick="sendLogin();">로그인</button>
                            </div>
                            <c:if test="${not empty message}">
	                            <div class="mt20 login_message">
	                            	<span>※ ${message}</span>
	                            </div>
                            </c:if>
                        </div>
                    </fieldset>
                </form>
            </div>
            <!-- //contents -->
        </div>
        <!-- //container -->
        
        <!-- Footer -->
        <footer class="clear login">
            <div class="box_footer">
                <div class="copyright">
                    <p>Copyright (c) JINYANG All rights reserved.</p>
                </div>
            </div>
        </footer>
        <!-- //Footer -->
    </div>
    <!-- //Wrap -->
	
	<!-- Java Script -->
	<script src="<%=cp%>/resources/js/lib/util.js"></script>
	<script src="<%=cp%>/resources/js/lib/util-jquery.js"></script>
	<%-- <script type="text/javascript">
		function sendLogin() {
			var id = $("input[name='id']").val();
			var pwd = $("input[name='pwd']").val();
			
			if(!id || !pwd) {
				alert("아이디 또는 비밀번호를 입력해주세요.");
				return;
			}
			
			var url = "<%=cp%>/member/login_check";
			var query = $("form[name='login_form']").serialize();
			
			$.ajax({
				type:"post",
				url:url,
				data:query,
				success:function(data) {
					if(data) {
						location.href="<%=cp%>/";	
					} else {
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");	
					}
				},
				beforeSend:function(e) {
					console.log(e);
					e.setRequestHeader("AJAX", true);
				},
				error:function(e) {
					if(e.status == 403) {
						alert("아이디 또는 비밀번호가 일치하지 않습니다.");
						location.href = "<%=cp%>/member/login?login_error";
						return;
					}
					
					console.log(e.responseText);
				}
			});
		}
	</script> --%>
	<script type="text/javascript">
		function sendLogin() {
			var f = document.login_form;
			
			var id = $("input[name='id']").val();
			var pwd = $("input[name='pwd']").val();
			
			if(!id || !pwd) {
				alert("아이디 또는 비밀번호를 입력해주세요.");
				return;
			}
			
			f.action = "<%=cp%>/member/login_check";
			f.submit();
		}
	</script>
</body>
</html>
