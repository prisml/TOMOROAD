<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


    <title>Update Page</title>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">

 $(function(){
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
    $('font[id=check]').html("비밀번호가 같아요╹◡╹)ﾉ");
   }
   return true;
  }); //#chpass.keyup
 });
 
 /* 
 <script type="text/javascript">
 function checkPassword(password){

	 var pw = password;
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

	 if(pw.length < 10 || pw.length > 20){
	  alert("10자리 ~ 20자리 이내로 입력해주세요.");
	  return false;
	 }

	 if(pw.search(/₩s/) != -1){
	  alert("비밀번호는 공백업이 입력해주세요.");
	  return false;
	 }

	 if( (num < 0 && eng < 0) || (eng < 0 && spe < 0) || (spe < 0 && num < 0) ){
	  alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
	  return false;
	 }

	 return true;
	}

	if(!checkPassword( $.trim($('#password').val()))){
	   $('#password').val('');
	   $('#password').focus();
	   return false;
	}
 */

 </script>
  <style type="text/css">
.div {
    text-align: center;

}
.span {
    text-align: center;

}
.label {
    text-align: center;

}
.p {
    text-align: center;

}
.input {
    text-align: center;

}
</style>
</head>

  <body class="login-img3-body">
<% MemberVO vo=(MemberVO)session.getAttribute("mvo"); 
	System.out.println(vo);
	if(vo!=null){
%>
    <div class="col-lg-12 col-sm-12"> 
	
	 <div class="dividerHeading">
            <h4><span>수정해주세요╹◡╹)ﾉ</span></h4>
        </div>
        
      <form method="post" action="${pageContext.request.contextPath}/mypage/updateMember.do" id="updateForm">      
        <div class="form-group">
                        <br>
                <br>
                <br>
            <div class="input-group">
               <input type="text" class="form-control" name="id"  value="${mvo.id}" readonly required="required"
               style="width: 250px; height: 50px; margin: 0 auto; align:center;">
              <span id="idCheckView"></span>
            </div>
            
            <br>
            <div class="input-group">
                <input type="password" class="form-control" name="password" id="password" value="${mvo.password}"required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center;">
            </div>
            
            <br>
            <div class="input-group">
                <input type="password" class="form-control" name="chpass" id="chpass" placeholder="비밀번호확인" required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center;">
                <font id="check" size="2" color="red"></font> 
            </div>
            
			<br>
		    <div class="input-group">
               <input type="text" class="form-control" name="name"  id="name" value="${mvo.name}" required="required" 
               style="width: 250px; height: 50px; margin: 0 auto; align:center;">
            </div>  
            
            <br>
            <div class="input-group">
                    <label>성별</label>
					<br>
                                <label>
                                <input type="text"   class="form-control"  value="${mvo.sex}" readonly>  
                                <br>
                                    <input type="radio" name="sex"  id="sex" value="여자" placeholder="여자" required="required">여자
                                </label>
                                <label>
                                    <input type="radio" name="sex"  id="sex" value="남자" placeholder="남자" required="required">남자
                                </label>
                </div> 
                
            <br>
			<div class="input-group">
                <input type="text" class="form-control" name="tel"  id="tel" value="${mvo.tel}" required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center;">
            </div>            
            <br> 
            <br><br>
            <div class="form-group" align="center">
            <input class="btn btn-default btn-lg button" type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;" value="회원정보수정">
           </div>
            <br>
            <div class="form-group" align="center">
            <a class="btn btn-default btn-lg button" href="${pageContext.request.contextPath}/home.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;">시작페이지</a>
           </div>
            <br>            
        </div>
      </form>
    </div>
<%}else{ %>
		<script type="text/javascript">
			alert("로그인하세요!");
			location.href="${pageContext.request.contextPath}/login.do";
		</script>
<%} %>

  </body>
</html>
