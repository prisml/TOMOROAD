<%@page import="org.kosta.tomoroad.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>Insert title here</title>
 <script>
	$(document).ready(function(){
		$("#updateMember").click(function(){
			if(confirm("게시물을 수정하시겠습니까?"))
		});
		
		$("#deleteMember").click(function(){
			if(confirm("게시물을 삭제하시겠습니까?"))
		});		
		
	});
</script>
</head>
<body>
<c:choose>
<c:when test="${sessionScope.mvo!=null}">
    <div>
                <br>
                <br>
                <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/member/update_form.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;" id="updateMember">UPDATE</a>
            <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/deleteMember.do?id=${mvo.id}" style="width: 500px; height: 50px; margin: 0 auto; align:center;" id="deleteMember">RESIGN</a>
            <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/friendList.do?id=${sessionScope.mvo.id}" style="width: 500px; height: 50px; margin: 0 auto; align:center;" >FRIENDS SEARCH</a>
            <br>
    </div>
    </c:when>
<c:otherwise>
		<script type="text/javascript">
		alert("로그인 하세요!");
		location.href="${pageContext.request.contextPath}/login.do";
		</script>		
</c:otherwise>
</c:choose>
</body>
