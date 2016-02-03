<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.9.0.js"></script>

<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/user.css" rel="stylesheet" type="text/css">

<script>
	$(function(){
	
		var check=false;
		
		$("#email").change(function(){
			$("#btn-checkemail").show();
			$("#image-checked").hide();
			check=false;
		});
		 
		$("#btn-checkemail").click(function(){
			
			var email=$("#email").val();
			if(email==""){
				alert("이메일을 입력해주세요");
				return;
			}
			
			$.ajax({
				url:"${pageContext.request.contextPath}/api/user/checkemail",
				type:"get",
				dataType:"json",
				data:"email="+email,
				//  contentType: "application/json",
				success: function(response){
					console.log(response);
					if(response.result=="fail"){
						console.error(response.message);
						return;
					}
					
					if(response.data==false){
						alert("이미 사용중인 이메일입니다.");
						var $email=$("#email");
						$email.val("");
						$email.focus();
						return;
					}
					
					$("#btn-checkemail").hide();
					$("#image-checked").show();
					check=true;
					
				},
				error: function(jqXHR, status, error ){
					console.error(status+":"+error);
				}
				
			});
		});
		
		$("#join").click(function(){
			var name=$("#name").val();
			var email=$("#email").val();
			var password=$("#password").val();
			
			if(name==''){
				alert("이름을 입력해 주세요.");
				$("#name").focus();
				return;
			}
			if(password==''){
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return;
			}
			if(check==false){
				alert("아이디 중복 체크를 해주세요.");
				return;
			}
			
			$("#join-form").submit();
			
		});
	});
</script>

</head>
<body>
	<div class="container">
		<c:import url="/WEB-INF/views/include/header.jsp"/>
		<div class="content">
			<div id="user">

				<form id="join-form" name="joinForm" method="post" action="/simpleBoard/user">
					<input type="hidden" name="a" value="join">
					
					<label class="block-label" for="name">이름</label>
					<input id="name" name="name" type="text" value="">

					<label class="block-label" for="email">이메일</label>
					<input id="email" name="email" type="text" value="">
					
					<img id="image-checked" src="${pageContext.request.contextPath}/assets/images/checked.png" style="width:12px; display:none">
					<input type="button" id="btn-checkemail" value="중복체크">
					
					<label class="block-label">패스워드</label>
					<input id="password" name="password" type="password" value="">
					
					<fieldset>
						<legend>성별</legend>
						<label>여</label> <input type="radio" name="gender" value="female" checked="checked">
						<label>남</label> <input type="radio" name="gender" value="male">
					</fieldset>
					
					<input type="button" id="join" value="가입하기" >
					
				</form>
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp"/>
		<c:import url="/WEB-INF/views/include/footer.jsp"/>
	</div>
	
</body>
</html>