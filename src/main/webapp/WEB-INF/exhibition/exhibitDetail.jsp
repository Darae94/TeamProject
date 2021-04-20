<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/admin.jsp" %>
<!-- exhibitDetail.jsp<br> -->

<script type="text/javascript">
	function update(num,pageNumber){
		location.href = "exhibitUpdate.ex?num="+num+"&pageNumber="+pageNumber;
	}
	
	function del(num,pageNumber){
		//alert(pageNumber);
		var answer = confirm("삭제하시겠습니까?");
		if(answer == true){
			location.href = "exhibitDelete.ex?num="+num+"&pageNumber="+pageNumber;
		}else{
			location.href = "exhibitDetail.ex?num="+num+"&pageNumber="+pageNumber;
		}
		
	}	
</script>
<style type="text/css">
	th{
		text-align: center;
	}
</style>
<br><br>
<div class="container">
<table class="table" border="1" frame="void">
	<tr>
		<td rowspan="12" style=vertical-align:middle;text-align:center;>
			<img src="<%=request.getContextPath()%>/resources/${exhibit.img }" width="200px" height="300px"/>
		</td>
	</tr>
	<tr>
		<th class="table-secondary">등록번호</th>
		<td>${exhibit.num }</td>
	</tr>	
	<tr>
		<th class="table-secondary">카테고리</th>
		<td>${exhibit.category }</td>
	</tr>	
	<tr>
		<th class="table-secondary">주최회사</th>
		<td>${exhibit.company }</td>
	</tr>	
	<tr>
		<th class="table-secondary">행사명</th>
		<td>${exhibit.name }</td>
	</tr>	
	<tr>
		<th class="table-secondary">행사기간</th>
		<td>
			<fmt:parseDate var="date1" value="${exhibit.start_period }" pattern="yyyy-MM-dd" />
			<fmt:parseDate var="date2" value="${exhibit.end_period }" pattern="yyyy-MM-dd" />
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
		<td>${exhibit.price }</td>
	</tr>
	<tr>
		<th class="table-secondary">내용</th>
		<td>${exhibit.contents }</td>
	</tr>		
	<tr class="table-primary" align="center">
		<td colspan="3" align="center">
			<input type="button" class="btn btn-secondary" value="수정" onClick="update(${exhibit.num },${pageNumber })">
			<input type="button" class="btn btn-secondary" value="삭제" onClick="del(${exhibit.num},${pageNumber })">  
			<input type="button" class="btn btn-secondary" value="목록보기" onClick="location.href='exhibitList.ex?pageNumber=${pageNumber}'">
		</td>
	</tr>
</table>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>