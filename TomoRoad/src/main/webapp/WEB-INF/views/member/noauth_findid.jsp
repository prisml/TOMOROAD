<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<div >	
	<form name="formFindid" method="post" action="${pageContext.request.contextPath}/noauth_findId.do" onSubmit="return idSearch()" >
	                <br>
                <br>
                <br>
	<fieldset>
	<legend > 아이디찾기 </legend>
	<ul id="findID">
	<br>
	<li>정확한 정보를 입력 해주세요</li>
	<br>
<!-- 	<li><label>비밀번호:</label><input type="password" id="password" name="password" required="required" autofocus ></li> -->
	<li><input type="text" placeholder="이름"  id="name" name="name" required="required" autofocus></li>
	<li><input type="text" placeholder="연락처"  id="tel" name="tel" required="required"></li>
	<br>
	<li><input type="submit" name="btnFindUid" id="btnFindUid" value="아이디찾기" class="btn btn-default btn-lg button"></li>
	<br>
	<li><a href="${pageContext.request.contextPath}/home.do" class="btn btn-default btn-lg button">시작화면</a></li>
	<br>
	</ul>
	</fieldset>
	</form>
</div>