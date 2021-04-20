<%@page import="member.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Member loginInfo = (Member) session.getAttribute("loginInfo");
	if(loginInfo.getNum() != 0) {
	%>
		<%@ include file="../common/user.jsp" %>
	<% 
	} else {
	%>
		<%@ include file="../common/admin.jsp" %>
	<%
	}
%>
<!-- orderList.jsp => 주문 목록 보기 : 추가된 order 테이블 출력 -->
<style>
	table {
		width:80%;
		margin:0 auto 20px;
	}
	
	th, td {
		padding: 5px 2px;
	}
	
	table a {
		color: white;
		font-weight: bold;
	}
</style>

<div class="container">
	<h3 align=center style="padding:20px 0">구매 내역</h3>
	<table border=1>
		<c:if test="${ loginInfo.num > 0 }">
		<tr>
			<td colspan=3 align=center class="table-success">
				주문자 정보 : ${ loginInfo.name }(${ loginInfo.id })
			</td>
		</tr>
		</c:if>
		<tr class="table-primary" align=center>
			<th width="20%">주문 번호</th>
			<c:if test="${ loginInfo.num == 0 }"><th align=center>회원 아이디</th></c:if>
			<th>주문 일자</th>
			<th width="20%">상세 보기</th>
		</tr>
		<c:if test="${ fn:length(olists) == 0 }">
			<tr class="table-secondary">
				<c:if test="${ loginInfo.num == 0 }"><td colspan=4 align="center">주문 내역이 없습니다.</td></c:if>
				<c:if test="${ loginInfo.num > 0 }"><td colspan=3 align="center">주문 내역이 없습니다.</td></c:if>
			</tr>
		</c:if>
		<c:forEach var="od" items="${ olists }" varStatus="order">
		<tr align=center class="table-secondary">
			<td>${ od.onum }</td>
			<c:if test="${ loginInfo.num == 0 }"><td>${ od.mid }</td></c:if>
			<td>
				<fmt:parseDate var="date" value="${ od.odate }" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${ date }"/>
			</td>
			<td><a href="detail.re?onum=${ od.onum }&mid=${ od.mid}">상세 보기</a></td>
		</tr>
		</c:forEach>
	</table>
	<%-- <input type="button" value="메인으로" onClick="location.href='<%=main%>'"> --%>
	<div style="width: fit-content; margin: 0 auto;">
		<ul class="pagination justify-content-center">${pageInfo.pagingHtml}</ul>
	</div>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>