<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


    <title>Register Page</title>


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
 <script type="text/javascript">

 $(function(){
  $('#password').keyup(function(){
   $('font[id=check]').text('');
  }); //#user_pass.keyup

  $('#chpass').keyup(function(){
   if($('#password').val()!=$('#chpass').val()){
    $('font[id=check]').text('');
    $('font[id=check]').html("Password incorrect!");
    return false;
   }else{
    $('font[id=check]').text('');
    $('font[id=check]').html("Password correct");
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
</head>

  <body class="login-img3-body">
<% MemberVO vo=(MemberVO)session.getAttribute("mvo"); 
	System.out.println(vo);
	if(vo!=null){
%>
    <div class="container">
	
      <form class="login-form" method="post" action="${pageContext.request.contextPath}/member/updateMember.do" id="updateForm">      
        <div>
                        <br>
                <br>
                <br>
            <div>
             id:  <input type="text" class="form-control" name="id"  value="${mvo.id}" readonly required="required">
              <span id="idCheckView"></span>
            </div>
            
            <br>
            <div>
              password:  <input type="password" class="form-control" name="password" id="password" value="${mvo.password}"required="required" >
            </div>
            
            <br>
            <div>
              password:  <input type="password" class="form-control" name="chpass" id="chpass" placeholder="Re-Password" required="required" >
                <font id="check" size="2" color="red"></font> 
            </div>
            
			<br>
		    <div>
               name: <input type="text" class="form-control" name="name"  id="name" value="${mvo.name}" required="required" >
            </div>  
            
            <br>
            <div>
                    <label>Gender</label>
					<br>
                                <label>
                                <input type="text"   class="form-control"  value="${mvo.sex}" readonly>  
                                <br>
                                    <input type="radio" name="sex"  id="sex" value="Female" placeholder="Female" required="required">Female
                                </label>
                                <label>
                                    <input type="radio" name="sex"  id="sex" value="Male" placeholder="Male" required="required">Male
                                </label>
                </div> 
                
            <br>
			<div>
                <input type="text" class="form-control" name="tel"  id="tel" value="${mvo.tel}" required="required" >
            </div>            
            <br> 
            <br><br>
            <input class="btn btn-info btn-lg btn-block" type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;" value="Update">
            <br>
            <a class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/home.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;">Home</a>
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
