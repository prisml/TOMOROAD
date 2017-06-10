<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <c:if test="${mvo!=null }">
	<a class="btn btn-small btn-default"
		href="${pageContext.request.contextPath}/review/register_form.do">Register</a>
</c:if> --%>
	<div class="blog_medium content">
	<div class="row">
		<div class="dividerHeading">
			<h4>
				<span> 작성한 리뷰보기 </span>
			</h4>
		</div>
		<c:forEach items="${reviewList.list}" var="rlist">
			<article class="post">
				<div class="post_date">
					<span class="day">${rlist.day }</span> <span class="month">${rlist.month }</span>
				</div>
				<figure class="post_img">
					<a href="#"> <img
						src="${pageContext.request.contextPath}/resources/images/blog/blog_medium_1.png"
						alt="blog post">
					</a>
				</figure>
				<div class="post_content">
					<div class="post_meta">
						<h2>
							<a
								href="${pageContext.request.contextPath}/review/noauth_detailHit.do?no=${rlist.no}">${rlist.title }</a>
						</h2>
						<div class="metaInfo">
							<span><i class="fa fa-user"></i> By <a href="#">${rlist.member.name }</a>
							</span> <span><i class="fa fa-map-marker"></i> <a href="#.">${rlist.place.name }</a></span>
							<span><i class="fa fa-dot-circle-o"></i> <a href="#">${rlist.hits } HITS</a></span>
							<span><i class="fa fa-heart"></i>${rlist.recommend } Recommend</span>
						</div>
					</div>
					<p>${rlist.content }</p>
					<a class="btn btn-danger"
						href="${pageContext.request.contextPath}/review/noauth_detailHit.do?no=${rlist.no}">Read
						More</a>
				</div>
			</article>
		</c:forEach>
	</div>
	
	<c:set var="pb" value="${reviewList.pagingBean}" />
		<ul class="pagination pull-left mrgt-0">
			<c:if test="${pb.previousPageGroup == true }">
				<li><a
					href="${pageContext.request.contextPath}/mypage/showList.do?page=${pb.startPageOfPageGroup-1}">«</a></li>
			</c:if>
			<c:forEach begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}" var="i">
				<c:choose>
					<c:when test="${pb.nowPage == i }">
						<li class="active">
					</c:when>
					<c:otherwise>
						<li>
					</c:otherwise>
				</c:choose>
				<a href="${pageContext.request.contextPath}/mypage/showList.do?page=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pb.nextPageGroup == true }">
				<li><a
					href="${pageContext.request.contextPath}/mypage/showList.do?page=${pb.endPageOfPageGroup+1}">»</a></li>
			</c:if>
		</ul>
	</div>
