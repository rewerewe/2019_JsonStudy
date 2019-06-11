<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonApp02_Test03.jsp</title>

<!-- json.js 라이브러리 사용 -->
<script type="text/javascript" src="js/json.js"></script> 
<!-- json2.js 라이브러리 사용 -->
<!-- <script type="text/javascript" src="js/json2.js"></script> -->
<script type="text/javascript">

	var xmlHttp;
	
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
	
	function startRequest()
	{
		xmlHttp = createXMLHttpRequest();
		//xmlHttp.onreadystatechange = handleStateChange()▶조심;
		xmlHttp.onreadystatechange = handleStateChange;
		// 함수 자체를 onreadystatechange 에 담는 것. handleStateChange()를 할 경우, 함수호출결과를 담는 거라 () 붙여선 안된다.
		
		var queryString = "";
		
		queryString = "Test03_ok.jsp";
		
		xmlHttp.open("GET", queryString, true);
		
		xmlHttp.send("");
	}

	function handleStateChange()
	{
		if (xmlHttp.readyState == 4)
		{
			if (xmlHttp.status == 200)
			{
				// 업무호출 
				printData();
			}
		}
	}
	
	function printData()
	{
		// JSON 객체로 만들었다가(마치 xml 형식으로 만든것처럼), text 형식으로 보내주겠다?
		var resValue = xmlHttp.responseText;
		
		// 3. json.js 라이브러리를 사용하는 경우 
		 var result = resValue.parseJSON();
		
		// 3.json2.js 라이브러리를 사용하는 경우 
		//var result = JSON.parse(resValue);
		
		var output = document.getElementById("results");
		var outHtml = "";
		output.innerHTML = "";
		
		// none 으로 설정된 값을 지우겠다는 의미. 
		document.getElementById("results").style.display="";
		
		console.log(result.count);
		
		outHtml = "<h2>count : " + result.count + "</h2>";
		
		for (var i=0; i<result.data.length; i++)
		{
			
			outHtml += "<h3>이름 : " + result.data[i].name + "</h3>"; 
			outHtml += "<h3>나이 : " + result.data[i].age + "</h3>";
		}
		
		output.innerHTML = outHtml;
	}
</script>
</head>
<body>

<div>
	<table>
		
		<tr>
			<td align="center">
				<input type="button" value="결과" style="width: 100px;"
				onclick="startRequest()">
			</td>
		</tr>
	</table>
	
	<br><br>
	
	<div id="results" style="display:none;"></div>
</div>
</body>
</html>