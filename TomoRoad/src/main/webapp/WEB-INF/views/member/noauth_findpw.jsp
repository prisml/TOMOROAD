<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
/*  function idSearch() { 
	  var f = document.formFindid;
	  if (f.id.value.length < 1) {
	   alert("id");
	   return false;
	  }
	  if (f.name.value.length < 1) {
		   alert("name");
		   return false;
	  }
	  if (f.tel.value.length < 1) {
		   alert("tel");
		   return false;
	  }
	  if(isNaN(f.tel.value)){
			alert("numbers");
			return false;
		}   
	    if (f.name.value.indexOf(" ")>=0){
	        alert("nope empty");
	        return false;
	    }
	    if (f.id.value.indexOf(" ")>=0){
	        alert("nope empty");
	        return false;
	    }
	    if (f.tel.value.indexOf(" ")>=0){
	        alert("nope empty");
	        return false;
	    }
 } */
 </script>
</head>
<body>
<div >	
	<form name="formFindid" method="post" action="${pageContext.request.contextPath}/noauth_findPw.do" onSubmit="return idSearch()" >
	                <br>
                <br>
                <br>
	<fieldset>
	<legend > Find ID </legend>
	<ul id="findID">
	<li>Find ID</li>
	<li><label>ID:</label><input type="text" id="id" name="id" required="required" autofocus></li>
	<li><label>Name:</label><input type="text" id="name" name="name" required="required"></li>
	<li><label>Phone Number:</label><input type="text" id="tel" name="tel" required="required"></li>
	<li>Find Password<input type="submit" name="btnFindUid" id="btnFindUid" value="Find Password" ></li>

	</ul>
	</fieldset>
	</form>
</div>
</body>
</html>