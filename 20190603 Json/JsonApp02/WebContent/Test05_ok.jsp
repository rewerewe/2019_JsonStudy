<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.io.BufferedReader"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	
	/*
	JSONObject ob = new JSONObject();
	ob.put("name", name);
	ob.put("age", age+"세");
	*/
	
	// ※ JSON 라이브러리를 사용하지 않는 경우 
	StringBuffer ob = new StringBuffer("{");
	ob.append("\"name\":\"" + name + "\"");
	ob.append(",\"age\":\"" + age + "세\"");
	ob.append("}");
	
	/*
	"{'name':'홍길동'}"
	"{'age':'23세'}"
	*/
	out.println(ob.toString());
	
%>
