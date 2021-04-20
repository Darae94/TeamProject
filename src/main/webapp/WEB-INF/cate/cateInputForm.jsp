<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/admin.jsp" %>
<!-- cateInputForm.jsp<br> -->

<style type="text/css">
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}

</style>
<!-- <h2>카테고리 등록</h2> -->
<br><br>
<div class="container">
<form:form commandName="cate" action="cateInput.ca" method="post">
	<table class="table table-secondary" border="1" frame="void">
		<tr>
			<td align="center">구분</td>
			<td>
				<input type="text" name="kind">
				<form:errors cssClass="err" path="kind"/>
			</td>
		</tr>
		<tr>
			<td align="center">코드번호</td>
			<td>
				<input type="text" name="code">
				<form:errors cssClass="err" path="code"/>
			</td>
		</tr>
		<tr class="table-primary" align="center">
			<td colspan="2">
				<input type="submit" class="btn btn-secondary" value="등록">
				<input type="reset" class="btn btn-secondary" value="취소">
				<input type="button" class="btn btn-secondary" value="목록보기" onClick="location.href='cateList.ca'">
			</td>
		</tr>
	</table>
</form:form>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>

