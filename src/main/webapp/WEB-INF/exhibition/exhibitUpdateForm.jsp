<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/admin.jsp" %>
<!-- exhibitUpdateForm.jsp<br> -->

<style type="text/css">
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}
</style>
<%
	String[] style = {"현대적인","예술적인","감각적인","실용적인","에너지넘치는","감성적인"};
%>
<!-- <h2>전시/박람 수정</h2> -->
<br><br>
<div class="container">
<form:form commandName="exhibition" action="exhibitUpdate.ex" method="post" enctype="multipart/form-data">
	<input type="hidden" name=num value="${exhibition.num }">
	<input type="hidden" name=pageNumber value="${pageNumber}">
	<table class="table table-secondary" border="1" frame="void">
		<tr>
			<td>카테고리</td>
			<td>
				<select name="category">
						<option value="">선택
					<c:forEach var="cate" items="${list }">
						<option value="${cate.kind}" <c:if test="${cate.kind == exhibition.category}"> selected </c:if>  >${cate.kind}(${cate.code })</option>  
					</c:forEach>
				</select>
				<form:errors cssClass="err" path="category"/>
			</td>
		</tr>
		<tr>
			<td>행사명</td>
			<td>
				<input type="text" name="name" value="${exhibition.name}">
				<form:errors cssClass="err" path="name"/>
			</td>
		</tr>
		<tr>
			<td>행사기간</td>
			<td>
				<fmt:parseDate value='${exhibition.start_period }' var='start' pattern='yyyy-MM-dd'/>
				<fmt:formatDate var="start_day" value="${start}" pattern="yyyy-MM-dd"/>
				<input type="date" name="start_period" value="${start_day}" >
				<form:errors cssClass="err" path="start_period"/>
				 ~
				<fmt:parseDate value='${exhibition.end_period }' var='end' pattern='yyyy-MM-dd'/>
				<fmt:formatDate var="end_day" value="${end}" pattern="yyyy-MM-dd"/>
				<input type="date" name="end_period" value="${end_day}">
				<form:errors cssClass="err" path="end_period"/>
			</td>
		</tr>
		<tr>
			<td>행사시간</td>
			<td>
				<select name="start_time">
				<option value="">선택
<%
				for(int i=9; i<12; i++){
%>
					<c:set var="i" value="<%=i %>"/>
					<option value="${i }" <c:if test="${exhibition.start_time == i }"> selected </c:if> > ${i }:00 </option>
<%
				}
%>
				</select>
				<form:errors cssClass="err" path="start_time"/>
				~
				<select name="end_time">
				<option value="">선택
<%
				for(int i=18; i<21; i++){
%>
					<c:set var="i" value="<%=i %>"/>
					<option value="${i }" <c:if test="${exhibition.end_time == i }"> selected </c:if> > ${i }:00 </option>
<%
				}
%>
				</select>
				<form:errors cssClass="err" path="end_time"/>
				
			</td>
		</tr>
		<tr>
			<td>장소</td>
			<td>
				<input type="text" name="place" value="${exhibition.place }">
				<form:errors cssClass="err" path="place"/>		
			</td>
		</tr>
		<tr>
			<td>주최회사</td>
			<td>
				<input type="text" name="company" value="${exhibition.company }">
				<form:errors cssClass="err" path="company"/>	
			</td>
		</tr>
		<tr>
			<td>입장료</td>
			<td>
				<input type="text" name="price" value="${exhibition.price }">
				<form:errors cssClass="err" path="price"/>
			</td>
		</tr>
		<tr>
			<td>문의처</td>
			<td>
				<select name="area_tel">
					<option value="02" <c:if test="${exhibition.area_tel == '02' }"> selected </c:if>>02</option>
					<option value="031" <c:if test="${exhibition.area_tel == '031' }"> selected </c:if>>031</option>
					<option value="032" <c:if test="${exhibition.area_tel == '032' }"> selected </c:if>>032</option>
				</select> -
				<input type="text" name="tel1" value="${exhibition.tel1}" size="4"> 
				<form:errors cssClass="err" path="tel1"/>
				-
				<input type="text" name="tel2" value="${exhibition.tel2}" size="4">
				<form:errors cssClass="err" path="tel2"/>
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<img src="<%=request.getContextPath()%>/resources/${exhibition.img}" width="50px" height="50px">
				<input type="file" name="upload">	
				<input type="hidden" name="upload2" value="${exhibition.img }">
				<form:errors cssClass="err" path="img"/>
			</td>
		</tr>
		<tr>
			<td>전시/박람 스타일</td>
			<td>
				<c:forEach var="style" items="<%=style %>">  
					<input type="radio" name="style" value="${style}" <c:if test="${fn:contains(exhibition.style,style)}"> checked </c:if>> ${style }
				</c:forEach>	
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea cols="30" rows="10" name="contents" style=resize:none;>${exhibition.contents }</textarea>
				
			</td>
		</tr>
		<tr class="table-primary" align="center">
			<td colspan="12">
				<input type="submit" class="btn btn-secondary" value="수정">
				<input type="reset" class="btn btn-secondary" value="취소">
				<input type="button" class="btn btn-secondary" value="목록보기" onClick="location.href='exhibitList.ex'">
			</td>
		</tr>
	</table>
</form:form>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>