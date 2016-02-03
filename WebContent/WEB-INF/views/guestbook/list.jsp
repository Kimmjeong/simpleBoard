<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@page import="com.hanains.mysite.vo.GuestBookVo"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<% pageContext.setAttribute("enter", "\n"); %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link href="/simpleBoard/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/simpleBoard/assets/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div id="guestbook">
				<form action="/simpleBoard/guestbook" method="post">
					<input type="hidden" name="a" value="insert">
					
					<table>
						<tr>
							<td>이름</td><td><input type="text" name="name"></td>
							<td>비밀번호</td><td><input type="password" name="pass"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="content" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				
				<ul>
					<c:set var="countTotal" value="${fn:length(list) }"/>
					<c:forEach items="${list }" var="vo" varStatus="status">
						<li>
							<table>
								<tr>
									<td>[${countTotal-status.index }]</td>
									<td>${vo.name }</td>
									<td>${vo.regDate }</td>
									<td><a href="/simpleBoard/guestbook?a=deleteform&no=${vo.no }">삭제</a></td>
								</tr>
								<tr>
									<td colspan=4>${fn:replace(vo.message,enter,"<br>") }</td>
								</tr>
							</table>
							<br>
						</li>
					</c:forEach>
				</ul>

			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp">
			<c:param name="menu" value="guestbook"></c:param>
		</c:import>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>