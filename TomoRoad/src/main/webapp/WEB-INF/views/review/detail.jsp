<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="blog_single">
		<article class="post">
			<div class="post_date">
				<span class="day">28</span> <span class="month">Nov</span>
			</div>
			<div class="post_content">
				<div class="post_meta">
					<h2>
						<a href="#">${rvo.title }</a>
					</h2>
					<div class="metaInfo">
						<span><i class="fa fa-calendar"></i> <a href="#">${rvo.postedTime }</a>
						</span> <span><i class="fa fa-user"></i> By <a href="#">${rvo.member.name }</a>
						</span> <span><i class="fa fa-tag"></i> <a href="#">${rvo.place.name }</a>
						</span> <span><i class="fa fa-star"></i> <a href="#">${rvo.star }</a></span>
					</div>
				</div>
				<figure class="post_img">
					<img src="${pageContext.request.contextPath}/resources/images/blog/blog_1.png" alt="blog post">
				</figure>
				<p>${rvo.content }</p>
				<c:if test="${mvo!=null && mvo.id==rvo.member.id}">
					<a href="${pageContext.request.contextPath}/review/update_form.do?no=${rvo.no}"
						role="button" class="btn btn-default">update</a>
				</c:if>
				<c:if test="${mvo!=null}">
					<a href="${pageContext.request.contextPath}/review/recommend.do?no=${rvo.no}&id=${mvo.id}"
						role="button" class="btn btn-default">recommend</a>
				</c:if>
			</div>
		</article>
		<div class="about_author">
			<div class="author_desc">
				<img src="${pageContext.request.contextPath}/resources/images/blog/author.png" alt="about author">
				<ul class="author_social">
					<li><a class="fb" href="#." data-placement="top"
						data-toggle="tooltip" title="Facbook"><i
							class="fa fa-facebook"></i></a></li>
					<li><a class="twtr" href="#." data-placement="top"
						data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
					<li><a class="skype" href="#." data-placement="top"
						data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!--News Comments-->
	<div class="news_comments">
		<div class="dividerHeading">
			<h4>
				<span>Comments</span>
			</h4>
		</div>
		<div id="comment">
			<ul id="comment-list">
				<li class="comment">
					<div class="avatar">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/blog/avatar_1.png" class="avatar">
					</div>
					<div class="comment-container">
						<h4 class="comment-author">
							<a href="#">John Smith</a>
						</h4>
						<div class="comment-meta">
							<a href="#" class="comment-date link-style1">February 22,
								2015</a><a class="comment-reply-link link-style3" href="#respond">Reply
								»</a>
						</div>
						<div class="comment-body">
							<p>Ne omnis saperet docendi nec, eos ea alii molestiae
								aliquand. Latine fuisset mele, mandamus atrioque eu mea, wi
								forensib argumentum vim an. Te viderer conceptam sed, mea et
								delenit fabellas probat.</p>
						</div>
					</div>
				</li>
			</ul>
		</div>

		<!-- /#comments -->
		<div class="dividerHeading">
			<h4>
				<span>Leave a comment</span>
			</h4>
		</div>
		<div class="comment-box row">
			<div class="col-sm-12">
				<p>
					<textarea name="comments" class="form-control" rows="6" cols="40"
						id="comments"
						onfocus="if(this.value == 'Message') { this.value = ''; }"
						onblur="if(this.value == '') { this.value = 'Message'; }"
						placeholder="Message">Message</textarea>
				</p>
			</div>
		</div>

		<a class="btn btn-lg btn-default" href="#">Post Comment</a>
	</div>