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
	  if (f.password.value.length < 1) {
	   alert("password");
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
	    if (f.password.value.indexOf(" ")>=0){
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
	<form name="formFindid" method="post" action="${pageContext.request.contextPath}/noauth_findId.do" onSubmit="return idSearch()" >
	                <br>
                <br>
                <br>
	<fieldset>
	<legend > 아이디찾기 </legend>
	<ul id="findID">
	<li>정확한 정보를 입력 해주세요╹◡╹)ﾉ</li>
	<li><label>비밀번호:</label><input type="password" id="password" name="password" required="required" autofocus ></li>
	<li><label>이름:</label><input type="text" id="name" name="name" required="required"></li>
	<li><label>연락처:</label><input type="text" id="tel" name="tel" required="required"></li>
	<li><input type="submit" name="btnFindUid" id="btnFindUid" value="아이디찾기" class="btn btn-default btn-lg button"></li>

	</ul>
	</fieldset>
	</form>
</div>
</body>
</html>