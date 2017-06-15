<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <a href= "${pageContext.request.contextPath}/mypage/showListByMember.do"><span style = "font-size:22px">작성한 리뷰보기</span></a><br>
    <a href= "${pageContext.request.contextPath}/mypage/showListByMember2.do"><span style = "font-size:22px">작성한 리뷰보기2x</span></a><br>
    <a href = "${pageContext.request.contextPath}/mypage/friendList.do"><span style = "font-size:22px">친구 목록</span></a><br>
    <a href = "${pageContext.request.contextPath}/mypage/friend_RequestList.do"><span style = "font-size:22px">친구요청 목록</span></a><br>
    <a href = "${pageContext.request.contextPath}/mypage/friend_BlockList.do"><span style = "font-size:22px">차단친구 목록</span></a><br>
    <a href = "${pageContext.request.contextPath}/mypage/update_form.do"><span style = "font-size:22px">회원수정</span></a><br>
    
<%--     
	회원탈퇴 기능(미정)
	<a href = "${pageContext.request.contextPath}/deleteMember.do?id=${mvo.id}"><span style = "font-size:22px">회원탈퇴</span></a><br>
 --%>