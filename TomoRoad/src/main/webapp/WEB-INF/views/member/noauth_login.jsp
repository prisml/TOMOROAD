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
    width: 150px; 
    height: 150px;
}
.span {
    text-align: center;
        width: 150px; 
    height: 150px;
}
.label {
    text-align: center;
        width: 150px; 
    height: 150px;
}
.p {
    text-align: center;
        width: 150px; 
    height: 150px;
}
</style>

</head>

  <body>

    <div class="col-lg-12 col-sm-12">           
	
                
        <div class="dividerHeading">
            <h4><span>Please Login</span></h4>
        </div>
        
        
        
        <form method="post" action="${pageContext.request.contextPath}/noauth_login.do" style="margin: 0 auto;">  
           	<div class="form-group">
        		<div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" name="id"  placeholder="ID" autofocus>
            	</div>
            	<br>
            	<div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" name="password" placeholder="Password">
                </div>

            	<div class="form-group">
                	<div class="col-lg-4 col-sm-4"></div>
					<div class="checkbox col-lg-5 col-sm-5">
                        <input type="checkbox"> Remember me
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="/tomoroad/member/noauth_findid.do"> Forgot id?</a>
						/<a href="/tomoroad/member/noauth_findpw.do"> Forgot Password?</a>
					</div>
            	</div>
            </div>
            
            <div class="form-group" align="center">
                <button type="submit" class="btn btn-default btn-lg button" style="width: 400px; height: 40px; margin: 0 auto; align:center;">Sign in</button>
            </div>
      </form>
    
        
        	<div class="form-group" align="center">
        	    <a  class="btn btn-default btn-lg button" href="${pageContext.request.contextPath}/member/noauth_register_form.do" style="width: 400px; height: 40px; margin: 0 auto; align:center;" value="">Sign-up</a>
     	    </div>
     	  
			<div class="form-group" align="center">
      	  		<a  class="btn btn-default btn-lg button" href="${pageContext.request.contextPath}/member/noauth_weather.do" style="width: 400px; height: 40px; margin: 0 auto; align:center;" value="">WEATHER</a>
      	    </div>
     
     
        
    </div>     
      


  </body>
</html>
