<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">

</script>
 
    <div class="col-lg-12 col-sm-12"> 
	
		        <div class="dividerHeading">
            <h4><span>안녕 관리자님</span></h4>
        </div>
        
	  <form method="post" action="${pageContext.request.contextPath}/noauth_managerLogin.do">
  <fieldset>
      <label for="id">아이디</label>
      <input type="text" name="id" id="id" autofocus required="required">
      <br>
      <label for="password">패스워드</label>
      <input type="password" name="password" id="password" required="required">
 	<br>
      <input type="submit" class="btn btn-default btn-lg button">
      </fieldset>
  </form>
  
        </div>