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

  <body>

    <div class="container">
	
      <form method="post" action="${pageContext.request.contextPath}/member/registerMember.do" id="regForm">      
        <div>
                        <br>
                <br>
                <br>
            <div>
              <input type="text" class="form-control" name="id"  placeholder="ID" required="required" autofocus>
              <span id="idCheckView"></span>
            </div>
            
            <br>
            <div>
                <input type="password" class="form-control" name="password" id="password" placeholder="Password" required="required" >
            </div>
            
            <br>
            <div>
                <input type="password" class="form-control" name="chpass" id="chpass" placeholder="Re-Password" required="required" >
                <font id="check" size="2" color="red"></font> 
            </div>
            
			<br>
		    <div>
                <input type="text" class="form-control" name="name"  id="name" placeholder="Name" required="required" >
            </div>
            
            <br>
            <div>
                    <label>Gender</label>
					<br>
                                <label>
                                    <input type="radio" name="sex"  id="sex" value="Female" placeholder="Female">Female
                                </label>
                                <label>
                                    <input type="radio" name="sex"  id="sex" value="Male" placeholder="Male">Male
                                </label>
                </div> 
                
            <br>
			<div>
                <input type="text" class="form-control" name="tel"  id="tel" placeholder="Phone Number" required="required" >
            </div>
            
            <br>
                            <div >
                            <label>
                                <input type="checkbox" required="required" >동의합니다 I agree to <a href="#">terms</a>
                            </label>
                </div> 
                
            <br><br>
            <input class="btn btn-info btn-lg btn-block" type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;" value="Sign-up">
            <br>
            <a class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/home.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;">Home</a>
        </div>
      </form>
    </div>


  </body>
</html>
