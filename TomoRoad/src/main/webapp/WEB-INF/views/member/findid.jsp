<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 /*$(window).load(function(){
	 $("#btnFindUid").click(btnFindUid);
	 $("#btnFindPW").click(btnFindPW);
 });
 
 function btnFindUid(event){
	 var name=$("#name");
	 if(name.val()==""){
		 alert("no name");
		 return;
	 }
	 var dateOfBirth=$("#dateOfBirth");
	 if(dateOfBirth.val()==""){
		 alert("no dob");
		 return;
	 }	
	 $.post("${pageContext.request.contextPath}/DispatcherServlet", {
		 name : name.val(),
		 dateOfBirth : dateOfBirth.val()
	 }, function(data){
		 alert(eval(data).result);
	 });
 }*/
 
 function idSearch() { 
	  var f = document.formFindid;
	  if (f.name.value.length < 1) {
	   alert("이름을 입력해주세요");
	   return false;
	  }
	  if (f.dateOfBirth.value.length < 1) {
		   alert("생년월일을 입력해주세요");
		   return false;
	  }
	  if(isNaN(f.dateOfBirth.value)){
			alert("생년월일은 숫자만 입력가능합니다.");
			return false;
		}   
	    if (f.name.value.indexOf(" ")>=0){
	        alert("이름에 공백을 사용할 수 없습니다.");
	        return false;
	    }
	    if (f.dateOfBirth.value.indexOf(" ")>=0){
	        alert("생년월일에 공백을 사용할 수 없습니다.");
	        return false;
	    }
 }
	 /* frm.method = "post";
	  frm.action = "${pageContext.request.contextPath}/DispatcherServlet"; //넘어간화면
	  frm.submit();  } */

	
 </script>
</head>
<body>
<div >	
	<form name="formFindid" method="post" action="${pageContext.request.contextPath}/findIdByPwNameTel.do"   onsubmit="return idSearch()">
	<input type="hidden" name="command" value="findid">
	<fieldset>
	<legend > Find ID </legend>
	<ul id="findID">
	<li>Find ID</li>
	<li><label>Password:</label><input type="password" id="password" name="password" /></li>
	<li><label>Name:</label><input type="text" id="name" name="name"/></li>
	<li><label>Phone Number:</label><input type="text" id="tel" name="tel"/></li>
	<li><input type="submit" name="btnFindUid" id="btnFindUid" value="Find ID" ></li>
	<li><input type="button" name="cancel" id="cancel" value="Cancel" onClick="window.close()"></li>
	</ul>
	</fieldset>
	</form>
</div>
</body>
</html>