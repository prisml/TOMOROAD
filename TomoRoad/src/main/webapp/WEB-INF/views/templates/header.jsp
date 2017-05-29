<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="header-wrapper">
            <div class="container">
                <div class="logo">
                    <h1>TOMOROAD</h1>
                </div>
            <div class="menu">
                <div class="navbar">
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">☰</a>
                        <div class="nav-collapse collapse">
                            <ul class="nav">
                                <li><a href="${pageContext.request.contextPath}/home.do">HOME</a></li>
                                <li><a href="#">INTRODUCTION</a></li>
                                <li>
                                    <div class="site-name">
                                        <h1>TOMOROAD</h1>
                                    </div>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/getBurnList.do">BURNING</a></li>
                                <li><a href="${pageContext.request.contextPath}/review/showList.do">REVIEW</a></li>
                                <li><a href="#">MYPAGE</a></li>
                              	
                              	<c:choose>
                              		<c:when test="${empty mvo}">
                                		<li><a id="login">LogIn</a></li>
                              		</c:when>
                              		<c:otherwise>
                                		<li><a id="logout">LogOut</a></li>
                                	</c:otherwise>									                                                     
                              	</c:choose>
                              	
                            </ul>
                        </div><!--/.nav-collapse -->
                </div>
            </div>
            </div>
        </div>
<script>
	$(document).ready(function(){
		$(".logo").click(function(){
			location.href="${pageContext.request.contextPath}/home.do";
		});
		$(".site-name").click(function(){
			location.href="${pageContext.request.contextPath}/home.do";
		});
		
		$("#login").click(function(){
			location.href="${pageContext.request.contextPath}/member/login.do";
		});
		$("#logout").click(function(){
			location.href="${pageContext.request.contextPath}/logout.do";
		});	
		
	});
</script>