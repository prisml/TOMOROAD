<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
주변관광지

<!--지역 목록 -->
<ul id="list" class="portfolio_list clearfix isotope" style="position: relative; overflow: hidden; height: 894.563px;">
 	<c:forEach items="${getReviewListByPlace}" var="vo">
		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 ${vo.section} isotope-item" style="">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/place/symbol/${vo.img}.png" alt="">

				<div class="option">
					<a href="${pageContext.request.contextPath}/station/getDetailInfo.do?name=${vo.name}" class="fa fa-link"></a>
				</div>
				
				<figcaption>
					<h5>${vo.title}</h5>
					<p>추천수 : ${vo.recommend}&nbsp;&nbsp;작성자 : ${vo.memver_id}</p>
				</figcaption>
			</figure>
		</li>
	</c:forEach>
</ul>