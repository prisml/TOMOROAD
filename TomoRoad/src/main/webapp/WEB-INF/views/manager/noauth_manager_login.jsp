<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $("#memberButton").click(function(){
        $("#listMember").animate({
            height: 'toggle'           	
        });
    });	
});
</script> 
 
    <div class="col-lg-12 col-sm-12"> 
	
		        <div class="dividerHeading">
            <h4><span>관리자님 로그인</span></h4>
        </div>
         <br>
        <button id="memberButton" class="btn btn-default btn-lg button" >로그인</button> 
        <br>
	  <form id="listMember" method="post" action="${pageContext.request.contextPath}/noauth_managerLogin.do" style="display: none;">
  <fieldset>
       		<div class="input-group" align="center">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <input type="text" class="form-control" name="id"  id="id" placeholder="아이디" autofocus required="required" style="font-size: 16px; margin: 0 auto; align:center;">
            	</div>
            	<br>
            	<div class="input-group" align="center">
                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                    <input type="password" class="form-control" name="password" placeholder="비밀번호" required="required" style="font-size: 16px; margin: 0 auto; align:center;">
                </div>
                <br>
                  <div class="form-group" align="center">
                <button type="submit" class="btn btn-default btn-lg button" style="width: 400px; height: 40px; margin: 0 auto; align:center;">로그인</button>
            </div>
      </fieldset>
  </form>
  
        </div>