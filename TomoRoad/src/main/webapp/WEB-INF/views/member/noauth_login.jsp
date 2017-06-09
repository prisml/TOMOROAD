<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


    <title>Login Page</title>
    
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!--  <script type="text/javascript">
    function checkFindId() {
	    window.open("findid.jsp", "_blank", "toolbar=yes,resizable=yes,top=500,left=500,width=500,height=250");
	}
    function checkFindPw() {
	    window.open("findpw.jsp", "_blank", "toolbar=yes,resizable=yes,top=500,left=500,width=500,height=250");
	}
</script> -->
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
            <h4><span>로그인 해주세요╹◡╹)ﾉ</span></h4>
        </div>
        
        
        
        <form method="post" action="${pageContext.request.contextPath}/noauth_login.do" style="margin: 0 auto;">  
           	<div class="form-group">
        		<div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" name="id"  placeholder="아이디" autofocus required="required" style="font-size: 16px;">
            	</div>
            	<br>
            	<div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" name="password" placeholder="비밀번호" required="required" style="font-size: 16px;">
                </div>

            	<div class="form-group">
                	<div class="col-lg-4 col-sm-4"></div>
					<div class="checkbox col-lg-5 col-sm-5">
                        <!-- <input type="checkbox"> Remember me
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
						<a href="/tomoroad/member/noauth_findid.do"> 아이디가 기억이 않나요?</a>
						/<a href="/tomoroad/member/noauth_findpw.do"> 비밀번호가 기억이 않나요?</a>
					</div>
            	</div>
            </div>
            
            <div class="form-group" align="center">
                <button type="submit" class="btn btn-default btn-lg button" style="width: 400px; height: 40px; margin: 0 auto; align:center;">로그인</button>
            </div>
        	<div class="form-group" align="center">
        	    <a  class="btn btn-default btn-lg button" href="${pageContext.request.contextPath}/member/noauth_register_form.do" style="width: 400px; height: 40px; margin: 0 auto; align:center;" value="">가입</a>
     	    </div>  	  
			<div class="form-group" align="center">
      	  		<a  class="btn btn-default btn-lg button" href="${pageContext.request.contextPath}/member/noauth_weather.do" style="width: 400px; height: 40px; margin: 0 auto; align:center;" value="">날씨를 알고 싶어요</a>
      	    </div>
      	    <div class="form-group" align="center">
            <a class="btn btn-default btn-lg button" href="${pageContext.request.contextPath}/home.do" style="width: 400px; height: 40px; margin: 0 auto; align:center;">시작화면</a>
        </div>
      </form>
     
        
    </div>     
      


  </body>
</html>
