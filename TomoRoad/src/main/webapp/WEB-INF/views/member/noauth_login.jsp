<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script type="text/javascript">
var key = "tomoroad";
var input = ""; //input 초기화
	  $(document).keypress(function(e) { //keypress 키보드를 눌렀을때 입력된 문자를 알려줍니다		  
		 if (e.which !== 0) { //키보드를 누른 값이 있을때
		        input += String.fromCharCode(e.which); //아스키코드 문자 반환String.fromCharCode()
		        if(key.length == input.length && key == input) //키값과 input값이 같을시
		        	location.href="/tomoroad/manager/noauth_manager_login.do"; //관리자 로그인 페이지로 이동
		          else if(key.length == input.length && key != input) //키값과 input값이 같지 않을시
		        	key = "";  //키값 초기화 	        
		    }
	  });
	  $(document).ready(function(){
		  $(".form-control").keypress(function(){
			  input="";	//input 초기화 인풋창에서 키를 누르려는 일반회원들과의 차이를 두기 위해서
		  });
	  });
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

    <div class="col-lg-12 col-sm-12" >           
	
                
        <div class="dividerHeading">
            <h4><span>로그인</span></h4>
        </div>
        

        
        <form method="post" action="${pageContext.request.contextPath}/noauth_login.do" style="margin: 0 auto;"> 
       
           	<div class="form-group" align="center" >
        		<div class="input-group" align="center">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" name="id"  id="id" placeholder="아이디" autofocus required="required" style="font-size: 16px; margin: 0 auto; align:center;">
            	</div>
            	<br>
            	<div class="input-group" align="center">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" name="password" placeholder="비밀번호" required="required" style="font-size: 16px; margin: 0 auto; align:center;">
                </div>
<!--             	<div class="form-group" style="margin: 0 auto; align:center;">
                	<div class="col-lg-4 col-sm-4" style="margin: 0 auto; align:center;"></div>
            	</div> -->
            		<div class="checkbox" align="ceneter">
                        <!-- <input type="checkbox"> Remember me
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
						<a href="/tomoroad/member/noauth_findid.do"> 아이디가 기억이 안나요?</a>
						/<a href="/tomoroad/member/noauth_findpw.do"> 비밀번호가 기억이 안나요?</a>
					</div>
            </div>
            
            
            <div class="form-group" align="center">
                <button type="submit" class="btn btn-default btn-lg button" style="width: 400px; height: 40px; margin: 0 auto; align:center;">로그인</button>
            </div>
        	<div class="form-group" align="center">
        	    <a  class="btn btn-default btn-lg button" href="/tomoroad/member/noauth_register_form.do" style="width: 400px; height: 40px; margin: 0 auto; align:center;">가입</a>
     	    </div>  	  
      	    <div class="form-group" align="center">
            <a class="btn btn-default btn-lg button" href="${pageContext.request.contextPath}/home.do" style="width: 400px; height: 40px; margin: 0 auto; align:center;">시작화면</a>
        </div>
      </form>
     
        
    </div>     
    
