<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


    <title>Register Page</title>



     <script type="text/javascript">
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

    <div class="container">
	
      <form class="login-form" method="post" action="${pageContext.request.contextPath}/registerMember.do" id="regForm">      
      <span class="pull-right"> 회원가입</span>  
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" class="form-control" name="id"  placeholder="ID" required="required" autofocus>
              <span id="idCheckView"></span>
            </div>
            
            <br>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" class="form-control" name="password"  placeholder="Password" required="required" >
            </div>
            
            <br>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" class="form-control" placeholder="Re-Password" required="required" >
            </div>
            
			<br>
		    <div class="input-group">
                <span class="input-group-addon"></span>
                <input type="text" class="form-control" name="name"  placeholder="Name" required="required" >
            </div>
            
            <br>
            <div class="input-group">
                    <label>Gender</label>
					<br>
                                <label>
                                    <input type="radio" name="sex"  id="femaleRadio" value="Female" placeholder="Female">
                                </label>
								<br>
                                <label>
                                    <input type="radio" name="sex"  id="maleRadio" value="Male" placeholder="Male">
                                </label>
                </div> 
                
            <br>
			<div class="input-group">
                <span class="input-group-addon"></span>
                <input type="text" class="form-control" name="tel"  placeholder="Phone Number" required="required" >
            </div>
            
            <br>
                            <div class="input-group">
                            <label>
                                <input type="checkbox">동의합니다 I agree to <a href="#">terms</a>
                            </label>
                </div> 
                
            <br><br>
            <button class="btn btn-info btn-lg btn-block" type="submit">Sign-up</button>
            <a class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/home.do">Home</a>
        </div>
      </form>
    </div>


  </body>
</html>
