<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link href="/simpleBoard/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/simpleBoard/assets/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div id="user">
				<form id="login-form" name="loginform" method="post" action="/simpleBoard/user">
					<input type="hidden" name="a" value="login">
					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					<label class="block-label" >패스워드</label>
					<input name="password" type="password" value="">
					<br>
					<label style="font-size: 0.1em">* 관리자 계정: admin / admin</label>
					<input type="submit" value="로그인">
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp"/>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>