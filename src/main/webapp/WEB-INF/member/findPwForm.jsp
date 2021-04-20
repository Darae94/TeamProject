<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/user.jsp" %>
    
<div class="container">
	<h3 align=center style="padding:20px 0">비밀번호찾기</h3>

	<form:form commandName = "member" method="post" action ="findPw.me">
		
		<table border=1 class="table" style="width:auto; margin:0 auto;">
			<tr>
				<th class="table-secondary"><label for = "id">아이디</label></th>
				<td>
					<input class="form-control" type="text" name="id" min="1" required>
					<form:errors cssClass="err" path="id"/>
				</td>
			</tr>
			
			<tr>
				<th class="table-secondary"><label for = "name">이름</label></th>
				<td>
					<input class="form-control" type="text" name="name" min="1" required>
					<form:errors cssClass="err" path="name"/>
				</td>
			</tr>
			
			<tr>
				<th class="table-secondary"><label for = "email">이메일</label></th>
				<td><input class="form-control" type="text" name="email" min="1" required>
				<form:errors cssClass="err" path="email"/></td>
			</tr>
			
			<tr align="center" class="table-primary">
				<td colspan=2><input class="btn btn-secondary" type="submit" value="비밀번호 찾기"></td>
			</tr>
		</table>
	</form:form>
</div>	
<%@ include file="../../WEB-INF/common/footer.jsp" %>