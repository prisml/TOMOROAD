<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div >	
	<form name="formFindid" method="post" action="${pageContext.request.contextPath}/member/noauth_findpw2.do" onSubmit="return idSearch()" >
	                <br>
                <br>
                <br>
	<fieldset>
	<legend > 비밀번호찾기 </legend>
	<ul id="findID">
	<li>정확한 정보를 입력 해주세요╹◡╹)ﾉ</li>
	<li><label>아이디:</label><input type="text" id="id" name="id" required="required" autofocus></li>
	<li><label>이름   :</label><input type="text" id="name" name="name" required="required"></li>
	<li><label>연락처:</label><input type="text" id="tel" name="tel" required="required"></li>
	<li><input type="submit" name="btnFindUid" id="btnFindUid" value="비밀번호 새로지정" class="btn btn-default btn-lg button"></li>
    <li><a href="${pageContext.request.contextPath}/home.do" class="btn btn-default btn-lg button">시작화면</a></li>
	</ul>
	</fieldset>
	</form>
</div>