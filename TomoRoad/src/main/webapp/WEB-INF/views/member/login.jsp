<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


    <title>Login Page</title>
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

  <body class="login-img3-body" style="margin: 0 auto;">

    <div class="container" style="margin: 0 auto;">

      <form class="login-form" method="post" action="${pageContext.request.contextPath}/login.do" style="margin: 0 auto;">        
        <div class="login-wrap">
            <p class="login-img"><i class="icon_lock_alt"></i></p>
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" name="id" class="form-control" placeholder="Username" autofocus>
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" name="password" class="form-control" placeholder="Password">
            </div>
            <label class="checkbox" style="margin: 0 auto;">
                <input type="checkbox" value="remember-me"> Remember me
                				<span class="pull-right"> <a href="#"> Forgot id?</a></span>
				<br>
                <span class="pull-right"> <a href="#"> Forgot Password?</a></span>
            </label>
            <button class="btn btn-primary btn-lg btn-block" type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;">Login</button>
            <a class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/member/register_form.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;" >Sign-up</a>
        </div>
      </form>

    </div>


  </body>
</html>
