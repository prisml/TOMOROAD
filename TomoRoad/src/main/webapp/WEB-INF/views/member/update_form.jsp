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

 $(document).ready(function(){
		var checkResultId="";		
		$("#regForm").submit(function(){				
			if(checkResultId==""){
				alert("아이디 중복확인을 하세요");
				return false;
			}		
		});
		$(":input[name=id]").keyup(function(){
			var id=$(this).val().trim();
			if(id.length<4 || id.length>10){
				$("#idCheckView").html("아이디는 4자이상 10자 이하여야 함!").css(
						"background","pink");
				checkResultId="";
				return;
			}			
			$.ajax({
				type:"POST",
				url:"${pageContext.request.contextPath}/idcheckAjax.do",				
				data:"id="+id,	
				success:function(data){						
					if(data=="fail"){
					$("#idCheckView").html(id+" 사용불가!").css("background","red");
						checkResultId="";
					}else{						
						$("#idCheckView").html(id+" 사용가능!").css(
								"background","yellow");		
						checkResultId=id;
					}					
				}//callback			
			});//ajax
		});//keyup
	});//ready
 </script>
</head>

  <body class="login-img3-body">
<% MemberVO vo=(MemberVO)session.getAttribute("mvo"); 
	System.out.println(vo);
	if(vo!=null){
%>
    <div class="container">
	
      <form class="login-form" method="post" action="${pageContext.request.contextPath}/updateMember.do" id="regForm">      
      <span class="pull-right"></span>  
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" class="form-control" name="id"  value="<%=vo.getId() %>" readonly required="required">
              <span id="idCheckView"></span>
            </div>
            
            <br>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" class="form-control" name="password" id="password" value="<%=vo.getPassword() %>" required="required" >
            </div>
            
            <br>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" class="form-control" name="chpass" id="chpass" placeholder="Re-Password" required="required" >
                <font id="check" size="2" color="red"></font> 
            </div>
            
			<br>
		    <div class="input-group">
                <span class="input-group-addon"></span>
                <input type="text" class="form-control" name="name"  value="<%=vo.getName() %>" required="required" >
            </div>
            
            <br>
            <div class="input-group">
                    <label>Gender</label>
					<br>
                                <label>
                                <input type="text"   class="form-control"  value="<%=vo.getSex() %>" readonly>  
                                <br>
                                    <input type="radio" name="sex"  id="femaleRadio" value="Female" placeholder="Female">Female
                                </label>
                                <label>
                                    <input type="radio" name="sex"  id="maleRadio" value="Male" placeholder="Male">Male
                                </label>
                </div> 
                
            <br>
			<div class="input-group">
                <span class="input-group-addon"></span>
                <input type="text" class="form-control" name="tel"  value="<%=vo.getTel() %>" required="required" >
            </div>
            
            <br>
                            <div class="input-group">
                            <label>
                                <input type="checkbox">동의합니다 I agree to <a href="#">terms</a>
                            </label>
                </div> 
                
            <br><br>
            <button class="btn btn-info btn-lg btn-block" type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;">Update</button>
            <br>
            <a class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/home.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;">Home</a>
            <br>
            <button class="btn btn-info btn-lg btn-block" type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;">Resign</button>
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
