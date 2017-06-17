<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
주변관광지
<!--지역 목록 -->
<ul id="list" class="portfolio_list clearfix isotope" style="position: relative; overflow: hidden; height: 894.563px;">
 	<c:forEach items="${getReviewListByPlace}" var="list">
		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 isotope-item" style="">
			<figure class="touching effect-bubba">
				<!-- 해당 리뷰에 등록된 이미지를 썸네일로 쓴다. -->
				<img src="${pageContext.request.contextPath}/resources/upload/review${list.no}_0" alt="">

				<div class="option">
					<a href="${pageContext.request.contextPath}/review/noauth_detail.do?no=${list.no}" class="fa fa-link"></a>
				</div>
				
				<figcaption>
					<h5>${list.title}</h5>
					<p>추천수 : ${list.recommend}&nbsp;&nbsp;작성자 : ${list.member.id}</p>
				</figcaption>
			</figure>
		</li>
	</c:forEach>
</ul>