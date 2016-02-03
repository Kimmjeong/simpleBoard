<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  

<script type="text/javascript">
	
	function logout() {
		alert("로그아웃 되었습니다.");
	}

</script>

	<div id="header">
		<div class="page-header">
			<h1>
				Welcom! <small>Hello world</small>
			</h1>
		</div>
			<ul>
				<c:choose>
					<c:when test="${empty authUser }">
						<li><a href="/simpleBoard/user?a=loginform">로그인</a></li>
						<li><a href="/simpleBoard/user?a=joinform">회원가입</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/simpleBoard/user?a=logout" onclick="logout()">로그아웃</a></li>
						<li>${ authUser.name }님 안녕하세요 ^^;</li> <%-- = ${ sessionScope.authUser.name } --%>
					</c:otherwise>
				</c:choose>
			</ul>
	</div>