<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  <script>
	$(document).ready(function(){
		$("#updateMember").click(function(){
			if(confirm("게시물을 수정하시겠습니까?"))
		});
		
		$("#deleteMember").click(function(){
			if(confirm("게시물을 삭제하시겠습니까?"))
		});		
		
	});
</script> -->
<%--     <div>
                <br>
                <br>
                <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/member/update_form.do" style="width: 500px; height: 50px; margin: 0 auto; align:center;" id="updateMember">UPDATE</a>
            <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/deleteMember.do?id=${mvo.id}" style="width: 500px; height: 50px; margin: 0 auto; align:center;" id="deleteMember">RESIGN</a>
            <br>
            <a  class="btn btn-primary btn-lg btn-block" type="button" href="${pageContext.request.contextPath}/friendList.do?id=${sessionScope.mvo.id}" style="width: 500px; height: 50px; margin: 0 auto; align:center;" >FRIENDS SEARCH</a>
            <br>
    </div> --%>
    <a href = "${pageContext.request.contextPath}/mypage/a.do">a</a><br>
    <a href = "${pageContext.request.contextPath}/mypage/b.do">b</a><br>
    <a href = "${pageContext.request.contextPath}/mypage/c.do">c</a>

