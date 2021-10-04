			let arrList;
			let arrDataSet = [];
			let arrLabels = [];
			let arrDatas = [];
			let chartDrawnFlag = true; // 엑셀 필요시 트루
			let tableOnFlag = false; // 테이블 켜질시 트루
			let arrRows = [];
			
		/*	======================== 에디터 버튼 활성 ================================ */
			
			let stylesets = document.getElementsByClassName("styleset");
		
			stylesets[0].addEventListener("click", function(){stylesetClick('bar')});
			stylesets[1].addEventListener("click", function(){stylesetClick('doughnut')});
			stylesets[2].addEventListener("click", function(){stylesetClick('pie')});
			stylesets[3].addEventListener("click", function(){stylesetClick('polarArea')});
			stylesets[4].addEventListener("click", function(){stylesetClick('line')});
			stylesets[5].addEventListener("click", function(){stylesetClick('radar')});
			stylesets[6].addEventListener("click", function(){stylesetClick('bubble')});
			
			function stylesetClick(shape){
				shapeEditorSelect(shape);
				if(shape=="pie"||shape=="polarArea"||shape=="doughnut"){
					checkNeedRow('one');
				}
				else if(shape=="bar"||shape=="bubble"){
					checkNeedRow('two');
				}
			}
			
			function shapeEditorSelect(shape){
				let shapeEdi = document.getElementsByClassName("styleset");
				for(let i = 0; i<shapeEdi.length; i++){
					if(refineShape(shape)==shapeEdi[i].innerHTML){
						console.log(shapeEdi[i].innerHTML);
						shapeEdi[i].setAttribute("style", "background-color: #bde8c480;");
					}
					else{
						shapeEdi[i].removeAttribute("style", "background-color");
					}
				}
			}
			
			function refineShape(shape){
				let sh;
				if(shape=='bar'){
					sh="막대";
				}
				else if(shape=='doughnut'){
					sh="도넛";
				}
				else if(shape=='pie'){
					sh="파이";				
				}
				else if(shape=='polarArea'){
					sh="폴라 에리어";
				}
				else if(shape=='line'){
					sh="선";
				}
				else if(shape=='radar'){
					sh="레이더";
				}
				else if(shape=='bubble'){
					sh="버블";
				}
				return sh;
			}
			
			function checkNeedRow(needs){
				let nds = document.getElementsByClassName("numberDatas");
				let ndsPapa = document.getElementsByTagName("tbody")[0];
				
				if(needs=="one"){
					for(let i = 1; i<nds.length; i++){
						if(nds.length>1&&nds.length>i){
							ndsPapa.removeChild(nds[i]);
							console.log(nds.length);
							
							// 행 삭제에 따른 버튼 높이 조정 
							let tbheight = document.getElementById("minusTableColums");
							let hg = "margin-top: "+((tbheight.offsetHeight-30)/2)+"px;"
							let rowChange = document.getElementsByClassName("rowChange");
							rowChange[0].setAttribute("style", hg);
							rowChange[1].setAttribute("style", hg);
						}
					}
				}
				else if(needs=="two"){
					for(let i = 0; i<nds.length; i++){
						if(nds.length>2&&i<2){
							ndsPapa.removeChild(nds[i]);
								
							// 행 삭제에 따른 버튼 높이 조정 
							let tbheight = document.getElementById("minusTableColums");
							let hg = "margin-top: "+((tbheight.offsetHeight-30)/2)+"px;"
							let rowChange = document.getElementsByClassName("rowChange");
							rowChange[0].setAttribute("style", hg);
							rowChange[1].setAttribute("style", hg);
						}
					}
				}
				else{
					return;
				}
				try{
					checkNeedRow(needs);
				}
				catch(e){
					return;
				}
			}
			
		/*	=======================================================================
			========================= 에디터 말단 버튼 기능 =============================
			=======================================================================*/	
			
			// 사용 방법 버튼: 기능
			let useBtn = document.getElementById("useInfo");
			useBtn.addEventListener("click", function(){
				location.href="HowToUse.jsp"
			});
			
		/*	=================================================================*/
			// 테이블 켜키 버튼: 기능 (직접 입력)
			let toBtn = document.getElementById("tableOn");
			toBtn.addEventListener("click", function(){
				let add = document.getElementById("addTableRow");
				let del = document.getElementById("minusTableRow");
				
				settingColors();
				
				if(tableOnFlag==false){
					let tb = document.getElementById("tableSheet");
					tb.setAttribute("style", "display:flex;");
					add.setAttribute("style", "display:block;");
					del.setAttribute("style", "display:block;");
					tableOnFlag = true;
					chartDrawnFlag = false;				
				}
				else if(tableOnFlag==true){
					let tb = document.getElementById("tableSheet");
					tb.setAttribute("style", "display:none;");
					add.setAttribute("style", "display:none;");
					del.setAttribute("style", "display:none;");
					tableOnFlag = false;
					chartDrawnFlag = true;
				}
			});
			
			function settingColors(){
				let colors = colorSet();
				let num = document.getElementsByClassName("tableColors").length;
				
				for(let i = 0; i < num; i++){
					let tds = document.getElementsByClassName("tableColors")[i];
					tds.setAttribute("value", colors[i%6]);
				}
			}
	
			// 테이블 열 추가 및 삭제 기능
			let mtcBtn = document.getElementById("minusTableColums");
			mtcBtn.addEventListener("click", function(){
				let trs = document.getElementsByClassName("tableSheetTr");
				let trlabel = trs[0];
				let trvalue = document.getElementsByClassName("numberDatas");
				let trcolor = trs[trs.length-1];
				
				if(document.getElementsByClassName("tableLabels").length<2){
					return;
				}
				trlabel.removeChild(trlabel.lastElementChild);
				
				for(let i = 0; i<trvalue.length; i++){
					trvalue[i].removeChild(trvalue[i].lastElementChild);
				}
				trcolor.removeChild(trcolor.lastElementChild);
				delColorElement();
			});
			
			let atcBtn = document.getElementById("addTableColums");
			atcBtn.addEventListener("click", function(){
				let trs = document.getElementsByClassName("tableSheetTr");
				let trlabel = trs[0];
				let trvalue = document.getElementsByClassName("numberDatas");
				let trcolor = trs[trs.length-1];
				
				// table 라벨 항목 추가 
				let tdl = document.createElement("td");
				let tdlInput = document.createElement("div");
				tdlInput.setAttribute("class", "tableLabels");
				tdlInput.setAttribute("placeholder", "분류");
				tdlInput.setAttribute("contenteditable", "true");
				tdl.appendChild(tdlInput);
				trlabel.appendChild(tdl);
				
				// table 밸류 항목 추가 
				for(let i = 0; i<trvalue.length; i++){
					let tdv = document.createElement("td");
					let tdvInput = document.createElement("div");
					tdvInput.setAttribute("class", "tableDatas");
					tdvInput.setAttribute("placeholder", "값");
					tdvInput.setAttribute("contenteditable", "true");
					tdv.appendChild(tdvInput);
					trvalue[i].appendChild(tdv);
				}
				
				// table 컬러 항목 추가 
				let tdc = document.createElement("td");
				let tdcInput = document.createElement("input");
				tdcInput.setAttribute("class", "tableColors");
				tdcInput.setAttribute("type", "color");
				tdcInput.setAttribute("value", addColorElement());
				tdc.appendChild(tdcInput);
				trcolor.appendChild(tdc);
			});
			
			let mtrBtn = document.getElementById("minusTableRow");
			mtrBtn.addEventListener("click", function(){
				let nds = document.getElementsByClassName("numberDatas");
				let ndsPapa = document.getElementsByTagName("tbody")[0];
				if(nds.length>=2){
					ndsPapa.removeChild(nds[0]);
				}
				// 행 삭제에 따른 버튼 높이 조정 
				let tbheight = document.getElementById("minusTableColums");
				let hg = "margin-top: "+((tbheight.offsetHeight-30)/2)+"px;"
				let rowChange = document.getElementsByClassName("rowChange");
				rowChange[0].setAttribute("style", hg);
				rowChange[1].setAttribute("style", hg);
			
			});
			
			let atrBtn = document.getElementById("addTableRow");
			atrBtn.addEventListener("click", function(){
				let nds = document.getElementsByClassName("numberDatas")[0];
				let ndsChild = nds.childNodes;
				let tbody = document.getElementsByTagName("tbody")[0];
				let ndsClone = nds.cloneNode();
				
				if(document.getElementsByClassName("numberDatas").length>1&&chartStyle()=="bar"){
					alert("막대 형식의 그래프는 행의 마지막과 행의 처음의 값 차이에 따라 차트가 그려집니다. 3줄 이상인 경우 정상 작동하지 않습니다. 1줄인 경우, 0을 기준으로 표시됩니다.");
					return;
				}
				if(document.getElementsByClassName("numberDatas").length>1&&chartStyle()=="bubble"){
					alert("버블 형식의 그래프는 행의 마지막과 행의 처음의 값을 각각 x,y 좌표로 하여 차트가 그려집니다. 3줄 이상인 경우 정상 작동하지 않습니다.");
					return;
				}
				if(document.getElementsByClassName("numberDatas").length>0&&chartStyle()=="doughnut"){
					alert("도넛 형태의 그래프는 분류에 따른 값을 도넛모양으로 보여줍니다. 2줄 이상일 경우 정상 작동하지 않습니다.");
					return;
				}
				if(document.getElementsByClassName("numberDatas").length>0&&chartStyle()=="pie"){
					alert("파이 형태의 그래프는 분류에 따른 값을 파이모양으로 보여줍니다. 2줄 이상일 경우 정상 작동하지 않습니다.");
					return;
				}
				if(document.getElementsByClassName("numberDatas").length>0&&chartStyle()=="polarArea"){
					alert("폴라에리어 형태의 그래프는 분류에 따른 값을 각 영역 별로 보여줍니다. 2줄 이상일 경우 정상 작동하지 않습니다.");
					return;
				}
				for(let i = 0; i<ndsChild.length; i++){
					let ndsChildClone = ndsChild[i].cloneNode();
					for(let j = 0; j<ndsChild[i].childNodes.length; j++){
						let ameba = ndsChild[i].childNodes[j].cloneNode();
						ndsChildClone.appendChild(ameba);
					}
					ndsClone.appendChild(ndsChildClone);
					
				}
				tbody.appendChild(ndsClone);
				
				// 행 추가에 따른 버튼 높이 조정 
				let tbheight = document.getElementById("addTableColums");
				let hg = "margin-top: "+((tbheight.offsetHeight-30)/2)+"px;"
				let rowChange = document.getElementsByClassName("rowChange");
				rowChange[0].setAttribute("style", hg);
				rowChange[1].setAttribute("style", hg);
			});
			
			/*=================================================================*/
			
			// 엑셀 업로드 버튼: 기능
			let euBtn = document.getElementById("excelUpload");
			euBtn.addEventListener("click", function(){
				let file = document.getElementById("fileinput");
				file.click();
			});
			
			// 차트 다운로드 버튼: 기능
			let cidBtn = document.getElementById("chartImgDownload");
			cidBtn.addEventListener("click", function(){
				let canvas = document.getElementById("chart");
				let cvdURL = canvas.toDataURL("image/png");
				let aTag = document.createElement("a");
				aTag.href = cvdURL;
				console.log(aTag);
				aTag.download = "Chartie-Mychart.png";
				aTag.click();
			});
			
			
		/*	=======================================================================
			=========================== 엑셀 Read Ribray ===========================
			=======================================================================*/
			
			function excelIn(){ // 파일로 데이터 변경시 excel 파일을 오브젝트로 변경. 
				// 새로운 파일 업로드시 초기화
				arrDataSet = [];
				arrLabels = [];
				arrDatas = [];
				arrList = [];
				arrRows = [];
				
				let file = frm.excelfile.files[0];
				console.log(file);
				let fileReader = new FileReader();
				fileReader.onload = function(){ 
					let data = fileReader.result;
					//console.log("data: "+data);
					let buffer = XLSX.read(data, { type : 'binary' });
					console.log("buffer: "+buffer);
					buffer.SheetNames.forEach(
						function(sheetName){ 
							let row=XLSX.utils.sheet_to_json(buffer.Sheets[sheetName]); 
							arrList = row; // 데이터 정제를 위해 List 형태 데이터를 담음
							console.log(arrList);
						}) 
				}; 
				fileReader.readAsBinaryString(file);
				/* 	첫번째 라인: Key 
				두번째 라인~: Value, Key 값 자체는 열 별로 공유함, 다만 List 의 차이로 구분 */	
			}
		
		
			// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> 체크용 기능 삭제
			function checkdata(){		
				console.log(arrList);
				console.log(arrLabels);
				console.log(arrDatas);
				console.log(arrDataSet);
				console.log(arrRows);
				// arraylist에서 배열 지정 후, 맵 데이터 가져오기는 키값을 경로 지정
			}
			
		/*	========================================================================
			============================ 데이터 정제 ==================================
			========================================================================*/	
			
			function refineChart(){
				if(arrLabels.length==0){
					for(i in arrList){
						arrLabels = Object.keys(arrList[i]);
						arrDatas = Object.values(arrList[i]);
						arrDataSet.push(arrDatas);
					}
					for(i in arrDataSet){
						for(j in arrDataSet[i]){
							if(j==0){
								arrRows.push(arrDataSet[i][j]+"");
							}
							if(j==arrDataSet[i].length-1){
								arrDataSet[i].shift();
							}
						}
					}
					arrLabels.shift();
				}
				
				checkdata();
			}
			
		/*	========================================================================
			============================ 차트 그리기 ==================================
			========================================================================*/
			
			function chartStyle(){
				let cs; 
				let chartstyle = document.getElementsByClassName("chartstyle");
				for(i in chartstyle){
					if(chartstyle[i].checked==true){
						cs=chartstyle[i].value;
					}
				}
				return cs;
			}
			
			function chartData(){
				let data={};
				let imsidata=[]
				let cs = colorSet();
				
				data = {
					labels: arrLabels,
					datasets: [{
						label: arrLabels,
						backgroundColor: colorSet(),
						borderColor: '#f2f2f2',
						data: arrDatas,
					}]	
				}	
				return data;
			}	
			function chartDataBar(){
				let data={};
				let imsidata=[]
				let cs = colorSet();
				let name = chartStyle()+" Chart";	
				
				data = {
					labels: arrLabels,
					datasets: [{
						label: name,
						backgroundColor: colorSet(),
						borderColor: '#f2f2f2',
						data: arrDatas,
					}]	
				}	
				return data;
			}	
			// https://www.chartjs.org/docs/latest/charts/line.html
			function drawChart(){
				refreshChart();
				console.log("드러운차트");
				
				let imsi = checkColorSet; 
				// 현재 컬러셋을 임시로 저장하고 함수 종료시 컬러셋 재설정
				// 안할 경우 컬럼 추가시 색상 셋대로 안잡힘
				
				if(tableOnFlag==true){
					changeColorSet("userSetting");
				}
				
			/*	========================== 차트 그리기 알고리즘 ============================	*/
			
				if(chartDrawnFlag==true){ // 엑셀을 이용해서 데이터를 추출
					refineChart();
					if(arrDataSet.length<2){ // 줄이 1개만 필요한 경우
						if(chartStyle()=="line"||chartStyle()=="radar"||chartStyle()=="bubble"){
							alert("선, 레이더, 버블 형식은 1개의 분류에 대해 다수의 값이 있어야 합니다. (행의 분류는 데이터 값에 대한 영역, 열의 분류는 데이터의 공통을 나타내는 속성을 말합니다.)");
							return;
						}
						else if(chartStyle()=="bar"){
							
							
							let myChartConfig = {
									type: chartStyle(),
									data: chartDataBar(),
									option: {}
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
						}
						else{
							let myChartConfig = {
									type: chartStyle(),
									data: chartData(),
									option: {}
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
						}
					}
					else if(arrDataSet.length>1){ // 줄이 2개 이상 필요한 경우
						if(chartStyle()=="doughnut"||chartStyle()=="pie"||chartStyle()=="polarArea"){
							alert("해당 형식은 분류와 값이 1:1로 매치되어야 합니다.");
							return;
						}
						else if(chartStyle()=="bar"){  
							
							if(arrDataSet.length>2){
								alert("막대 형식의 그래프는 행의 마지막과 행의 처음의 값 차이에 따라 차트가 그려집니다. 3줄 이상인 경우 정상 작동하지 않습니다. 1줄인 경우, 0을 기준으로 표시됩니다.");
								return;
							};
							let arrRefineData=[]
							let arrDatasAll=[]
							let cs = colorSet();
							for(let i = 0; i < arrDataSet.length; i++){
								for(let j = 0; j < arrDataSet[i].length; j++){
									arrDatasAll.push(arrDataSet[i][j]);
								}
							}
							
							for(let i = 0; i<arrLabels.length; i++){
								let arr=[];
								for(let j = 0; j<arrDatasAll.length; j++){
									if((j%arrLabels.length)==i){
										arr.push(arrDatasAll[j]);
									}
								}
								arrRefineData.push(arr);
							}
							
							let name = chartStyle()+" Chart";	
								
							let data = {
								labels: arrLabels,
								datasets:[{
									label: name,
									data: arrRefineData,
									backgroundColor: colorSet(),
								}]
							}
								
							let myChartConfig = {
								type: chartStyle(),
								data: data,
								option: {}
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
							
						}
					
						else if(chartStyle()=="line"){
							let data={};
							let imsidata=[]
							let cs = colorSet();
							
							for(let i = 0; i<arrLabels.length; i++){
							
								let imd = [];
								for(let j = 0; j < arrDataSet.length; j++){
									for(let c = 0; c < arrDataSet[j].length; c++){
										if((c%arrLabels.length)==i){
											imd.push(arrDataSet[j][i]);
										}
									}
								}
								
								let imsiimsidata={
									type: chartStyle(),
									label: arrLabels[i],
									data: imd, 
									fill: false,
									borderColor: cs[i%6],
									tension: 0.1,
								};
								imsidata.push(imsiimsidata);
								console.log(imsidata);
							}
								
							data = {
								labels: arrRows,
								datasets: imsidata
							}
								
							let myChartConfig = {
								type: chartStyle(),
								data: data
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
						}
						else if(chartStyle()=="radar"){
							let data={};
							let imsidata=[]
							let cs = colorSet();
							cs = changeAlphaColor(cs);
							
							for(let i = 0; i<arrLabels.length; i++){
							
								let imd = [];
								for(let j = 0; j < arrDataSet.length; j++){
									for(let c = 0; c < arrDataSet[j].length; c++){
										if((c%arrLabels.length)==i){
											imd.push(arrDataSet[j][i]);
										}
									}
								}
								
								let imsiimsidata={
									label: arrLabels[i],
									data: imd, 
									fill: true,
									backgroundColor: cs[i%6]
								};
								imsidata.push(imsiimsidata);
								console.log(imsidata);
							}
								
							data = {
								labels: arrRows,
								datasets: imsidata
							}
								
							let myChartConfig = {
								type: chartStyle(),
								data: data
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
						}
						else if(chartStyle()=="bubble"){
							let data={};
							let imsidata=[];
							let cs = colorSet();
							
							if(arrDataSet.length>2){
								alert("버블 형식의 그래프는 행의 마지막과 행의 처음의 값을 각각 x,y 좌표로 하여 차트가 그려집니다. 3줄 이상인 경우 정상 작동하지 않습니다.");
								return;
							}
							let cmd = [];
							for(let i = 0; i<arrLabels.length; i++){
								let imd = [];
								for(let j = 0; j < arrDataSet.length; j++){
									for(let c = 0; c < arrDataSet[j].length; c++){
										if((c%arrLabels.length)==i){
											imd.push(arrDataSet[j][i]);
										}
									}
								}
								
								let bb = [{ 
									x: imd[0],
									y: imd[1],
									r: 10
								}]
								let buble = {
									type: chartStyle(),
									label: arrLabels[i], 
									data: bb,
									fill: true,
									backgroundColor: cs[i%6]
								}
								imsidata.push(buble);
								console.log(buble);
							}
								
							data = {
								label: arrRows,
								datasets: imsidata
							}
								
							let myChartConfig = {
								type: chartStyle(),
								data: data,
								options: {}
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
						}
					}
				}
				else if(chartDrawnFlag==false){ // 테이블을 이용해서 데이터 추출
					if(document.getElementsByClassName("numberDatas").length<2){ // 줄이 1개만 필요한 경우
						
						if(chartStyle()=="line"||chartStyle()=="radar"||chartStyle()=="bubble"){
							alert("선, 레이더, 버블 형식은 1개의 분류에 다수의 값이 있을때 정상적으로 표시됩니다.");
						}
						if(chartStyle()=="polarArea"){
							arrLabels=[];
							let tbl = document.getElementsByClassName("tableLabels");
							
							for(let idx = 0; idx<tbl.length; idx++){
								arrLabels.push(tbl[idx].innerHTML);
							}		
							
							arrDatas=[];
							
							let tbv = document.getElementsByClassName("tableDatas");
							for(let idx = 0; idx<tbv.length; idx++){
								arrDatas.push(tbv[idx].innerHTML);
							}
							
							let name = chartStyle()+" Chart";
							
							let bar={
								labels: arrLabels,
								datasets:[{
									label: name,
									data: arrDatas,
									backgroundColor: colorSet(),
								}]
							};
							
							let myChartConfig = {
									type: chartStyle(),
									data: bar,
									option: {}
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);	
							
						}
						else{
							arrLabels=[];
							let tbl = document.getElementsByClassName("tableLabels");
							
							for(let idx = 0; idx<tbl.length; idx++){
								arrLabels.push(tbl[idx].innerHTML);
							}		
							
							arrDatas=[];
							let arrRefineData=[];
							let tbv = document.getElementsByClassName("tableDatas");
							for(let idx = 0; idx<tbv.length; idx++){
								arrDatas.push(tbv[idx].innerHTML);
							}
							
							let arrTr = document.getElementsByClassName("numberData");
							
							for(let i = 0; i<arrLabels.length; i++){
								
								let arrTd = [];
								for(let l = 0; l<arrDatas.length; l++){
									if((l%arrLabels.length)==i){
										arrTd.push(arrDatas[l]);
									}
								}
								arrRefineData.push(arrTd);
								console.log(arrTd);
								console.log(arrRefineData);
							}
							
							let name = chartStyle()+" Chart";
							
							let bar={
								labels: arrLabels,
								datasets:[{
									label: name,
									data: arrRefineData,
									backgroundColor: colorSet(),
								}]
							};
							
							let myChartConfig = {
									type: chartStyle(),
									data: bar,
									option: {}
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);	
						}
					}
					else if(document.getElementsByClassName("numberDatas").length>1){ // 줄이 2개 이상
						
						if(chartStyle()=="doughnut"||chartStyle()=="pie"||chartStyle()=="polarArea"){
							alert("해당 형식은 열에 대한 분류와 값이 1:1로 매치되어야 합니다.");
							return;
						}
						else if(chartStyle()=="bar"){ 
							
							arrLabels=[];
							let tbl = document.getElementsByClassName("tableLabels");
							
							for(let idx = 0; idx<tbl.length; idx++){
								arrLabels.push(tbl[idx].innerHTML);
							}		
							
							arrDatas=[];
							let arrRefineData=[];
							let tbv = document.getElementsByClassName("tableDatas");
							for(let idx = 0; idx<tbv.length; idx++){
								arrDatas.push(tbv[idx].innerHTML);
							}
							
							let arrTr = document.getElementsByClassName("numberData");
							
							for(let i = 0; i<arrLabels.length; i++){
								
								let arrTd = [];
								for(let l = 0; l<arrDatas.length; l++){
									if((l%arrLabels.length)==i){
										arrTd.push(arrDatas[l]);
									}
								}
								arrRefineData.push(arrTd);
								console.log(arrTd);
								console.log(arrRefineData);
							}
							
							let name = chartStyle()+" Chart";
							
							let bar={
								labels: arrLabels,
								datasets:[{
									label: name,
									data: arrRefineData,
									backgroundColor: colorSet(),
								}]
							};
							
							let myChartConfig = {
									type: chartStyle(),
									data: bar,
									option: {}
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);	
						}
						else if(chartStyle()=="line"){
							let needMoreDatas = document.getElementsByClassName("needMoreDatas");
							let fileds = [];
							
							for(let i = 0; i < needMoreDatas.length; i++){
								fileds.push(needMoreDatas[i].innerHTML);
							}
							
							//fileds
							arrLabels=[];
							let dataRefine=[];
							
							let tbl = document.getElementsByClassName("tableLabels");
							for(let idx = 0; idx<tbl.length; idx++){
								arrLabels.push(tbl[idx].innerHTML);
							}
							let numberDatas = document.getElementsByClassName("numberDatas");// tr
							let tableDatas = document.getElementsByClassName("tableDatas");// td
							
							
							for(let i = 0; i < arrLabels.length; i++){
								let dataArrLTds; 
								let cset = colorSet();
								for(let tri = 0; tri < numberDatas.length; tri++){
									dataArrLTds = [];
									for(let tdi = 0; tdi < tableDatas.length; tdi++){
										if((tdi%arrLabels.length)==i){
											dataArrLTds.push(tableDatas[tdi].innerHTML);
										}
									}	
								}	
								let dataArrL = {
										type: chartStyle(),
										label: arrLabels[i], 
										data: dataArrLTds,
										fill: false,
										borderColor: cset[i%6], 
										tension: 0.1
								}
								console.log(dataArrL);
								dataRefine.push(dataArrL);
							}
							
							let dt ={
								labels: fileds,
								datasets: dataRefine
							};
							let myChartConfig = {
								type: chartStyle(),
								data: dt
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
						}
						else if(chartStyle()=="radar"){
							
							let needMoreDatas = document.getElementsByClassName("needMoreDatas");
							let fileds = [];
							for(let i = 0; i < needMoreDatas.length; i++){
								fileds.push(needMoreDatas[i].innerHTML);
							}
							
							arrLabels=[];
							let dataRefine=[];
							
							let tbl = document.getElementsByClassName("tableLabels");
							for(let idx = 0; idx<tbl.length; idx++){
								arrLabels.push(tbl[idx].innerHTML);
							}
							
							let numberDatas = document.getElementsByClassName("numberDatas");// tr
							let tableDatas = document.getElementsByClassName("tableDatas");// td
							
							
							for(let i = 0; i < arrLabels.length; i++){
								let dataArrLTds; 
								let cset = colorSet();
								
								cset = changeAlphaColor(cset);
								
								for(let tri = 0; tri < numberDatas.length; tri++){
									dataArrLTds = [];
									for(let tdi = 0; tdi < tableDatas.length; tdi++){
										if((tdi%arrLabels.length)==i){
											dataArrLTds.push(tableDatas[tdi].innerHTML);
										}
									}	
								}	
								let dataArrL = {
										type: chartStyle(),
										label: arrLabels[i], 
										data: dataArrLTds,
										fill: true,
										backgroundColor: cset[i%6], 
								}
								console.log(dataArrL);
								dataRefine.push(dataArrL);
							}
							
							let dt ={
								labels: fileds,
								datasets: dataRefine
							};
							let myChartConfig = {
								type: chartStyle(),
								data: dt,
								option: {elements:{line:{borderWidth:2}}}
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
						}
						else if(chartStyle()=="bubble"){ // 수정 필요 09092021
							let needMoreDatas = document.getElementsByClassName("needMoreDatas");
							let fileds = [];
							for(let i = 0; i < needMoreDatas.length; i++){
								fileds.push(needMoreDatas[i].innerHTML);
							}
							
							//fileds
							arrLabels=[];
							let dataRefine=[];
							
							let tbl = document.getElementsByClassName("tableLabels");
							for(let idx = 0; idx<tbl.length; idx++){
								arrLabels.push(tbl[idx].innerHTML);
							}
							
							let numberDatas = document.getElementsByClassName("numberDatas");// tr
							let tableDatas = document.getElementsByClassName("tableDatas");// td
							
							for(let i = 0; i < arrLabels.length; i++){
								let cset = colorSet();
								let imd = [];
								for(let tri = 0; tri < numberDatas.length; tri++){
									for(let tdi = 0; tdi <tableDatas.length; tdi++){
										if((tdi%arrLabels.length)==i){
											imd.push(tableDatas[tdi].innerHTML);
										}
									}
									
								}	
								let bb=[{
									x: imd[0],
									y: imd[1],
									r: 10
								}]
								let dataArrL = {
									type: chartStyle(),
									label: arrLabels[i], 
									data: bb,
									fill: true,
									backgroundColor: cset[i%6], 
								}
								dataRefine.push(dataArrL);
							}
							
							let dt ={
								labels: fileds,
								datasets: dataRefine
							};
							let myChartConfig = {
								type: chartStyle(),
								data: dt
							};
							let chart = new Chart(document.getElementById("chart"), myChartConfig);
						}
					}
				}
				
			/*	=======================================================================	*/	
				
				changeColorSet(imsi);
			}
			
			function refreshChart(){
				let chartBoard = document.getElementById("chartBoard");
				chartBoard.removeChild(chartBoard.firstElementChild);
				let canvasNode = document.createElement("canvas");
				canvasNode.setAttribute("id", "chart");
				chartBoard.appendChild(canvasNode);
				
				let flag = chartStyle();
				
				if(flag=="bar"||flag=="line"||flag=="bubble"){
					chartBoard.setAttribute("style", "height: 450px;");
				}
				else{
					chartBoard.setAttribute("style", "height: 900px;");
				}
					
			}
			


