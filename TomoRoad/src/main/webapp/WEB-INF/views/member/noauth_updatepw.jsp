<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">
 $(document).ready(function(){
  $('#password').keyup(function(){
   $('font[id=check]').text('');
  }); //#user_pass.keyup
  $('#chpass').keyup(function(){
   if($('#password').val()!=$('#chpass').val()){
    $('font[id=check]').text('');
    $('font[id=check]').html("비밀번호가 달라요!");
    return false;
   }else{
    $('font[id=check]').text('');
    $('font[id=check]').html("비밀번호가 같아요");
   }
   return true;
  }); //#chpass.keyup
 });
 </script>
 <script type="text/javascript">
 function samePw(){
	if($("#password").val()!=$("#chpass").val()){
		alert("비밀번호를 똑같이 해주세요!");
	return false;
	} else if($("#password").val().length < 4){
		alert("4자 이상 입력해주세요!");
		return false;
		} else if($("#password").val().trim().length == 0){
		alert("공백은 안됍니다!");
		return false;
		} 
	return true;
 }
 </script>
<div >	
	<form name="formFindid" method="post" action="${pageContext.request.contextPath}/noauth_updatePw.do" onsubmit="return samePw()" >
	                <br>
                <br>
                <br>
	<fieldset>
	<legend > 비밀번호찾기 </legend>
	<ul id="findID">
	<br>
	<li>정확한 정보를 입력 해주세요</li>
	<br>
    <li><input type="text" placeholder="아이디" id="id" name="id"  value="${mmvo}" readonly  ></li> 
	<li><input type="password" placeholder="비밀번호" id="password" name="password" required="required" autofocus></li>
	<li><input type="password" placeholder="비밀번호 확인" id="chpass" name="chpass" required="required"></li>
	<li> <font id="check" size="2" color="red"></font> </li>
	<br>
	<li><input type="submit" name="btnFindUid" id="btnFindUid" value="비밀번호 새로등록" class="btn btn-default btn-lg button"></li>
	<br>
	<li><a href="${pageContext.request.contextPath}/home.do" class="btn btn-default btn-lg button">시작화면</a></li>
	<br>
	</ul>
	</fieldset>
	</form>
</div>