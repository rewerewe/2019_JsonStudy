<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.BufferedReader"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	StringBuffer sb = new StringBuffer();
	
	BufferedReader reader = request.getReader();
	String line;
	
	while ((line = reader.readLine()) != null)
	{
		sb.append(line);
	}
%>
<%=sb.toString() %>