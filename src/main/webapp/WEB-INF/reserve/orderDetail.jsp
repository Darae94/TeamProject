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

<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".ticketBtn").click(function(){
			$(this).next().removeClass("hide");
		});
		
		$(".ticket").click(function(){
			$(this).addClass("hide");
		});
	});
</script>

<!-- orderDetailList.jsp => 주문 상세 목록 보기 : order table의 primary key로 해당 orderdetail 목록 출력
로그인 id >> ${ loginInfo.id }<br> -->
<style>
	table {
		width:80%;
		margin:0 auto 20px;
	}
	
	th, td {
		padding: 5px;
	}
	
	td img {
		float: right;
	}
	
	table a {
		color: white;
		font-weight: bold;
	}
	
	.ticket img {
		margin: 5px;
		float: none;
	}
	
	.ticket {
		position: relative;
		top: 0;
		left: 0;
		background: #fff;
		margin-top: 5px;
	}
	
	.ticket span {
		position: absolute;
		top: 2px;
		right: 2px;
		color: black;
		line-height: 0.8;
	}
	
	.hide {
		display: none;
	}
</style>

<div class="container">
	<h3 align=center style="padding:20px 0">구매 상세 내역</h3>
	<table border=1>
		<tr class="table-success">
			<td colspan=3>고객 : ${ mb.name }</td>
			<td>주문 번호 : ${ onum }</td>
			<td align=center><input class="btn btn-secondary" type="button" value="목록으로" onclick="location.href='order.re'"></td>
		</tr>
		<tr class="table-primary">
			<th>순번</th>
			<th>상품정보</th>
			<th>수량</th>
			<th>단가</th>
			<th>금액</th>
		</tr> 
		<c:forEach items="${ list }" var="show" varStatus="status">
		<tr class="table-secondary">
			<td align=center>${ status.count }</td>
			<td>
				<img src="<%=request.getContextPath()%>/resources/${ show.pimg }" width="100" height="100">
				<div style="float:left; padding:5px; line-height: 1.8;">
					행 사 명 : ${ show.pname }<br>
					관람날짜 : ${ show.oday }<br>
					관람시간 : ${ show.otime }:00<br>
					<input type="button" class="ticketBtn btn btn-primary" value="바코드 보기">
					<div class="hide ticket">
						<span>X</span>
						<img src="resources/image/barcode.png" width="150" height="50" alt="${ show.pname } (${ show.oday }/${ show.otime }:00)">
					</div>
				</div>
			</td>
			<td align=center>${ show.oqty }</td>
			<td align="right"><fmt:formatNumber pattern="#,###">${ show.price }</fmt:formatNumber> 원</td>
			<td align="right"><fmt:formatNumber pattern="#,###" value="${ show.amount }" /> 원</td>
		</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>