<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
			<div id="board">
				<form class="board-form" method="post" action="/simpleBoard/${bname}">
					<input type = "hidden" name = "a" value="write">
					
					<table class="tbl-ex">
						<tr>
							<th colspan="2">글쓰기</th>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title" value=""></td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<textarea id="content" name="content"></textarea>
							</td>
						</tr>
					</table>
					<div class="bottom">
						<a href="/simpleBoard/${bname }">취소</a>
						<input type="submit" value="등록">
					</div>
					
					<input type="hidden" name="groupNo" value="${groupNo}" />
					<input type="hidden" name="orderNo" value="${orderNo}" />
					<input type="hidden" name="depth" value="${depth}" />
				</form>				
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp">
			<c:param name="menu" value="${bname }"></c:param>
		</c:import>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>