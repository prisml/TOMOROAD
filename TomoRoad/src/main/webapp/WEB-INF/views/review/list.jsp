<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="dividerHeading">
            <h4><span>일지 목록</span></h4>
        </div>
        <br>
<c:if test="${mvo!=null }">
	<a class="btn btn-small btn-default"
		href="${pageContext.request.contextPath}/review/register_form.do">일지작성</a>
</c:if>
<br><br>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<div class="blog_medium">
		<c:forEach items="${reviewList.list}" var="rlist">
			<article class="post">
				<div class="post_date">
					<span class="day">${rlist.day }</span> 
					<span class="month">${rlist.month }</span>
				</div>
				<figure class="post_img">
					<a href="${pageContext.request.contextPath}/review/noauth_detailHit.do?no=${rlist.no}"> 
						<img src="${pageContext.request.contextPath}/resources/upload/review${rlist.no}_0" alt="blog post" style="width:212px; height:212px;">
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
							<span><i class="fa fa-dot-circle-o"></i> <a href="#.">${rlist.hits } HITS</a></span>
							<span><i class="fa fa-heart"></i>${rlist.recommend } Recommend</span>
						</div>
					</div>
					<p>${rlist.subContent }</p>
					<a class="btn btn-small btn-default"
						href="${pageContext.request.contextPath}/review/noauth_detailHit.do?no=${rlist.no}">Read
						More</a>
				</div>
			</article>
		</c:forEach>
	</div>
	
	<c:set var="pb" value="${reviewList.pagingBean}" />
	<div class="col-lg-12 col-md-12 col-sm-12  text-center">
		<ul class="pagination">
			<c:if test="${pb.previousPageGroup == true }">
				<li><a
					href="${pageContext.request.contextPath}/review/noauth_showList.do?page=${pb.startPageOfPageGroup-1}">
					«</a></li>
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
				<a href="${pageContext.request.contextPath}/review/noauth_showList.do?page=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${pb.nextPageGroup == true }">
				<li><a
					href="${pageContext.request.contextPath}/review/noauth_showList.do?page=${pb.endPageOfPageGroup+1}">
					»</a></li>
			</c:if>
		</ul>
	</div>
</div>

<div class="featured-blocks">
	<div class="container"></div>
</div>