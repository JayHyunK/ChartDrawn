<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>CHARTIE</title>	
		<link rel="stylesheet" href="CSS-StyleSheet.css">
		<style>
			#explainBoard{
				width: 100%;
				display: flex;
			}
			#howusemenu{
				flex: 2.6;	
				
			}
			#howusecontents{
				flex: 9;
				display: flex;
				margin-bottom: 70px;
				min-height: 615px;
			}
			#hwumBar{
				height: 615px;
				position: -webkit-sticky;
				position: sticky;
				top: 20px;
			}
			
			#hwuHeadlight{
				font-size: 18px;
				font-weight: 600;
				height: 45px;
			}
			.hwuinBtn{
				font-size: 15px;
				height: 42px;
				line-height: 42px;
			}
			.hwuinempty{
				height: 18px;
			}
			.hwuinemptyLong{
				height: 72px;
			}
			#hwuinArea{
				flex: 24;
				padding-right: 30px;
				padding-left: 30px;
			}
			.hwuimgBig{
				width: 100%;
				height: 450px;
				opacity: 1;
				border-radius: 5px;
				object-fit: cover;
			}
			.explainimg{
				max-width: 100%;
				width: 100%;
				height: auto;
				opacity: 1;
				border-radius: 5px;
				object-fit: cover;
			}
			.alignmiddle{
				text-align: center;
				font-size: 15px;
				margin-bottom: 8px;
			}
			.alignleft{
				text-align: left;
				font-size: 15px;
				margin: 4px;
			}
			.hwuincontent{
				display:none;
			}
			.fontBig{
				font-weight: 500;
				font-size: 18px;
				opacity: 0.9;
			}
			.onmouseinA{
				font-weight: 600;
			}
			.onmouseinA:hover{
				color: #1200ff;
			}
			.htumarginone{
				margin-bottom: 6px;
			}
			.FAQQ{
				display: block;
				height: 50px;
				line-height: 50px;
				padding-left: 15px;
				border-radius: 5px;
			}
			.FAQQ:hover{
				animation-duration: 0.5s;
				animation-name: FAQQ;
				animation-fill-mode: forwards;
			}
			@keyframes FAQQ{
				from{
					background-color: #ffffff;
				}
				
				to{
					background-color: #bde8c480;
				}
			}
			.FAQA{
				display: none;
				padding-left: 30px;
				margin-top: 7px;
				margin-bottom: 30px;
				color: rgb(40, 40, 40);
			}
		</style>
	</head>
	<body>
		<jsp:include page="Header.jsp"></jsp:include>
		<div id="wrap">
			<div id="explainBoard">
				<div id="howusemenu">
					<div id="hwumBar">
						<div id="hwuHeadlight">사용자 가이드</div>
						<div class="hwuinBtn">Chartie란?</div>
						<div class="hwuinempty"></div>
						<div class="hwuinBtn">엑셀을 이용한 차트 그리기</div>
						<div class="hwuinBtn">Excel 기본 서식 설명</div>
						<div class="hwuinBtn">표를 이용한 차트 그리기</div>
						<div class="hwuinempty"></div>
						<div class="hwuinBtn">차트 모양</div>
						<div class="hwuinBtn">차트 색상</div>
						<div class="hwuinBtn">데이터 제한 사항</div>
						<div class="hwuinempty"></div>
						<div class="hwuinBtn">저장하기</div>
						<div class="hwuinBtn">불러오기</div>
						<div class="hwuinempty"></div>
						<div class="hwuinempty"></div>
						<div class="hwuinBtn">FAQ</div>
					</div>
				</div>
				<div id="howusecontents">
					<div id="hwuinArea">
					<div id="main" class="hwuincontent" style="display:block;">
						<img class="hwuimgBig" src="./source/office1.jpg">
						<br><br><br>
						<p class="alignmiddle">CHARTIE, Create by JongHyun</p>
						<br>
						<p class="alignmiddle">이 사용자 매뉴얼은 이미 사용되고 있는 일부 제품들을 참고하여 임의로 제작한 것입니다. </p>
						<p class="alignmiddle">CHARTIE는 JonHyun이 제작한 포트폴리오의 한 구성 요소입니다.</p>
					</div>
					<div id="WhatIsChartie" class="hwuincontent">
						<img class="hwuimgBig" src="./source/graph1.jpg">
						<br><br>
						<p class="alignmiddle"><b>CHART Implement for Excel</b></p>
						<br>
						<p class="alignmiddle">Chartie란 CHART Implement for Excel의 약자로</p>
						<p class="alignmiddle">엑셀을 위한 차트 구현 도구를 말합니다.</p>
						<br>
						<p class="alignmiddle">Excel 파일을 업로드하면 해당 파일의 데이터를 기반으로 </p>
						<p class="alignmiddle">사용자님이 원하는 모양의 그래프를 그려줍니다.</p>
						<p class="alignmiddle">웹 페이지에서 간단하게 그래프를 그려보세요.</p>
						<br>
						<p class="alignmiddle">CHARTIE가 도와드리겠습니다.</p>
					</div>
					<div id="hwuExcel" class="hwuincontent">
						<p class="alignmiddle fontBig"><b>엑셀을 이용한 차트 그리기</b></p>
						<br>
						<p class="alignleft"><b>1. </b>Chartie에서 제공하는 기본 폼 양식을 다운로드합니다. 
						<br>ㅤ에디터의 '서식 다운로드'를 이용하거나 
							<a class="onmouseinA" href="./basicForm/basicForm.xlsx" download>'여기'</a>
							를 클릭해주세요.</p>
						<br>
						<img class="explainimg" src="./source/useexcel1.png">
						<br><br><br>
						<p class="alignleft"><b>2. </b>기본 서식을 확인하고 필요한 데이터를 정확히 기입합니다. 
						<br>ㅤ서식에 대한 정보는 
							<span class="onmouseinA">'Excel 기본 서식 설명'</span>
							을 참고하세요.</p>
						<br>
						<img class="explainimg" src="./source/useexcel2.png">
						<br><br><br>
						<p class="alignleft"><b>3. </b>데이터를 입력했다면 '엑셀 업로드'를 통해 해당 파일을 업로드해주세요. </p>
						<br>
						<img class="explainimg" src="./source/useexcel3.png">
						<br><br><br>
						<p class="alignleft"><b>4. </b>원하는 차트 색상과 모양을 선택하세요.
						<br>ㅤ색상과 모양에 대한 정보는 
							<span class="onmouseinA">'차트 모양'</span> 
							및 
							<span class="onmouseinA">'차트 색상'</span>을 참고하세요. </p>
						<br>
						<img class="explainimg" src="./source/useexcel4.png">
						<br><br><br>
						<p class="alignleft"><b>5. </b>'그리기'를 누르면 에디터 하단에 차트가 완성됩니다. </p>
						<br>
						<img class="explainimg" src="./source/useexcel5.png">
						<br><br><br>
						<p class="alignleft"><b>6. </b>하단의 '차트 이미지 다운로드'를 통해 현재 차트를 저장할 수 있습니다.</p>
						<img class="explainimg" src="./source/useexcel6.png">
						<br><br><br>
					</div>
					<div id="hwuBasicForm" class="hwuincontent">
						<p class="alignmiddle fontBig"><b>기본 서식 설명</b></p>
						<br>
						<p class="alignleft"><b>1. </b>
							기본 서식에서 1.A 는 빈 공간으로 별도의 데이터를 입력하지 않습니다. 
						</p><br>
						<img class="explainimg" src="./source/basicform1.png">
						<br><br><br>
						<p class="alignleft"><b>2. </b>
							기본 서식에서 영어 열(A~...)은 하나의 대상에 대한 값들의 집합입니다. 
						</p><br>
						<img class="explainimg" src="./source/basicform2.png">
						<br><br><br>
						<p class="alignleft"><b>3. </b>
							기본 서식에서 숫자 행(1~...)은 값에 대한 속성을 말합니다.
							<br>ㅤ<a class="onmouseinA" href="./basicForm/Example.xlsx" download>예제</a>를 다운로드하여 작성 방법을 숙지하세요.
						</p><br>
						<img class="explainimg" src="./source/basicform3.png">
						<br><br><br>
					</div>
					<div id="hwuTable" class="hwuincontent">
						<p class="alignmiddle fontBig"><b>표를 이용한 차트 그리기</b></p>
						<br>
						<p class="alignleft"><b>
							1. </b>표로 입력하기를 누르면 데이터를 입력할 수 있는 표가 활성화 됩니다.
							<br>ㅤ표의 상하 좌우로 배치된 - 및 + 기호를 누르면 행과 열을 추가할 수 있습니다.
						</p>
						<br>
						<img class="explainimg" src="./source/usetable1.png">
						<br><br><br>
						<p class="alignleft"><b>
							2. </b>표의 각 열은 하나의 데이터에 대한 분류를, 행은 데이터의 속성을 나타냅니다.</p>
							<br>
						<p class="alignleft"><b>
							3. </b>'값' 영역에는 숫자를 입력할 수 있습니다. 음수와 유리수도 입력이 가능합니다.
							<br>ㅤ(문자 등 숫자가 아닌 값을 입력하면 0으로 입력됩니다.)</p>
						<br>

						<p class="alignleft"><b>
							4. </b>데이터를 입력하고 원하는 차트 색상과 모양을 선택하세요. 
							<br>ㅤ색상과 모양에 대한 정보는 
								<span class="onmouseinA">'차트 모양'</span> 
								및 
								<span class="onmouseinA">'차트 색상'</span>
								을 참고하세요.
						</p>
						<br>
						<img class="explainimg" src="./source/useexcel4.png">
						<br><br><br>
						<p class="alignleft"><b>
							5.</b>'그리기'를 누르면 에디터 하단에 차트가 완성됩니다.</p>
						<br>
						<img class="explainimg" src="./source/useexcel5.png">
						<br><br><br>
						<p class="alignleft"><b>
							6. </b>하단의 '차트 이미지 다운로드'를 통해 현재 차트를 저장할 수 있습니다.</p>
						<br>
						<img class="explainimg" src="./source/useexcel6.png">
						<br><br><br>
					</div>
					<div id="hwuShape" class="hwuincontent">
						<p class="alignmiddle fontBig"><b>차트 모양</b></p>
						<br>
						<p class="alignleft">
						Chartie가 제공하는 차트의 모양은 7가지 입니다.</p>
						<br>
						<p class="alignleft"><b>1. 
						막대: </b>열을 기준으로 데이터를 나누어 표시합니다.</p>
						<br>
						<img class="explainimg" src="./source/shape1.png">
						<br><br><br>
						<p class="alignleft"><b>2.
						도넛: </b>열을 기준으로 데이터를 나누어 표시합니다.</p>
						<br>
						<img class="explainimg" src="./source/shape2.png">
						<br><br><br>
						<p class="alignleft"><b>3. 
						파이: </b>열을 기준으로 데이터를 나누어 표시합니다.</p>
						<br>
						<img class="explainimg" src="./source/shape3.png">
						<br><br><br>
						<p class="alignleft"><b>4. 
						폴라 에리어: </b>열을 기준으로 데이터를 나누어 표시합니다.</p>
						<br>
						<img class="explainimg" src="./source/shape4.png">
						<br><br><br>
						<p class="alignleft"><b>5. 
						선: </b>열과 행을 기준으로 하여 데이터를 표시합니다. </p>
						<br>
						<img class="explainimg" src="./source/shape5.png">
						<br><br><br>
						<p class="alignleft"><b>6. 
						레이더: </b>열과 행을 기준으로 하여 데이터를 표시합니다. 행이 늘어날 수록 데이터를 표현하는 필드 영역도 증가합니다.</p>
						<br>
						<img class="explainimg" src="./source/shape6.png">
						<br><br><br>
						<p class="alignleft"><b>7. 
						버블: </b>열과 행을 기준으로 하여 데이터를 표시합니다. <p>
						<br>
						<img class="explainimg" src="./source/shape7.png">
						<br><br><br>
					</div>
					<div id="hwuColor" class="hwuincontent">
						<p class="alignmiddle fontBig"><b>차트 색상</b></p>
						<br>
						<p class="alignleft">
							Chartie에서는 기본적으로 다음 컬러셋을 제공하고 있습니다.
							<br>컬러 분류에 옆에 있는 코드는 헥사 코드를 기준으로 작성된 색상 정보입니다.
						</p>
						<br>
						<p class="alignleft htumarginone"><b>1. 
						비비드:ㅤ </b>#f70d1a, #ff5f00,#FFE302,#12D900, #0000FF, #9f00ff</p>
						<img class="explainimg" src="./source/color1.png">
						<br><br>
						<p class="alignleft htumarginone"><b>2. 
						피크닉:ㅤ </b>#B3CCEC, #8FA044, #734765, #A87DA9, #C7A4C6, #E3CFEB</p>
						<img class="explainimg" src="./source/color2.png">
						<br><br>
						<p class="alignleft htumarginone"><b>3. 
						파스텔: ㅤ</b>#E9F3F9, #CDE2EF, #CAC5D8, #F5D8D5, #FEE5E8, #FAEBEF</p>
						<img class="explainimg" src="./source/color3.png">
						<br><br>
						<p class="alignleft htumarginone"><b>4. 
						포레스트: ㅤ</b>#DAD5D2, #3A3532, #375945, #5B8767, #A6C198, #DBDFC8</p>
						<img class="explainimg" src="./source/color4.png">
						<br><br>
						<p class="alignleft htumarginone"><b>5. 
						초콜릿: ㅤ</b>#ECECEC, #CEBBB5, #867674, #CC9E8E, #E6D5C3, #ECE7E0</p>
						<img class="explainimg" src="./source/color5.png">
						<br><br>
						<p class="alignleft htumarginone">
							<b>6. 블루나잇: ㅤ</b>
							#8091B0, #304F54, #638B9A, #A5C8DF, #D8E7DB, #D6DBE0
						</p>
						<img class="explainimg" src="./source/color6.png">
						<br><br>
						<p class="alignleft htumarginone">
							<b>7. 노을: ㅤ</b>
							#F9F5E8, #FCF2C3, #FEE49C, #FCD18B, #C9C2C4, #E0DDD7
						</p>
						<img class="explainimg" src="./source/color7.png">
						<br><br><br>
					</div>
					<div id="hwuLimit" class="hwuincontent">
						<p class="alignmiddle fontBig"><b>입력 데이터 제한 사항</b></p>
						<br>
						<p class="alignleft">
						Chartie는 정확한 차트 작성을 위해 몇몇 형식에 데이터의 수를 제한하고 있습니다.
						<br>모양에 따라 입력 데이터의 최대 범위가 제한되니 참고해주세요. 
						</p>
						<br>
						<p class="alignleft"><b>1. 
						막대: </b>1~2행의 데이터만 입력할 수 있습니다. 1행과 2행의 데이터 값의 차이만큼 차트를 그려줍니다. 1줄인 경우 0을 기준으로합니다.</p>
						<br>
						<p class="alignleft"><b>2. 
						도넛: </b>1행의 데이터만 입력할 수 있습니다. </p>
						<br>
						<p class="alignleft"><b>3. 
						파이: </b>1행의 데이터만 입력할 수 있습니다.</p>
						<br>
						<p class="alignleft"><b>4. 
						폴라 에리어: </b>1행의 데이터만 입력할 수 있습니다.</p>
						<br>
						<p class="alignleft"><b>5. 
						선: </b>2행 이상의 데이터만 입력할 수 있습니다. 2행을 초과하는 데이터도 입력 및 '그리기'가 가능합니다. </p>
						<br>
						<p class="alignleft"><b>6. 
						레이더: </b>2행 이상의 데이터만 입력할 수 있습니다. 행에 따른 분류와 데이터가 면적을 가져야하므로 '3행' 이상에서 정상적인 모양이 나타납니다. </p>
						<br>
						<p class="alignleft"><b>7. 
						버블: </b>2행의 데이터만 입력할 수 있습니다. </p>
					</div>
					<div id="hwuSave" class="hwuincontent">
						<p class="alignmiddle fontBig">
							<b>저장하기</b>
						</p>
						<br>
						<p class="alignleft">
							Chartie에서는 현재 작성중인 표에 대한 정보 저장 기능을 제공하고 있습니다.
						</p>
						<br>
						<p class="alignleft">
							<b>1. </b>
							에디터 하단의 '저장하기'를 클릭합니다.
						</p>
						<br>
						<img class="explainimg" src="./source/save1.png">
						<br><br><br>
						<p class="alignleft">
							<b>2. </b>
							저장할 경우, 저장되는 데이터에 대한 '코드'가 표시됩니다.
						</p>
						<br>
						<img class="explainimg" src="./source/save2.png">
						<br><br><br>
						<p class="alignleft">
							<b>3. </b>
							코드를 메모하셨다면 '예'를 눌러 저장할 수 있습니다.
						</p>
						<br>
						<img class="explainimg" src="./source/save3.png">
						<br><br><br>
						<br><br><br>
						<p class="alignmiddle fontBig">
							<b>주의 사항</b>
						</p>
						<p class="alignmiddle">
							정보 저장 및 열람은 저장시 발급되는 코드를 기준으로합니다. 
						</p>
						<p class="alignmiddle">
							코드를 분실할 경우 별도로 찾을 수 있는 방법이 없기 때문에 '메모'해 두시길 권장드립니다.
						</p><br>
						<p class="alignmiddle">
							만약 불러오기를 통해 데이터를 불러온 경우, 
						</p>
						<p class="alignmiddle">
							반드시 '저장하기'를 통해 코드 정보를 갱신해주시기 바랍니다.
						</p>
					</div>
					<div id="hwuLoading" class="hwuincontent">
						<p class="alignmiddle fontBig">
							<b>불러오기</b>
						</p>
						<p class="alignleft">
							<b>1. </b>
							에디터 하단의 '불러오기'를 클릭합니다.
						</p>
						<br>
						<img class="explainimg" src="./source/call1.png">
						<br><br><br>
						<p class="alignleft">
							<b>2. </b>
							발급받은 코드를 입력합니다.
						</p>
						<br>
						<img class="explainimg" src="./source/call2.png">
						<br><br><br>
						<p class="alignleft">
							<b>3. </b>
							코드를 입력하면 이전에 입력하던 표의 정보가 표시됩니다. 
						</p>
						<br>
						<img class="explainimg" src="./source/call3.png">
						<br><br><br>
						<p class="alignleft">
							<b>4. </b>
							만약 표가 활성화되었음에도 '그리기'를 통해 차트가 그려지지 않는다면 
							<br>
							<span class="onmouseinA">ㅤ
								FAQ 
							</span>
								"코드를 통해 표를 불러왔지만 '그리기'를 통해 정상적으로 작동하지 않아요."
							<br>ㅤ를 참고하세요.
						</p>
						
						<br><br><br>
						<p class="alignmiddle fontBig">
							<b>주의 사항</b>
						</p>
						<p class="alignmiddle">
							정보 저장 및 열람은 저장시 발급되는 코드를 기준으로합니다. 
						</p>
						<p class="alignmiddle">
							코드를 분실할 경우 별도로 찾을 수 있는 방법이 없기 때문에 '메모'해 두시길 권장드립니다.
						</p><br>
						<p class="alignmiddle">
							만약 불러오기를 통해 데이터를 불러온 경우,</p>
						<p class="alignmiddle">
							반드시 '저장하기'를 통해 코드 정보를 갱신해주시기 바랍니다.
						</p>
					</div>
					<div id="hwuFAQ" class="hwuincontent">
						<p class="alignmiddle fontBig">
							<b>FAQ</b>
						</p>
						<br>
						<p class="alignleft FAQQ" onclick="viewFaq('0')">
							<b>
								Q. 
							</b>
							코드를 통해 표를 불러왔지만 '그리기'를 통해 정상적으로 작동하지 않아요.
						</p>
						<p class="alignleft FAQA">
							<b>
								A. 
							</b>
							Chartie는 브라우저를 기반으로 작동합니다.
							<br>ㅤ인터넷 익스플로러 등 일부 브라우저에서 동작이 원할하지 않을 수 있습니다. 
							<br>ㅤ
							<br>ㅤ만약 기존에 사용하시던 브라우저라면 '표로 입력하기' 항목을 선택하여 
							<br>ㅤ표가 정상적으로 사라지고 나타나는지 확인해주시기 바랍니다.
							<br>ㅤ표가 정상적으로 나타나고 없어지는 것을 확인하셨다면, 
							<br>ㅤ재차 '그리기'를 눌러 확인하실 수 있습니다. 
							<br>ㅤ
							<br>ㅤ다만, 표가 나타나고 사라지는 동작이 정상작동하지 않는다면 
							<br>ㅤ브라우저에서 Java Script 동작을 차단하는 것은 아닌지 확인해보시기 바랍니다. 
						</p>
						<p class="alignleft FAQQ" onclick="viewFaq('1')">
							<b>  
								Q. 
							</b>
							Excel을 통해 차트를 그릴 때, 지정된 색 이외에는 사용이 불가능한가요?
						</p>
						<p class="alignleft FAQA">
							<b>
								A. 
							</b>
							현재는 Excel을 통해 표를 그릴때 지정된 '색상 모음' 이외에는 지정 및 사용이 불가능합니다. 
						</p>
						<p class="alignleft FAQQ" onclick="viewFaq('2')">
							<b>
								Q. 
							</b>
							프로그램의 개발자에게 의견을 제시하고 싶어요. 
						</p>
						<p class="alignleft FAQA">
							<b>
								A. 
							</b>
								우선 Chartie 에 대한 관심에 감사드립니다. 
							<br>ㅤ우측 상단의 의견 제안을 이용하시거나,
							<br>ㅤ웹 페이지 가장 하단의 카피 라이트에 포함된 이메일을 참고하여 주시기 바랍니다.
						</p>					
					</div>
					</div>
				</div>
			</div>
		</div>	
		<jsp:include page="Footer.jsp"></jsp:include>
		<script>
			let hwuBtn = document.getElementsByClassName("hwuinBtn");
			let hwuContent = document.getElementsByClassName("hwuincontent");
			let onmouseinA = document.getElementsByClassName("onmouseinA");
			console.log(onmouseinA);
		
			function viewFaq(code){
				let faqA = document.getElementsByClassName("FAQA");
				let style = faqA[code].style.display;
				if(style=="block"){
					faqA[code].setAttribute("style", "display: none;");
				}
				else{
					faqA[code].setAttribute("style", "display: block;");
				}
			}
			
			function showContents(code){
			
				for(let i = 0; i<hwuContent.length; i++){
					hwuContent[i].setAttribute("style", "display:none");
				}
				for(let i = 0; i<hwuBtn.length; i++){
					hwuBtn[i].setAttribute("style", "color: black");
				}
				hwuBtn[code].setAttribute("style", "color: #483BF3;");
				let num = code+1;
				hwuContent[num].setAttribute("style", "display: block;");
				window.scrollTo(0, 360);
			}
			
			hwuBtn[0].addEventListener("click", function(){
				showContents(0);
			});
			hwuBtn[1].addEventListener("click", function(){
				showContents(1);			
			});
			hwuBtn[2].addEventListener("click", function(){
				showContents(2);
			});
			hwuBtn[3].addEventListener("click", function(){
				showContents(3);
			});
			hwuBtn[4].addEventListener("click", function(){
				showContents(4);
			});
			hwuBtn[5].addEventListener("click", function(){
				showContents(5);
			});
			hwuBtn[6].addEventListener("click", function(){
				showContents(6);
			});
			hwuBtn[7].addEventListener("click", function(){
				showContents(7);
			});
			hwuBtn[8].addEventListener("click", function(){
				showContents(8);
			});
			hwuBtn[9].addEventListener("click", function(){
				showContents(9);
			});
			onmouseinA[1].addEventListener("click", function(){
				showContents(3);
			});
			onmouseinA[2].addEventListener("click", function(){
				showContents(4);
			});
			onmouseinA[3].addEventListener("click", function(){
				showContents(5);
			});
			onmouseinA[5].addEventListener("click", function(){
				showContents(4);
			});
			onmouseinA[6].addEventListener("click", function(){
				showContents(5);
			});
			onmouseinA[7].addEventListener("click", function(){
				showContents(9);
			});
			let nextView = document.getElementById("nextView");
			let preView = document.getElementById("preView");
			
			
			
		</script>
	</body>
</html>