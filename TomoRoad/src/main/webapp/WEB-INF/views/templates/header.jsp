<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                                <li><a href="#">HOME</a></li>
                                <li><a href="#">INTRODUCTION</a></li>
                                <li>
                                    <div class="site-name">
                                        <h1>TOMOROAD</h1>
                                    </div>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/getBurnList.do">BURNING</a></li>
                                <li><a href="#">REVIEW</a></li>
                                <li><a href="#">MYPAGE</a></li>
                            </ul>
                        </div><!--/.nav-collapse -->
                </div>
            </div>
            </div>
        </div>
<script>
	$(document).ready(function(){
		$(".logo").click(function(){
			alert(1);
		});
		$(".site-name").click(function(){
			alert(2);
		});
	});
</script>