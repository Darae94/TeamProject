<%@page import="member.model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String userid = request.getParameter("userid");
	System.out.println("userid:" + userid);
	
	MemberDao dao = MemberDao.getInstance();
	boolean isCheck = dao.searchId(userid); 
	String str = "";
	if(isCheck == true){
		str = "NO";
		out.print(str);
	}
	else{
		str = "YES";
		out.print(str);
	}
%>
