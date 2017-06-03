<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<div class="blog_medium">
	<c:if test="${mvo!=null }">
		<a href="${pageContext.request.contextPath}/review/register_form.do"
			role="button" class="btn">register</a></c:if>
		<c:forEach items="${reviewList.list}" var="rlist">
			<article class="post">
				<div class="post_date">
					<span class="day">28</span> <span class="month">Nov</span>
				</div>
				<figure class="post_img">
					<a href="#"> <img src="images/blog/blog_medium_1.png"
						alt="blog post">
					</a>
				</figure>
				<div class="post_content">
					<div class="post_meta">
						<h2>
							<a
								href="${pageContext.request.contextPath}/review/detailHit.do?no=${rlist.no}">${rlist.title }</a>
						</h2>
						<div class="metaInfo">
							<span><i class="fa fa-user"></i> By <a href="#">${rlist.member.name }</a>
							</span> <span><i class="fa fa-comments"></i> <a href="#">12
									Comments</a></span>
						</div>
					</div>
					<p>${rlist.content }</p>
					<a class="btn btn-small btn-default"
						href="${pageContext.request.contextPath}/review/detailHit.do?no=${rlist.no}">Read
						More</a>

				</div>
			</article>
		</c:forEach>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12">
		<ul class="pagination pull-left mrgt-0">
			<li><a href="#">«</a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">»</a></li>
		</ul>
	</div>
</div>

<div class="featured-blocks">
	<div class="container">
	</div>
</div>