document.onkeydown = checkKey;
document.onkeyup = checkKey;
oldkey = -1;
oldevt= '';
function checkKey(e) {
e = e || event;
var evt = e.type;
var key = e.keyCode;
var str = '';
if(key == 68 || key == 67 || key == 65 || key == 90 || key == 37 || key == 39){
if(key!=oldkey || oldevt != evt ){
if(evt=='keyup'){
if(key == 68 || key == 67){
str = 'brs';
}else if(key == 65 || key == 90){
str =  'bls';
}else if(key == 37 || key == 39){
str =  'fs';
}
}else if (evt == 'keydown') {
if(key == 68){
str = 'brf';
}else if(key == 67){
str = 'brb';
}else if(key == 65){
str = 'blf';
}else if(key == 90){
str =  'blb';
}else if(key == 37){
str =  'fl';
}else if(key == 39){
str = 'fr';
}}
oldkey=key;
oldevt=evt;
send(str);
}}}
function send(str) {
var xmlhttp;
xmlhttp=new XMLHttpRequest();
document.getElementById('evt').innerHTML = str;
xmlhttp.open('GET','?'+str,true);
xmlhttp.send();
}