<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonApp02_Test05.jsp</title>

<script type="text/javascript">

	var xmlHttp;
	
	// ajax 객체 생성 
	function createXMLHttpRequest()
	{
		var xmlReq = false;
		
		if (window.XMLHttpRequest)
		{
			xmlReq = new XMLHttpRequest();
		}
		else if (window.ActiveObject)
		{
			try
			{
				xmlReq = new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch (e)
			{
				try
				{
					xmlReq = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch (e)
				{
					// XMLHttpRequest 객체를 생성할 수 있는 상태.
				}
			}
		}
		
		return xmlReq;
	}
	
	function send()
	{
		var name = document.getElementById("name").value;
		var age = document.getElementById("age").value;
		var url = "Test05_ok.jsp";
		var params = "name=" + name + "&age=" + age;
		
		xmlHttp = createXMLHttpRequest();
		xmlHttp.onreadystatechange = callBack;
		
		xmlHttp.open("POST", url, true);
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlHttp.send(params);
	}

	function callBack()
	{
		if (xmlHttp.readyState == 4)
		{
			if (xmlHttp.status == 200)
			{
				printData();
			}
		}
	}
	
	function printData()
	{
		var doc = xmlHttp.responseText;
		
		// 『JSON.parse() : String 객체를 JSON 객체로 변환』
		var result = JSON.parse(doc);
		
		var results = document.getElementById("results");
		var outHtml = "";
		
		outHtml = "<h2>이름 : " + result.name + "</h2>";
		outHtml += "<h2>나이 : " + result.age + "</h2>";

		results.innerHTML = outHtml;
	}
</script>

</head>
<body>

<div>
	<table>
		<tr>
			<th>이름 :</th>
			<td>
				<input type="text" id="name" maxlength="20" style="width: 100px;">
			</td>
		</tr>
		<tr>
			<th>나이 :</th>
			<td>
				<input type="text" id="age" maxlength="10" style="width: 100px;">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="보내기" style="width: 100px;"
				onclick="send()">
			</td>
		</tr>
	</table>
	
	<br><br>
	
	<div id="results"></div>
	
</div>
</body>
</html>