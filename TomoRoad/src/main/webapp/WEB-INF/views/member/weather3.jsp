<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Open Platform Example </title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script> 
<script type="text/javascript" src="planetxsdk.js"></script>
<script type="text/javascript"> 
$( function () {  
PlanetX.init( {
// 본인의 appkey 정보 입력
appkey : "8421c986-f989-380a-b1cd-e704499e6b86" , 
 
// 본인의 client id 정보 입력
client_id : "qpzmalwo",  
 
// 본인의 redirect uri 정보 입력
redirect_uri : "http://localhost:8080/",                   
 
// 앱에서 접근할 수 있는 서비스 리스트
scope : "tcloud,user"              
} );
});
     
function userprofile() {
PlanetX.api( "get", "https://apis.skplanetx.com/users/me/profile", "JSON", { “version”: 1},
userProfile_callback );
} 
     
function userProfile_callback( data ) {
var resultMessage, resultDivision = $("#result1"); 
resultMessage = "<h2> userProfile success </h2>" ;
         
for ( var property in data.profile ) {
    resultMessage +=  (property + " : " + data.profile[property] + "<br>") ;
}
         
resultDivision.html( resultMessage );       
}
</script> 
</head>
 
<body>
<button onclick="PlanetX.login()">Login</button>
<button onClick="userprofile()">my profile</button>
<div id='result1'></div>
</body> 
</html>