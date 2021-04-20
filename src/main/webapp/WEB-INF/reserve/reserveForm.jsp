<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./../common/user.jsp" %>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	var day, time, num;
	
	function daySelect(d, n) {
		day = d;
		num = n;
		//alert(d);
		if(time != null) {
			getStock(day, time, num);
		}
	}

	function timeSelect(t) {
		time = t;
		//alert(t);
		if(day != null) {
			getStock(day, time, num);
		}
	}
	
	function getStock(d, t, n) {
		//alert(d+"/"+t+"/"+n);
		$.ajax({
			url : "check.re",
			type : "get",
			data : ({
				"pnum" : n,
				"oday" : d,
				"otime" : t
			}),
			success : function(data){
				if($.trim(data) > 0) {
					alert("수량은 최대 "+data+"까지 주문 가능합니다.");
					$("#reserveSubmit").html("<tr><td width='20%'><label for='oqty'>수량 : </label></td><td><input id='oqty' class='form-control' type='number' name='oqty' value=1 max='"+data+"' min='1' required></td></tr><tr><td colspan='2' align='center'><input class='btn btn-primary' type='submit' value='장바구니 추가'></td></tr>");
				} else {
					$("#reserveSubmit").html("");
					alert("주문 불가능합니다. 날짜나 시간을 다시 골라주세요!");
				}
			}
		});
	}
	
</script>

<!-- reserveForm.jsp<br> -->
<style>
	table {
		width:80%;
		margin:0 auto 20px;
	}
	
	table table {
		margin: 0 auto;
	}
	
	th, td {
		padding: 5px;
	}
</style>

<div class="container">
	<h3 align=center style="padding:20px 0">예약 하기</h3>
	<table border="1" class="table-secondary">
		<tr>
			<td rowspan="5" align="center">
				<img src="<%=request.getContextPath()%>/resources/${exhi.img }" width="150px" height="150px">
			</td>
			<th class="table-primary">행사명</th>
			<td>${exhi.name }</td>
		</tr>	
		<tr>
			<th class="table-primary">행사기간</th>
			<td>
				<fmt:parseDate var="date1" value="${exhi.start_period}" pattern="yyyy-MM-dd" />
				<fmt:parseDate var="date2" value="${exhi.end_period}" pattern="yyyy-MM-dd" />
				<fmt:formatDate value="${date1}"/>~<fmt:formatDate value="${date2}"/>
			</td>
		</tr>	
		<tr>
			<th class="table-primary">행사시간</th>
			<td>${exhi.start_time}:00~${exhi.end_time}:00</td>
		</tr>	
		<tr>
			<th class="table-primary">장소</th>
			<td>${exhi.place}</td>
		</tr>
		<tr>
			<th class="table-primary">입장료</th>
			<td><fmt:formatNumber pattern="#,###">${exhi.price }</fmt:formatNumber> 원</td>
		</tr>
		<tr>
			<td colspan="3">
				<form action="add.re" method="post">
					<input type="hidden" name="pnum" value="${exhi.num}">
					<table class="table-secondary">
						<tr>
							<td colspan=2 style="color:red; font-weight:bold">** 일자와 시간을 입력해주세요!</td>
						</tr>
						<tr>
							<td width="20%"><label for="oday">관람 일자 : </label></td>
							<td>
								<input id="oday" class="form-control" type="date" name="oday" min="<fmt:formatDate value="${date1}" pattern="yyyy-MM-dd"/>"
								 max="<fmt:formatDate value="${date2}" pattern="yyyy-MM-dd"/>"
								 onChange="return daySelect(oday.value, ${exhi.num})" >
							</td>
						</tr>
						<tr>
							<td width="20%"><label for="otime">관람 시간 : </label></td>
							<td>
								<select id="otime" class="form-control" name="otime" onchange="return timeSelect(otime.value)">
									<option value=""> 선택하세요.
									<c:forEach var="time" begin="${exhi.start_time}" end="${exhi.end_time}">
										<option value="${time}"> ${time}: 00
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>
					<!-- 일자와 시간 입력하면 여부에 따라 아래 진행 -->
					<table id="reserveSubmit" class="table-secondary">
					</table>
				</form>
			</td>
		</tr>
	</table>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>