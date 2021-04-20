<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- topPlan.jsp<br> -->
<%
	SimpleDateFormat sdfm = new SimpleDateFormat("M");
	Calendar calm = Calendar.getInstance();
	calm.add(Calendar.MONTH, 1);
	int daym = Integer.parseInt(sdfm.format(calm.getTime()));
	System.out.println(daym);
%>

<%-- <h2>전시/박람 예정목록(<%=daym %>월이후 행사~)</h2> --%>
<br><br>
<div class="container">
<table border="1" frame="void" class="table table-secondary">
	<tr align="center" class="table-secondary">
		<td> <b style=font-size:25pt;>[Month]</b><br><br>
			<table align="center">
					<c:forEach var="i" begin="<%=daym %>" end="12">
						<tr class="table-primary" align="center">
							<td>				
								<a href="userSearchPlanCate.ex?month=${i }">${i }월</a>
							</td>
						</tr>
					</c:forEach>
			</table>
		</td>
		<td>