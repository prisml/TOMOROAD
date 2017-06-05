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

    <div>

      <form method="post" action="${pageContext.request.contextPath}/noauth_login.do" style="margin: 0 auto;">        
        <div>
                <br>
                <br>
                <br>
            <div >
              <input type="text" name="id"  placeholder="Username" autofocus>
            </div>
            <div >
                <input type="password" name="password"  placeholder="Password">
            </div>
            <label  style="margin: 0 auto;">
                <!-- <input type="checkbox" value="remember-me"> Remember me -->
                <br>
                <br>
                <br>
                <span > <a href="${pageContext.request.contextPath}/member/noauth_findid.do"> Forgot id?</a></span>
				<br>
                <span > <a href="${pageContext.request.contextPath}/member/noauth_findpw.do"> Forgot Password?</a></span>
            </label>
            <input class="btn btn-info btn-lg btn-block"  type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;" value="Login">
            <br>
            <a  class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/member/noauth_register_form.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;" value="">Sign-up</a>
                        <br>
            <a  class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/member/weather3.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;" value="">WEATHER</a>
        </div>
      </form>

    </div>


  </body>
</html>
