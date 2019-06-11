<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonApp02_Test04.jsp</title>

<!-- json2.js 라이브러리 사용 -->
<script type="text/javascript" src="js/json2.js"></script> 

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
		var url = "Test04_ok.jsp";
		
		// json으로 구성 
		var json = 
		{
			"name" : name
			, "age" : age
		};
		
		// 『JSON.stringify()』JSON 객체를 String 으로 변환
		params = JSON.stringify(json);
		
		// alert(params); → {"name":"이기승","age":"11"}
		
		xmlHttp = createXMLHttpRequest();
		
		xmlHttp.onreadystatechange = callBack;
		
		xmlHttp.open("POST", url, true);
		
		xmlHttp.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
		
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
		
		doc = doc.replace(/\s/g, "");
		alert(doc);
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
	
</div>
</body>
</html>