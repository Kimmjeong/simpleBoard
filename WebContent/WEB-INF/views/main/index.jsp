<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
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

<link href="/simpleBoard/assets/css/mysite.css" rel="stylesheet" type="text/css">
<style>
	#profile{
		float: left;
	    width: 28%;
	    margin-left: 38px;
	}
	#intro{
		float: right;
	    width: 65%;
	    height: 430px;
	}	
</style>
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div id="wrapper">
			<div class="content">
				<div id="site-introduction">
					<div id="image">
						<img id="profile" src="${pageContext.request.contextPath}/assets/images/yoojeong.PNG">
					</div>
					<div id="intro" class="jumbotron">
						<h1>Hello, world!</h1>
						<p style="text-align: left">This is a minjeong's page.<br> 
						If you want to leave a post, please Login.
						If you aren't member, click the join button.<br>
						And If you just visit my page, Please leave a message on guestbook.<br>
						</p>
						<div style="text-align: left">* Note Notice that only administrators are writing this authority.</div>
						<br>
						
						<p>
							<a class="btn btn-primary btn-lg" href="http://localhost:8080/simpleBoard/guestbook?a=list" role="button">GuestBook</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp">
			<c:param name="menu" value="main"></c:param>
		</c:import>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
	
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/simpleBoard/assets/bootstrap/js/bootstrap.min.js"></script>
	
</body>
</html>