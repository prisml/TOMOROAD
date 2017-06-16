<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
var key = "asd";
var input = "";
	  $(document).keypress(function(e) {
		  if (e.which !== 0) {
		        input += String.fromCharCode(e.which);
		        if(key.length == input.length && key == input)
		        	$("#dialog-form").dialog();
		          else if(key.length == input.length && key != input)
		        	key = "";  
		        
		    }
	  });
</script>

    <div class="col-lg-12 col-sm-12"> 
	
		        <div class="dividerHeading">
            <h4><span>안녕 관리자님╹◡╹)ﾉ</span></h4>
        </div>
        
	  <form method="post" action="${pageContext.request.contextPath}/noauth_managerLogin.do">
  <fieldset>
      <label for="id">아이디</label>
      <input type="text" name="id" id="id" required="required">
      <br>
      <label for="password">패스워드</label>
      <input type="password" name="password" id="password" required="required">
 
      <input type="submit" class="btn btn-default btn-lg button">
      </fieldset>
  </form>
  

        
            <!-- <data-role="page" data-dialog="true"> -->
<div id="dialog-form" title="관리자모드" style= "display: none; position: relative; visibility: visible;">

</div> 
        </div>