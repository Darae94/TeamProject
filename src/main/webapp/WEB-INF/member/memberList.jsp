<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@include file="./../common/admin.jsp"%>

<br>
<h2 align="center">회원 리스트 화면</h2><br>


<center>	
		<form action ="list.me" method="get">
			<select name="whatColumn">
				<option value="all">전체 검색
				<option value="id">회원아이디
				<option value="name">회원이름
			</select>
			
			<input type="text" name="keyword" value=""> 
			<input type="submit" value="검색">
		</form>
	</center>
<div class="container">
	<table class="table" border="1" align="center" width="60%">
		<tr class="table-primary">
			<td align="center"><b>회원번호</b></td>
			<td align="center"><b>회원아이디</b></td>
			<td align="center"><b>회원이름</b></td>
			<td align="center"><b>회원삭제</b></td>	
		</tr>
		<c:forEach items="${memberLists}" var = "member">
			<tr>
				<td align="center">
					${member.num}
				</td>
				<td align="center">
					${member.id}
				</td>
				<td align="center">
					${member.name}
				</td>
				<td align="center">
					<a href ="delete.me?id=${member.id}&pageNumber=${pageInfo.pageNumber}">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<ul class="pagination justify-content-center mt-5">${pageInfo.pagingHtml}</ul>
</div>	
<%@ include file="../../WEB-INF/common/footer.jsp" %>