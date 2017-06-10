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
				url:"${pageContext.request.contextPath}/noauth_idcheckAjax.do",				
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
 
 <script type="text/javascript">
 function samePw(){
	if($("#password").val()!=$("#chpass").val()){
		alert("비밀번호를 똑같이 해주세요!");
	return false;
	}
	return true;
 }
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

  <body>

    <div class="col-lg-12 col-sm-12"> 
	
	        <div class="dividerHeading">
            <h4><span>가입 해주세요╹◡╹)ﾉ</span></h4>
        </div>
        
      <form method="post" action="${pageContext.request.contextPath}/member/noauth_registerMember.do" id="regForm" onsubmit="return samePw()" >      
        <div class="form-group">

            <div class="input-group">
            <span id="idCheckView"></span>
            <br>
              <input type="text" class="form-control" name="id"  placeholder="아이디" required="required" autofocus
              style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">           
            </div>
            
            <br>
            <div class="input-group">
                <input type="password" class="form-control" name="password" id="password" placeholder="비밀번호" required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">
            </div>
            
            <br>
            <div class="input-group">
                <input type="password" class="form-control" name="chpass" id="chpass" placeholder="비밀번호확인" required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">
                <br>
                <font id="check" size="2" color="red"></font> 
            </div>
            
			<br>
		    <div class="input-group">
                <input type="text" class="form-control" name="name"  id="name" placeholder="이름" required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">
            </div>
            
            <br>
            <div class="input-group">
                    <label>성별</label>
					<br>
                                <label>
                                    <input type="radio" name="sex"  id="sex" value="여자" >여자
                                </label>
                                &nbsp;&nbsp;
                                <label>
                                    <input type="radio" name="sex"  id="sex" value="남자" >남자
                                </label>
                </div> 
                
            <br>
			<div class="input-group">
                <input type="text" class="form-control" name="tel"  id="tel" placeholder="연락처" required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">
            </div>
            
            <br>
                            <div class="input-group">
                            <label>
                                <input type="checkbox" required="required" >가입을 희망 합니다╹◡╹)ﾉ <!-- I agree to <a href="#">terms</a> -->
                            </label>
                </div> 
                
            <br><br>
            <div class="form-group" align="center">
            <input class="btn btn-default btn-lg button" type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;" value="가입">
           </div>
            <br>
            <div class="form-group" align="center">
            <a class="btn btn-default btn-lg button" href="${pageContext.request.contextPath}/home.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;">시작화면</a>
        </div>
        </div>
      </form>
    </div>


  </body>
</html>
