<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/admin.jsp" %>

<!-- cateList.jsp<br> -->

<script type="text/javascript">
	function input(){
		location.href = "cateInput.ca";
	}	
	
	function deleteCheck(num,pageNumber){
		var answer = confirm("삭제하시겠습니까?");
		if(answer == true){
			location.href = "cateDelete.ca?num="+num+"&pageNumber="+pageNumber;
		}else{
			location.href = "cateList.ca?pageNumber="+pageNumber;  
		}
	}
</script>
<div class="container">
<center>
<br><br>
<form action="cateList.ca">
<select name="whatColumn">
	<option value="All">전체</option>
	<option value="kind">구분</option>
	<option value="code">코드번호</option>
</select>
	<input type="text" name="keyword">
	<input type="submit" class="btn btn-primary" value="검색">
</form>
</center>
<table border="1" class="table">	
	<tr class="table-secondary">
		<td colspan="5" align="right">
			<input type="button" class="btn btn-primary" value="추가등록" onClick="input()">
		</td>
	</tr>
	<tr class="table table-primary" align="center">
		<th>번호</th>
		<th>구분</th>
		<th>코드번호</th>
		<th>수정</th>
		<th>삭제</th>
	</tr>

	<c:forEach var="cate" items="${list }">
		<tr align="center">
			<td>${cate.num }</td>
			<td>${cate.kind }</td>
			<td>${cate.code }</td>
			<td><a href="cateUpdate.ca?num=${cate.num }&pageNumber=${pageInfo.pageNumber}">수정</a></td>
			<td>
				<a href="javascript:deleteCheck('${cate.num }','${pageInfo.pageNumber }')">삭제</a>
			</td>
		</tr>
	</c:forEach>
</table>
	<div style="width: fit-content; margin: 0 auto;">
		<ul class="pagination">
			${ pageInfo.pagingHtml }
		</ul>
	</div>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>
