<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

역 정보 및 역 주변 관광지를 보여주는 페이지


<div class="col-lg-12 isotope">
	<!--begin portfolio filter -->
	<ul id="filter">
		<li data-filter="*" class="selected"><a href="#">All</a></li>
		<li data-filter=".Capital"><a href="#">수도권</a></li>
		<li data-filter=".Gwandong"><a href="#">관동 지방</a></li>
		<li data-filter=".Chungcheong"><a href="#">충청 지방</a></li>
		<li data-filter=".Honam"><a href="#">호남 지방</a></li>
		<li data-filter=".Youngnam"><a href="#">영남 지방</a></li>
	</ul>

	<!--begin portfolio_list -->
	<ul id="list" class="portfolio_list clearfix isotope" style="position: relative; overflow: hidden; height: 894.563px;">
	 	<c:forEach items="${getTourInfoList}" var="vo">
			<!--begin List Item -->
			<li class="list_item col-lg-4 col-md-6 col-sm-6 ${vo.section} isotope-item" style="">
				<figure class="touching effect-bubba">
					<img src="${pageContext.request.contextPath}/resources/images/symbol/${vo.img}.png" alt="">
	
					<div class="option">
						<a href="${pageContext.request.contextPath}/station/info.do" class="fa fa-link"></a>
						<a href="${pageContext.request.contextPath}/resources/images/symbol/${vo.img}.png" class="fa fa-search mfp-image"></a>
					</div>
					
					<figcaption>
						<h5>${vo.name}</h5>
						<p>${vo.simpleDetail}</p>
					</figcaption>
				</figure>
			</li>
		</c:forEach>
	</ul>
</div>