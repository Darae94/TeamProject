<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/user.jsp" %>
<!-- userExhibitDetail.jsp<br> -->
<style type="text/css">
	th{
		text-align: center;
	}
</style>
<br><br>
<div class="container">
<table class="table" border="1" frame="void">
	<tr>
		<td rowspan="10" style=vertical-align:middle;text-align:center;>
			<img src="<%=request.getContextPath()%>/resources/${exhibit.img }" width="200px" height="300px">
		</td>
	</tr>
	<tr>
		<th class="table-secondary">카테고리</th>
		<td>${exhibit.category }</td>
	</tr>	
	<tr>
		<th class="table-secondary">참가회사</th>
		<td>${exhibit.company }</td>
	</tr>	
	<tr>
		<th class="table-secondary">행사명</th>
		<td>${exhibit.name }</td>
	</tr>	
	<tr>
		<th class="table-secondary">행사기간</th>
		<td>
			<fmt:parseDate var="date1" value="${exhibit.start_period }" pattern="yy-MM-dd" />
			<fmt:parseDate var="date2" value="${exhibit.end_period }" pattern="yy-MM-dd" />
			<fmt:formatDate value="${date1 }"/>~<fmt:formatDate value="${date2 }"/>
		</td>
	</tr>	
	<tr>
		<th class="table-secondary">행사시간</th>
		<td>${exhibit.start_time }:00~${exhibit.end_time }:00</td>
	</tr>	
	<tr>
		<th class="table-secondary">장소</th>
		<td>${exhibit.place }</td>
	</tr>	
	<tr>
		<th class="table-secondary">문의처</th>
		<td>${exhibit.area_tel }-${exhibit.tel1 }-${exhibit.tel2 }</td>
	</tr>	
	<tr>
		<th class="table-secondary">입장료</th>
		<td>${exhibit.price }원</td>
	</tr>	
	<tr>
		<th class="table-secondary">내용</th>
		<td>${exhibit.contents }</td>
	</tr>		
	<tr class="table-primary" align="right">
		<td colspan="3">
			<input type="button" class="btn btn-secondary" value="이전" onClick="history.go(-1)"> 
			<input type="button" class="btn btn-secondary" value="예약하기" onClick="location.href='add.re?num=${exhibit.num}'"> 
			<!-- 로그인 안했을경우 로그인화면으로 이동...  -->
		</td>
	</tr>
</table>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>
