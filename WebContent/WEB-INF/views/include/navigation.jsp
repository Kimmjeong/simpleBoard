<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div id="navigation">
			<ul class="nav nav-pills nav-stacked">
			<c:choose>
			
				<c:when test="${param.menu=='main'}"> 
					<li role="presentation" class="active"><a href="/simpleBoard/main">homepage</a></li>
					<li role="presentation"><a href="/simpleBoard/notice">공지사항</a></li>
					<li role="presentation"><a href="/simpleBoard/QnA">문의게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/board">자유게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/anonymous">익명게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/guestbook?a=list">방명록</a></li>
				</c:when>
				
				<c:when test="${param.menu=='notice' }">
					<li role="presentation"><a href="/simpleBoard/main">homepage</a></li>
					<li role="presentation" class="active"><a href="/simpleBoard/notice">공지사항</a></li>
					<li role="presentation"><a href="/simpleBoard/QnA">문의게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/board">자유게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/anonymous">익명게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/guestbook?a=list">방명록</a></li>
				</c:when>
				
				<c:when test="${param.menu=='QnA' }">
					<li role="presentation"><a href="/simpleBoard/main">homepage</a></li>
					<li role="presentation"><a href="/simpleBoard/notice">공지사항</a></li>
					<li role="presentation" class="active"><a href="/simpleBoard/QnA">문의게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/board">자유게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/anonymous">익명게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/guestbook?a=list">방명록</a></li>
				</c:when>
				
				<c:when test="${param.menu=='board' }">
					<li role="presentation"><a href="/simpleBoard/main">homepage</a></li>
					<li role="presentation"><a href="/simpleBoard/notice">공지사항</a></li>
					<li role="presentation"><a href="/simpleBoard/QnA">문의게시판</a></li>
					<li role="presentation" class="active"><a href="/simpleBoard/board">자유게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/anonymous">익명게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/guestbook?a=list">방명록</a></li>
				</c:when>
				
				<c:when test="${param.menu=='anonymous' }">
					<li role="presentation"><a href="/simpleBoard/main">homepage</a></li>
					<li role="presentation"><a href="/simpleBoard/notice">공지사항</a></li>
					<li role="presentation"><a href="/simpleBoard/QnA">문의게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/board">자유게시판</a></li>
					<li role="presentation" class="active"><a href="#">익명게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/guestbook?a=list">방명록</a></li>
				</c:when>
				
				<c:when test="${param.menu=='guestbook' }">
					<li role="presentation"><a href="/simpleBoard/main">homepage</a></li>
					<li role="presentation"><a href="/simpleBoard/notice">공지사항</a></li>
					<li role="presentation"><a href="/simpleBoard/QnA">문의게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/board">자유게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/anonymous">익명게시판</a></li>
					<li role="presentation" class="active"><a href="/simpleBoard/guestbook?a=list">방명록</a></li>
				</c:when>
				
				<c:otherwise>
					<li role="presentation"><a href="/simpleBoard/main">homepage</a></li>
					<li role="presentation"><a href="/simpleBoard/notice">공지사항</a></li>
					<li role="presentation"><a href="/simpleBoard/QnA">문의게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/board">자유게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/anonymous">익명게시판</a></li>
					<li role="presentation"><a href="/simpleBoard/guestbook?a=list">방명록</a></li>
				</c:otherwise>
				
			</c:choose>
			</ul>
		</div>