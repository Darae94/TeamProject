<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/admin.jsp" %>

<!-- exhibitInputForm.jsp<br> -->

<style type="text/css">
	.err{
		font-size: 9pt;
		color: red;
		font-weight: bold;
	}
</style>

<!-- <h2>전시/박람 등록</h2> -->
<br><br>
<div class="container">
<form:form commandName="exhibition" action="exhibitInput.ex" method="post" enctype="multipart/form-data">
	<table class="table table-secondary" border="1" frame="void">
		<tr>
			<td>카테고리</td>
			<td>
				<select name="category">
						<option value="">선택
					<c:forEach var="cate" items="${list }">
						<option value="${cate.kind}">${cate.kind}(${cate.code })</option>  
					</c:forEach>
				</select>
				<form:errors cssClass="err" path="category"/>
			</td>
		</tr>
		<tr>
			<td>행사명</td>
			<td>
				<input type="text" name="name">
				<form:errors cssClass="err" path="name"/>
			</td>
		</tr>
		<tr>
			<td>행사기간</td>
			<td>
				<input type="date" name="start_period">
				<form:errors cssClass="err" path="start_period"/>
				 ~
				<input type="date" name="end_period">
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
					<option value="<%=i%>"> <%=i %>:00 </option>
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
					<option value="<%=i%>"> <%=i %>:00 </option>
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
				<input type="text" name="place">
				<form:errors cssClass="err" path="place"/>		
			</td>
		</tr>
		<tr>
			<td>주최회사</td>
			<td>
				<input type="text" name="company">
				<form:errors cssClass="err" path="company"/>	
			</td>
		</tr>
		<tr>
			<td>입장료</td>
			<td>
				<input type="text" name="price" value="0">
				<form:errors cssClass="err" path="price"/>
			</td>
		</tr>
		<tr>
			<td>문의처</td>
			<td>
				<select name="area_tel">
					<option value="02">02</option>
					<option value="031">031</option>
					<option value="032">032</option>
				</select> -
				<input type="text" name="tel1" size="4">
				<form:errors cssClass="err" path="tel1"/>
				 -
				<input type="text" name="tel2" size="4">
				<form:errors cssClass="err" path="tel2"/>
			</td>
		</tr>
		<tr>
			<td>이미지</td>
			<td>
				<input type="file" name="upload">
				<form:errors cssClass="err" path="img"/>	
			</td>
		</tr>
		<tr>
			<td>전시/박람 스타일</td>
			<td>
				<input type="radio" name="style" value="현대적인"> 현대적인&nbsp;
				<input type="radio" name="style" value="예술적인"> 예술적인&nbsp;
				<input type="radio" name="style" value="감각적인"> 감각적인&nbsp;
				<input type="radio" name="style" value="실용적인"> 실용적인&nbsp;
				<input type="radio" name="style" value="에너지넘치는"> 에너지넘치는&nbsp;
				<input type="radio" name="style" value="감성적인"> 감성적인&nbsp;
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea cols="50" rows="10" name="contents" style=resize:none;>내용없음</textarea>
				
			</td>
		</tr>
		<tr class="table-primary" align="center">
			<td colspan="12">
				<input type="submit" class="btn btn-secondary" value="등록">
				<input type="reset" class="btn btn-secondary" value="취소">
				<input type="button" class="btn btn-secondary" value="목록보기" onClick="location.href='exhibitList.ex'">
			</td>
		</tr>
	</table>
</form:form>
</div>
<%@ include file="../../WEB-INF/common/footer.jsp" %>