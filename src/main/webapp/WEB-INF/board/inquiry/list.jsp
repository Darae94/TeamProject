<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null) {
		%>
			<%@ include file="../../common/user.jsp" %>
		<% 	
		} else {
		   if(loginId.equals("penguin")) {
		   %>
		      <%@ include file="../../common/admin.jsp" %>
		   <% 
		   } else {
		   %>
		      <%@ include file="../../common/user.jsp" %>
		   <%
		   }
		}
	%>

<div class="container">
<div class="border-bottom border-secondary mt-5 pb-2"><h5 class="text-primary"><b>1:1문의</b></h5></div><br>
	<form action="list.inq">
	<div class="input-group input-group-sm mb-3 p-3 border bg-light mx-auto" style="width: 35%">
		<select class="form-select mr-2" name="whatColumn">
			<option value="All">전체</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="id">아이디</option>
		</select>
		<input class="form-control mr-2 border border-secondary" type="text" name="keyword">
		<input class="border border-secondary bg-white" style="font-size: 14px" type="submit" value="검색">
	</div>
	</form>
	
	<table class="table">
		<tr class="text-center">
			<th>번호</th>
			<th>문의유형</th>
			<th class="w-50">제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		
		<c:forEach items="${lists}" var="inq" varStatus="stu">
			<tr class="text-center">
				<td>${(pageInfo.totalCount-stu.index)-((pageInfo.pageNumber-1)*pageInfo.pageSize)}</td>
				<td>
					<c:choose>
						<c:when test="${inq.restep>0}"><c:out value="답변"/></c:when>
						<c:otherwise>${inq.category}</c:otherwise>
					</c:choose>
				</td>
				<td align="left">
					<c:if test="${inq.restep>0}">
						<i class="bi bi-arrow-return-right ml-5"></i>
					</c:if>
					<i class="bi bi-lock ml-3 mr-2"></i>
					<a href="listdetail.inq?num=${inq.num}&pageNumber=${pageInfo.pageNumber}">${inq.title}</a>
				</td>
				<td>
					<c:choose>
						<c:when test="${inq.id eq 'penguin'}"><c:out value="관리자"/></c:when>
						<c:otherwise>${inq.id}</c:otherwise>
					</c:choose>
				</td>
				<td>
					<fmt:formatDate value="${inq.regdate}" var="regdate" type="Date" pattern="yyyy-MM-dd"/>
			    	${regdate}
			    </td>
			</tr>
		</c:forEach>
	</table>
	
	<p align="right">
		<button class="border border-secondary bg-light" type="button" onclick="location.href='inqwrite.inq'">
			<i class="bi bi-pencil"></i> 글쓰기
		</button>
	</p>
	
	<ul class="pagination justify-content-center">${pageInfo.pagingHtml}</ul>
</div>
<%@ include file="../../../WEB-INF/common/footer.jsp" %>
