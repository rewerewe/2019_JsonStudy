<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	String name[] = {"손오공", "저팔계"};
	String age[] = {"23", "13"};
	
	JSONObject obj = new JSONObject();
	obj.put("count", 2);
	
	JSONArray objArray = new JSONArray();
	
	for (int i=0; i<2; i++)
	{
		JSONObject data = new JSONObject();
		data.put("name", name[i]);
		data.put("age", age[i]);
		
		objArray.put(data);
	}
	obj.put("data", objArray);
		
	response.setContentType("text/xml; charset=UTF-8");
	response.getWriter().write(obj.toString());
%>
