<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<c:choose>
							<c:when test="${bname=='notice'}">
								<a class="navbar-brand" href="#">공지사항</a>
							</c:when>
							<c:when test="${bname=='QnA'}">
								<a class="navbar-brand" href="#">문의사항</a>
							</c:when>
							<c:when test="${bname=='board'}">
								<a class="navbar-brand" href="#">자유게시판</a>
							</c:when>
							<c:when test="${bname=='anonymous'}">
								<a class="navbar-brand" href="#">익명게시판</a>
							</c:when>
						</c:choose>

					</div>
				</div>
			</nav>
			<div id="board">
				<form id="search_form" action="/simpleBoard/${bname }" method="post">
					<input type="text" id="kwd" name="kwd" value="${kwd }"> <input
						type="submit" value="찾기">
				</form>
				<table class="table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<c:if test="${bname!='anonymous'}">
							<th>글쓴이</th>
						</c:if>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>

					<c:set var="countTotal" value="${totalCount}" />
					<%-- 게시글 갯수 --%>

					<c:forEach items="${list }" var="list" varStatus="i">
						<tr>
							<td>${countTotal-(list.rnum-1)}</td>
							<!-- 글번호 -->
							<td class="title" style="padding-left:${( list.depth )*10 }px">
								<c:if test="${list.depth > 0 }">
									<img
										src="${pageContext.request.contextPath }/assets/images/ico-reply.gif">
								</c:if> <a
								href="${pageContext.request.contextPath }/${bname }?a=view&no=${list.no }">${list.title }</a>
							</td>
							<c:if test="${bname!='anonymous'}">
								<td>${list.memberName }</td>
							</c:if>
							<td>${list.viewCnt }</td>
							<td>${list.regDate }</td>
							<td><c:choose>
									<c:when test='${authUser.no == list.memberNo }'>
										<a
											href="${pageContext.request.contextPath }/${bname }?a=delete&no=${list.no }&memberNo=${list.memberNo }"
											class="del">삭제</a>
									</c:when>
									<c:otherwise>
									  &nbsp;
								    </c:otherwise>
								</c:choose></td>
						</tr>

					</c:forEach>

				</table>
				<div class="pager">
					<ul>

						<c:set var="p" value="${temp }" />
						<%-- 페이지바 시작 번호 --%>

						<c:if test="${p!=1}">
							<li class="pg-prev"><a
								href="/simpleBoard/${bname }?page=${p-1}&kwd=${kwd }">◀ 이전</a></li>
						</c:if>

						<c:forEach begin="1" end="${totalPage}" var="i">
							<c:if test="${!(i > blockSize || p > totalPage) }">
								<c:choose>
									<c:when test="${p!=nowPage }">
										<%-- 현재 페이지가 아닐 경우 링크걸기 --%>
										<li><a
											href="/simpleBoard/${bname }?page=${p}&kwd=${kwd }">${p}</a></li>
									</c:when>
									<c:otherwise>
										<%-- 현재 페이지이면 색 주기 --%>
										<li><a
											href="/simpleBoard/${bname }?page=${p}&kwd=${kwd }"><font
												color="red">${p}</font></a></li>
									</c:otherwise>
								</c:choose>
								<c:set var="p" value="${p+1}" />
							</c:if>
						</c:forEach>

						<c:if test="${p <= totalPage}">
							<li class="pg-next"><a
								href="/simpleBoard/${bname }?page=${p}&kwd=${kwd }">다음 ▶</a></li>
						</c:if>

					</ul>
				</div>
				<div class="bottom">
				<c:choose>
				<c:when test="${bname =='notice'}">
					<c:if test="${authUser.getEmail()=='admin'}">
						<a href="/simpleBoard/${bname }?a=writeform" id="new-book">글쓰기</a>
					</c:if>
				</c:when>
				<c:otherwise>
					<a href="/simpleBoard/${bname }?a=writeform" id="new-book">글쓰기</a>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp">
			<c:param name="menu" value="${bname }"></c:param>
		</c:import>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
</body>
</html>