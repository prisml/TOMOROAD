<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <% MemberVO vo=(MemberVO)session.getAttribute("mvo"); 
	System.out.println(vo);
	if(vo!=null){
%> --%>
    <div>
                <br>
                <br>
                <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/member/update_form.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;" >UPDATE</a>
            <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/member/delete_result.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;" >RESIGN</a>

    </div>
<%-- <%}else{ %>
		<script type="text/javascript">l
			alert("로그인하세요!");
			location.href="${pageContext.request.contextPath}/login.do";
		</script>
<%} %> --%>
</body>
</html>