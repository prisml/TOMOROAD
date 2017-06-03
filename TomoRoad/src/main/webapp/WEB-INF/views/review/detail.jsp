<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<div class="blog_single">
		<article class="post">
			<figure class="post_img">
				<a href="#"> <img src="images/blog/blog_1.png" alt="blog post">
				</a>
			</figure>
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
						</span> <span><i class="fa fa-user"></i> By <a href="#">${mvo.name }</a>
						</span> <span><i class="fa fa-tag"></i> <a href="#">${mvo.place.name }</a>
						</span> <span><i class="fa fa-comments"></i> <a href="#">${commentCount }
								Comments</a></span>
					</div>
				</div>
				<p>${mvo.content }</p>
			</div>
			<ul class="shares">
				<li class="shareslabel"><h3>Share This Story</h3></li>
				<li><a class="twitter" href="#" data-placement="bottom"
					data-toggle="tooltip" title="Twitter"></a></li>
				<li><a class="facebook" href="#" data-placement="bottom"
					data-toggle="tooltip" title="Facebook"></a></li>
				<li><a class="gplus" href="#" data-placement="bottom"
					data-toggle="tooltip" title="Google Plus"></a></li>
				<li><a class="pinterest" href="#" data-placement="bottom"
					data-toggle="tooltip" title="Pinterest"></a></li>
				<li><a class="yahoo" href="#" data-placement="bottom"
					data-toggle="tooltip" title="Yahoo"></a></li>
				<li><a class="linkedin" href="#" data-placement="bottom"
					data-toggle="tooltip" title="LinkedIn"></a></li>
			</ul>
		</article>
		<div class="about_author">
			<div class="author_desc">
				<img src="images/blog/author.png" alt="about author">
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
						<img alt="" src="images/blog/avatar_1.png" class="avatar">
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
</div>