<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../common/user.jsp" %>
<%@ include file="topPlan.jsp" %>
<!-- exhibitPlan.jsp<br> -->
<%-- 
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
	  
	Calendar cal = Calendar.getInstance();
	cal.add(Calendar.MONTH, 1);
	
	String day = sdf.format(cal.getTime());
	
	System.out.println(day);
	//System.out.println(daym);
%>
 --%>
 
<table border="1" frame="void" class="table table-hover">
	<c:set var="day" value="<%=day %>" />
	<tr align="center">
		<%
			int cnt = 0;
		%>
		<c:if test="${fn:length(list) == 0 }">
			<td><b style="font-size: 25pt; color: white;">등록된 예정행사 없음</b>
			</td>
		</c:if>
		<c:forEach var="exhibit" items="${list }">	
		<%
			cnt++;
		%>
				<td><a href="userExhibitDetail.ex?num=${exhibit.num }"> <img
						src="<%=request.getContextPath()%>/resources/${exhibit.img }"
						width="100px" height="100px">
				</a><br> <b>${exhibit.name }</b><br> ${exhibit.company }<br>
					<fmt:parseDate var="date1" value="${exhibit.start_period }"
						pattern="yyyy-MM-dd" /> <fmt:parseDate var="date2"
						value="${exhibit.end_period }" pattern="yyyy-MM-dd" /> <fmt:formatDate
						value="${date1 }" />~<fmt:formatDate value="${date2 }" /><br>
					입장료: ${exhibit.price }원 <%
 			if (cnt % 3 == 0) {
		 %></td>
				<tr align="center">
					<%
			}
		%>
				
		</c:forEach>
	</tr>
</table>
</td>
</tr>
</table>
<%@ include file="../../WEB-INF/common/footer.jsp" %>
