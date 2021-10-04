<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String data="";
	String message="";
	try{
		data = request.getAttribute("CodeData").toString();	
		message = request.getAttribute("message").toString();
		
		if(data.equals("")||data.equals(null)||data.equals("null")||data.equals(" ")||data.equals("\t")) {
			message = "<script>alert('일치하는 정보가 없습니다. 코드를 확인해주세요.'); history.back();</script>";
		}
	}
	catch(Exception e){
		System.out.println("request 오류"+ e);
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>CHARTIE</title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>	
		<link rel="stylesheet" href="CSS-StyleSheet.css">
		<%=message %>
	</head>
	<body>
		<jsp:include page="Header.jsp"></jsp:include>
		<div id="wrap">
			<div id="header">
				<form method="post" action="myChart" name="frm" id="myform">
					<div id="shape" class="boxLines">
						<div class="boxs boxsTitle"><b>차트 모양</b></div>
						<input type="file" name="excelfile" onchange="excelIn()" id="fileinput"><br>
						<input type="radio" id="radioBar" class="chartstyle" name="cs" value="bar" checked>
						<input type="radio" id="radioLine" class="chartstyle" name="cs" value="line">
						<input type="radio" id="radioRadar" class="chartstyle" name="cs" value="radar">
						<input type="radio" id="radioDought" class="chartstyle" name="cs" value="doughnut">
						<input type="radio" id="radioPie" class="chartstyle" name="cs" value="pie">
						<input type="radio" id="radioPolarArea" class="chartstyle" name="cs" value="polarArea">
						<input type="radio" id="radioBubble" class="chartstyle" name="cs" value="bubble">
						<textarea id="mydata" name="data" style="display:none;"></textarea>
						
						<label class="boxs styleset oneData" for="radioBar">막대</label>
						<label class="boxs styleset oneData" for="radioDought">도넛</label>
						<label class="boxs styleset oneData" for="radioPie">파이</label>
						<label class="boxs styleset oneData" for="radioPolarArea">폴라 에리어</label>

						<label class="boxs styleset twoData" for="radioLine">선</label>
						<label class="boxs styleset twoData" for="radioRadar">레이더</label>
						<label class="boxs styleset twoData" for="radioBubble">버블</label>
					</div>
				</form>
				<div id="color" class="boxLines">
					<div class="boxs boxsTitle"><b>차트 색상</b></div>
					<div class="boxs colorset boxsSelect" onclick="changeColorSet('vivid')">비비드</div>
					<div class="boxs colorset boxsSelect" onclick="changeColorSet('picnic')">피크닉</div>
					<div class="boxs colorset boxsSelect" onclick="changeColorSet('pastel')">파스텔</div>
					<div class="boxs colorset boxsSelect" onclick="changeColorSet('forest')">포레스트</div>
					<div class="boxs colorset boxsSelect" onclick="changeColorSet('choco')">초콜릿</div>
					<div class="boxs colorset boxsSelect" onclick="changeColorSet('bluenight')">블루나잇</div>
					<div class="boxs colorset boxsSelect" onclick="changeColorSet('sunset')">노을</div>
				</div>
				<div id="otherDatas" class="boxLines">
					<div class="boxs boxsSelect" id="useInfo">사용 방법</div>
					<div class="boxs boxsSelect" id="tableOn">표로 입력하기</div>
					<div class="boxs"></div>
					<div class="boxs boxsSelect" id="excelFormDown">
						<a href="./basicForm/basicForm.xlsx" download>
							서식 다운로드
						</a>
					</div>
					<div class="boxs boxsSelect">
						<a href="./basicForm/Example.xlsx" download>
							예제 데이터
						</a>
					</div>
					<div class="boxs boxsSelect" id="excelUpload">엑셀 업로드</div>
					<div class="boxs"></div>
					<div class="boxs boxsSelect" onclick="drawChart()">그리기</div>
				</div>
			</div>
			<div id="body">
				<%=data %>
			</div>
		</div>
		<jsp:include page="Footer.jsp"></jsp:include>
		<!-- ColorSet -->
		<script type="text/javascript" src="JS-ColorSet.js" charset="utf-8"></script>
		<!-- 차트 그리기 및 버튼에 따른 변경 -->
		<script type="text/javascript" src="JS-Chart.js" charset="utf-8"></script>
		<!-- JSON으로 압축후 Servlet 통신 -->
		<script>
			let XHR;
			let thisIsMyCode;
			let confFlag=false;
			function createXHR(){
				if(window.ActiveXObject){
					XHR=new ActiveXObject("Microsoft.XMLHTTP");
				}
				else{
					XHR=new XMLHttpRequest();
				}
			}
			
			function checkMycode(){
				createXHR();
				let url = "checkSavableCode?name=savable";
				XHR.open("GET", url, true);
				XHR.onreadystatechange=handleStateChange;
				XHR.send(null);
			}
			
			function handleStateChange(){
				let form = document.getElementById("myform");
				
				if(XHR.readyState==4){
					if(XHR.status==200){
						let input = document.getElementById("mydata");
						console.log(document.getElementsByClassName("tableLabels")[0].value);
						
						let thispage = document.getElementById("body").innerHTML;
						thisIsMyCode = XHR.responseXML.getElementsByTagName("code")[0].firstChild.data;
						let conf = confirm("사용자님의 차트 정보에 대한 코드입니다. \n\n"+thisIsMyCode+"\n\n표에 입력한 정보를 이어서 조작하고 싶다면 코드를 불러오기 해주세요.");
						
						mycode = thisIsMyCode;
						
						let mine={
							code: mycode,
							page: thispage
						}
							
						let data = JSON.stringify(mine);
						
						input.innerHTML = data;
						if(conf==true){
							form.submit();
						}
						else{
							return;
						}
					}
				}
			}
		
			let callmychart = document.getElementById("callMyChart");
			let setmychart = document.getElementById("setMyChart");
			
			callmychart.addEventListener("click", function(){
				callChart();
			});
			
			setmychart.addEventListener("click", function(){
				let form = document.getElementById("myform");
				let mycode;
				
				if(thisIsMyCode==null||confFlag==false){
					checkMycode();
				}
			});
			
			function callChart(){
				let mycode = prompt("차트 코드를 입력하세요.");
				let url = "myChart?code="+escape(mycode);
				
				if(mycode==null||mycode=="null"||mycode==""){
					return;
				}
				else{
					location.href=url;
				}
			}
		</script>
	</body>
</html>