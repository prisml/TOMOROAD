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

  <body>

    <div>

      <form method="post" action="${pageContext.request.contextPath}/login.do" style="margin: 0 auto;">        
        <div>
            <p ><i ></i></p>
            <div >
              <span ><i ></i></span>
              <input type="text" name="id"  placeholder="Username" autofocus>
            </div>
            <div >
                <span ><i ></i></span>
                <input type="password" name="password"  placeholder="Password">
            </div>
            <label  style="margin: 0 auto;">
                <input type="checkbox" value="remember-me"> Remember me
                				<span > <a href="#"> Forgot id?</a></span>
				<br>
                <span > <a href="#"> Forgot Password?</a></span>
            </label>
            <button class="btn btn-info btn-lg btn-block"  type="submit" style="width: 500px; height: 50px; margin: 0 auto; align:center;">Login</button>
            <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/member/register_form.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;" >Sign-up</a>
        </div>
      </form>

    </div>


  </body>
</html>
