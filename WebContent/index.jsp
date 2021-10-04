<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>CHARTIE</title>
		<!-- CHART drawn Implement to use Excel  -->
		<!-- https://cdnjs.com/libraries/xlsx -->
		<!-- xlsx.min.js 의 경우 데이터를 해석하는 과정에서 규격에 따라 인식이 불가한 현상을 확인했습니다. -->
		<!-- 때문에 라이브러리에서 이를 해결하기 위해 축소 버전이 아닌 full 버전 사용이 권장되어 이를 사용합니다. -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.1/xlsx.full.min.js"></script>
		<!-- https://www.chartjs.org/ -->
		<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
		<!-- https://code.google.com/archive/p/json-simple -->
		<script></script>		
		<link rel="stylesheet" href="CSS-StyleSheet.css">
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
						
						<label class="boxs styleset oneData" for="radioBar" style="background-color: #bde8c480;">막대</label>
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
					<div class="boxs colorset boxsSelect" onclick="changeColorSet('vivid')" style="background-color: #bde8c480;">비비드</div>
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
				<div id="tableSheet" style="display:none;">
					<div id="tableOne">
						<div class="blankTable"></div>
						<div id="minusTableRow" class="tableSheetStyle">
							<img src="./source/Minus-icon.png">
						</div>
						<div class="blankTable"></div>
					</div>
					<div id="tableTwo">
						<div id="minusTableColums" class="tableSheetStyle">
							<img src="./source/Minus-icon.png" class="rowChange">
						</div>
						<table id="tableArea">
							<thead>
								<tr class="tableSheetTr">
									<td><input type="text" class="emptyfield" readonly></td>
									<td><div contenteditable="true" class="tableLabels" placeholder="분류"></div></td>
									<td><div contenteditable="true" class="tableLabels" placeholder="분류"></div></td>
									<td><div contenteditable="true" class="tableLabels" placeholder="분류"></div></td>
									<td><div contenteditable="true" class="tableLabels" placeholder="분류"></div></td>
									<td><div contenteditable="true" class="tableLabels" placeholder="분류"></div></td>
								</tr>
							</thead>
							<tbody>
								<tr class="tableSheetTr numberDatas">
									<td><div contenteditable="true" class="needMoreDatas" placeholder="필드"></div></td>
									<td><div contenteditable="true" class="tableDatas" placeholder="값"></div></td>
									<td><div contenteditable="true" class="tableDatas" placeholder="값"></div></td>
									<td><div contenteditable="true" class="tableDatas" placeholder="값"></div></td>
									<td><div contenteditable="true" class="tableDatas" placeholder="값"></div></td>
									<td><div contenteditable="true" class="tableDatas" placeholder="값"></div></td>
								</tr>
							</tbody>
							<tfoot>
								<tr class="tableSheetTr">
									<td><input type="text" class="emptyfield"></td>
									<td><input type="color" class="tableColors"></td>
									<td><input type="color" class="tableColors"></td>
									<td><input type="color" class="tableColors"></td>
									<td><input type="color" class="tableColors"></td>
									<td><input type="color" class="tableColors"></td>
								</tr>
							</tfoot>
						</table>
						<div id="addTableColums" class="tableSheetStyle">
							<img src="./source/Plus-icon.png" class="rowChange">
						</div>
					</div>
					<div id="tableThird">
						<div class="blankTable"></div>
						<div id="addTableRow" class="tableSheetStyle">
							<img src="./source/Plus-icon.png">
						</div>
						<div class="blankTable"></div>
					</div>
				</div>
				<div id="chartBoard">
					<canvas id="chart"></canvas>
				</div>
				<div id="footer">
					<div id="footmenu" class="boxLines">
						<div class="boxs boxsSelect" id="chartImgDownload">차트 이미지 다운로드</div>
						<div class="boxs footboxs" style="border: 0.1px solid white;"></div>
						<div class="boxs footboxs" style="border: 0.1px solid white;"></div>
						<div class="boxs footboxs" style="border: 0.1px solid white;"></div>
						<div class="boxs footboxs" style="border: 0.1px solid white;"></div>
						<div class="boxs boxsSelect" id="callMyChart">불러오기</div>
						<div class="boxs boxsSelect" id="setMyChart">저장하기</div>
					</div>
				</div>
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