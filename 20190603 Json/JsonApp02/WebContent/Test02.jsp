<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JsonApp02_Test02.jsp</title>

<!-- json.js 라이브러리 사용 -->
<script type="text/javascript" src="js/json.js"></script>
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
		
		var queryString = "";
		var name = document.getElementById("name").value;
		var age = document.getElementById("age").value;
		
		queryString = "Test02_ok.jsp?name=" + name + "&age=" + age;
		
		xmlHttp.open("GET", queryString, true);
		
		// ※ GET 방식이 아닌 POST 방식인 경우
		//    xmlHttp.setRequestHeader() 함수를 추가한다.
		//	  이는, 서버가 텍스트를 통해 보낸 것이 일반 HTML 폼에서 전송된 것처럼
		//    알 수 있도록 처리하기 위함이다.
		//    ex) xmlHttp.setRequestHeader
		//    	("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		
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
		
		// json.js 라이브러리를 사용하는 경우 
		// var func = new Function("return" + resValue);
		// var result = func();
		
		// Test01과 다르게 json.js 라이브러리를 사용하지 않은 경우 ==============================
			
		// ※ jsp 로 java 소스가 들어가는 과정에서 
		//    웹에서 보여지는 소스에 공백이 삽입되게 되므로 이 공백을 제거해야 한다.
		resValue = resValue.replace(/\s/g,"");
		// / 정규표현식  /g 글로벌, 전역이라는 의미, 옵션  \s : 어느 위치에든 resValue에 공백이 들어가 있으면 제거하겠다는 의미  
		
		// ※ javascript 의 eval() 함수를 사용하여 파싱한다.
		var result = eval("(" + resValue + ")");
			
		// ============================== Test01과 다르게 json.js 라이브러리를 사용하지 않은 경우 
		
			var output = document.getElementById("results");
		var outHtml = "";
		output.innerHTML = "";
		
		// none 으로 설정된 값을 지우겠다는 의미. 
		document.getElementById("results").style.display="";
		
		outHtml = "이름 : " + result.name + "<br>"; 
		outHtml += "나이 : " + result.age + "<br>";
		
		output.innerHTML = outHtml;
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