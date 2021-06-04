<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../includes/header.jsp"%>

</head>
<body>
	<form action="<%=request.getContextPath()%>/SignupController"
		class="create-account-form" style="border: 1px solid #cfcfcf; align: middle;" method="post">
	<div style="border: 1px solid #cfcfcf; width: 520px; margin:0 34%;">
		<!-- 		padding: 36px 500px; -->
		<h2 class="heading-title" style="width:500px; margin-left: 10px; margin-top: 10px;">SIGN UP PAGE</h2>
		<p class="form-row" style="width:500px; margin-left: 10px;">
		
			<input type="text" name="id" placeholder="ID" value="${id}">
			
		</p>
		
		<p class="form-row" style="width:500px; margin-left: 10px;">
			<input type="password" name="pwd" placeholder="Password">
		</p>

		<p class="form-row" style="width:500px; margin-left: 10px;">
			<input type="text" name="email" placeholder="Email">
		</p>
		<p class="form-row" style="width:500px; margin-left: 10px;">
			<input type="text" name="gender" placeholder="Gender">
		</p>
		<p class="form-row" style="width:500px; margin-left: 10px;">
			<input type="text" name="phonenum" placeholder="Phonenumber">
		</p>
		<p class="lost-password form-group" style="width:500px; margin-left: 10px;">
		
		</p>
		<div class="submit">
			<button name="submitcreate" id="submitcreate" type="submit"
				class="btn-default" style="margin: 10px;">
				<span> <i class="fa fa-user left"></i> SING UP
				</span>
			</button>
		</div>
	</div>
	</form>

</body>
<%@ include file="../includes/footer.jsp"%>
</html>