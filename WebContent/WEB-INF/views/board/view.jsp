<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@page import="com.hanains.mysite.vo.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% pageContext.setAttribute("enter", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link href="/simpleBoard/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/simpleBoard/assets/css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div id="board" class="board-form">
				<table class="tbl-ex">
					<tr>
						<th colspan="2">글보기</th>
					</tr>
					<tr>
						<td>제목</td>
						<td>${writing.title }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<div class="view-content">${fn:replace(writing.content,enter,"<br>") }</div>
						</td>
					</tr>
				</table>
				<div class="bottom">
					<a href="/simpleBoard/${bname }?a=list">글목록</a>
					<a href="/simpleBoard/${bname }?a=modifyform&no=${writing.no }">글수정</a>
					
					<form action="/simpleBoard/${bname }?a=writeform" method="post">
						<input type="hidden" name="groupNo" value="${writing.groupNo }"/>
						<input type="hidden" name="orderNo" value="${writing.orderNo }"/>
						<input type="hidden" name="depth" value="${writing.depth}"/>
						<input type="submit" value="답글"/>
					</form>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp">
			<c:param name="menu" value="board"></c:param>
		</c:import>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>