<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/user.jsp" %>

<style type="text/css">
	.err{
		font-size: 9pt;
		color:orange;
		font-weight: bold;
	}
	
	table .w20 {
		display: inline-block;
		width: 20%;
	}
</style>

<script type="text/javascript">
	function register() {
		location.href = "registerForm.me"; // => MemberRegisterController.java
	}
	function findId(){
		location.href = "findId.me";
	}
	function findPw(){
		location.href = "findPw.me";
	}
</script>
<br>
<br>
<div class="container">

<form method="post" action="loginForm.me">
	<table border="1" class="table table-secondary" style="width:auto;margin: 0 auto;">
		<tr>
			<td class="table-primary">아이디</td>
			<td><input type="text" name="id"></td>
		</tr>
		
		<tr>
			<td class="table-primary">비번</td>
			<td><input type="text" name="password"></td>
		</tr>
		
		<tr>
			<td colspan="2" class="table-primary">
				<input class="btn btn-success" type="submit" value="로그인">
				<input class="btn btn-secondary" type="button" value="회원가입" onClick="register()">
				<input class="btn btn-secondary" type="button" value="아이디찾기" onClick="findId()">
				<input class="btn btn-secondary" type="button" value="비밀번호찾기" onClick="findPw()">
			</td>
		</tr>
	</table>
</form>
</div>

<%@ include file="../../WEB-INF/common/footer.jsp" %>