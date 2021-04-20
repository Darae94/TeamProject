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
<div class="border-bottom border-secondary mt-5 pb-2"><h5 class="text-primary"><b>공지사항</b></h5></div>
	<table class="table">
	    <tr class="text-center">
	      <th>번호</th>
	      <th class="w-50">제목</th>
	      <th>작성일</th>
	      <th>조회수</th>
	    </tr>

	  	<!-- 중요한 공지사항 먼저 띄우기 -->
	 	<c:forEach items="${imp_lists}" var="imp_notice">
		  	<tr class="text-center">				     	
		  		<td> <i class="bi bi-volume-up-fill"></i> </td>
				<td align="left">
				   	<a href="listdetail.nt?no=${imp_notice.no}&pageNumber=${pageInfo.pageNumber}">
				   	<b class="ml-3 mr-2">${imp_notice.title}</b>
				   	</a>
				</td>
				<td>
				   	<fmt:formatDate value="${imp_notice.regdate}" var="regdate" type="Date" pattern="yyyy-MM-dd"/>
			    	${regdate}  
			     </td>
			     <td>${imp_notice.viewcnt}</td>
			</tr>
	  	</c:forEach>
	  	
	  	<!-- 일반공지사항 리스트 -->
	  	<c:forEach items="${lists}" var="notice" varStatus="stu">
		    <tr class="text-center">
		      <td>${(pageInfo.totalCount-stu.index)-((pageInfo.pageNumber-1)*pageInfo.pageSize)}</td>
		      <td align="left">
				<a class="ml-3 mr-2" href="listdetail.nt?no=${notice.no}&pageNumber=${pageInfo.pageNumber}">${notice.title}</a>
		      </td>
		      <td>
		      	<fmt:formatDate value="${notice.regdate}" var="regdate" type="Date" pattern="yyyy-MM-dd"/>
		      	${regdate}  
		      </td>
		      <td>${notice.viewcnt}</td>
		    </tr>
	    </c:forEach>
	</table> 
	
	<c:if test="${sessionScope.loginId=='penguin'}">
		<p align="right">
			<button type="button" class="border border-secondary bg-light" onClick="location.href='write.nt'">
				<i class="bi bi-pencil"></i> 글쓰기
			</button>
		</p>
	</c:if>
	
  <ul class="pagination justify-content-center">${pageInfo.pagingHtml}</ul>
</div>
<%@ include file="../../../WEB-INF/common/footer.jsp" %>