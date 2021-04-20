<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/admin.jsp" %>
<!-- exhibitList.jsp<br> -->

<script type="text/javascript">
	function insert(){
		location.href = "exhibitInput.ex";
	}
</script>

<!-- <h2>전시/박람목록</h2> -->
<center>
<br><br>
<div class="container">
	<form action="exhibitList.ex">
		<select name="whatColumn">
			<option value="All">전체</option>
			<option value="category">카테고리</option>
			<option value="name">행사명</option>
			<option value="company">회사명</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" class="btn btn-primary" value="검색">
	</form>
	<table border="1" class="table">	
		<tr class="table-secondary">
			<td colspan="12" align="right">
				<input type="button" class="btn btn-primary" value="등록" onClick="insert()">
			</td>
		</tr>
		<tr class="table-primary" align="center">
			<th>등록번호</th>
			<th>카테고리</th>
			<th>주최회사</th>
			<th>행사명</th>
			<th>행사기간</th>
			<th>행사시간</th>
			<th>장소</th>
			<th>입장료</th>
		</tr>
	
		<c:forEach var="exhibit" items="${list }">
			<tr align="center">
				<td>${exhibit.num }</td>
				<td>${exhibit.category }</td>
				<td>
					<a href="exhibitDetail.ex?num=${exhibit.num }&pageNumber=${pageInfo.pageNumber}">${exhibit.company }</a>
				</td>
				<td>${exhibit.name }</td>
				<td>
					<fmt:parseDate var="date1" value="${exhibit.start_period }" pattern="yyyy-MM-dd" />
					<fmt:parseDate var="date2" value="${exhibit.end_period }" pattern="yyyy-MM-dd" />
					<fmt:formatDate value="${date1 }"/>~<fmt:formatDate value="${date2 }"/>
				</td>
				<td>${exhibit.start_time }:00~${exhibit.end_time }:00</td>
				<td>${exhibit.place }</td>
				<td>${exhibit.price }</td>
			</tr>
		</c:forEach>
	</table>
	<div style="width: fit-content; margin: 0 auto;">
		<ul class="pagination">
			${ pageInfo.pagingHtml }
		</ul>
	</div>
</div>
</center>
<%@ include file="../../WEB-INF/common/footer.jsp" %>