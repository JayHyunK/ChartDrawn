
/*	========================================================================
	============================ 컬러셋 데이터 =================================
	========================================================================*/
//	https://www.design-seeds.com/ 
		
const vivid = [
	"#f70d1a",
	"#ff5f00",
	"#FFE302",
	"#12D900", 
	"#0000FF",
	"#9f00ff"
];

const picnic = [
	"#B3CCEC",
	"#8FA044",
	"#734765",
	"#A87DA9",
	"#C7A4C6",
	"#E3CFEB"
];

const pastel = [
	"#E9F3F9",
	"#CDE2EF",
	"#CAC5D8",
	"#F5D8D5",
	"#FEE5E8",
	"#FAEBEF"
];
	
const forest = [
	"#DAD5D2",
	"#3A3532",
	"#375945",
	"#5B8767",
	"#A6C198",
	"#DBDFC8"
];
		
const choco = [
	"#ECECEC",
	"#CEBBB5",
	"#867674",
	"#CC9E8E",
	"#E6D5C3",
	"#ECE7E0"
];
		
const bluenight = [
	"#8091B0",
	"#304F54",
	"#638B9A",
	"#A5C8DF",
	"#D8E7DB",
	"#D6DBE0"
];

const sunset = [
	"#F9F5E8",
	"#FCF2C3",
	"#FEE49C",
	"#FCD18B",
	"#C9C2C4",
	"#E0DDD7"
]
// 컬러셋 관련 함수
// 컬러셋 지정
		/*	=======================================================================
========================== 에디터 모양 및 색상 =============================
=======================================================================*/

let checkColorFlag = 5;
let checkColorSet = "vivid";

function addColorElement(){
	let colors = colorSet();
	
	if(checkColorFlag>5){
		checkColorFlag = 0;
	}
	
	let color = colors[checkColorFlag];
	console.log(checkColorFlag);
	checkColorFlag++;
	return color;
}
function delColorElement(){
	let colors = colorSet();
	if(checkColorFlag<1){
		checkColorFlag = 5;
	}
	let color = colors[checkColorFlag];
	checkColorFlag--;
	return color;
}
		
function changeColorSet(color){
	checkColorSet = color;
	settingColors();
	colorEditorSelect(color);
}

function colorEditorSelect(color){
	let colorEdi = document.getElementsByClassName("colorset");
	
	for(let i = 0; i<colorEdi.length; i++){
		if(refineColor(color)==colorEdi[i].innerHTML){
colorEdi[i].setAttribute("style", "background-color: #bde8c480;");
		}
		else{
colorEdi[i].removeAttribute("style", "background-color");
		}
	}
}

function refineColor(color){
	let cc;
	if(color=='vivid'){
		cc="비비드";
	}
	else if(color=='picnic'){
		cc="피크닉";
	}
	else if(color=='pastel'){
		cc="파스텔";	
	}
	else if(color=='forest'){
		cc="포레스트";
	}
	else if(color=='choco'){
		cc="초콜릿";
	}
	else if(color=='bluenight'){
		cc="블루나잇";
	}
	else if(color=='sunset'){
		cc="노을";
	}
	return cc;
}

// 컬러셋 설정

function colorSet(){
	let colors=[];
	if(checkColorSet=="vivid"){
		colors=vivid;
	}
	else if(checkColorSet=="picnic"){
		colors=picnic;
	}
	else if(checkColorSet=="pastel"){
		colors=pastel;
	}
	else if(checkColorSet=="forest"){
		colors=forest;	
	}
	else if(checkColorSet=="choco"){
		colors=choco;
	}
	else if(checkColorSet=="bluenight"){
		colors=bluenight;
	}
	else if(checkColorSet=="sunset"){
		colors=sunset;
	}
	else if(checkColorSet=="userSetting"){
		let tbc = document.getElementsByClassName("tableColors");
		
		for(let i = 0; i < tbc.length; i++){
colors.push(tbc[i].value);
		}
	}
	return colors;
}

function changeAlphaColor(needAlpha){
	let color = needAlpha;
	let cSet = [];
	for(let i = 0; i < color.length; i++){
		cSet.push(color[i]+"59");
		console.log(cSet);
	}
	
	return cSet;
}

