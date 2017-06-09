<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <a href = "${pageContext.request.contextPath}/mypage/showListByMember.do">작성한 리뷰보기</a><br>
    <a href = "${pageContext.request.contextPath}/mypage/friendList.do">친구 목록</a><br>
    <a href = "${pageContext.request.contextPath}/mypage/friend_RequestList.do">친구요청 목록</a><br>
    <a href = "${pageContext.request.contextPath}/mypage/update_form.do">회원수정</a><br>
    <a href = "${pageContext.request.contextPath}/mypage/deleteMember.do?id=${mvo.id}">회원탈퇴</a>