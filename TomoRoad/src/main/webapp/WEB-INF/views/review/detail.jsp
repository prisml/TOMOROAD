<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on("click","#replyBtn",function(){
			var replyLi=$(this).parent().parent().parent();
			var parentNo=$(this).parent().attr("name");
			var content = '<form method="post" action="${pageContext.request.contextPath}/review/writeComment.do">';
			content += "<br><div>";
			content += '<p><textarea name="content" class="form-control" rows="4" cols="40"';
			content += 'id="comments" onfocus="if(this.value == \'Message\') { this.value = \'\'; }"';
			content += 'onblur="if(this.value == \'\') { this.value = \'Message\'; }"';
			content += 'placeholder=\'Message\'>Message</textarea></p>';
			content += '<input type="hidden" name="recomment" value="'+parentNo+'">';
			content += '<input type="hidden" name="reviewNo" value="${dvo.rvo.no }">'
			content += '<input id="writeReply" class="btn btn-default btn-lg" value="답글달기" type="submit">';
			content += ' <input id="cancleReply" class="btn btn-default btn-lg" value="취소" type="submit"></form>';
			replyLi.append(content);
		});
	});
</script>
	<div class="blog_single">
		<article class="post">
			<div class="post_date">
				<span class="day">${dvo.rvo.day }</span> <span class="month">${dvo.rvo.month }</span>
			</div>
			<div class="post_content">
				<div class="post_meta">
					<h2>
						<a href="#">${dvo.rvo.title }</a>
					</h2>
					<div class="metaInfo">
						<span><i class="fa fa-calendar"></i> <a href="#">${dvo.rvo.postedTime }</a>
						</span> <span><i class="fa fa-user"></i> By <a href="#">${dvo.rvo.member.name }</a>
						</span> <span><i class="fa fa-tag"></i> <a href="#">${dvo.rvo.place.name }</a>
						</span> <span><i class="fa fa-star"></i> <a href="#">${dvo.rvo.star }</a></span>
						<span><i class="fa fa-heart"></i> <a href="#">${dvo.rvo.recommend }</a></span>
					</div>
				</div>
				<figure class="post_img">
					<img src="${pageContext.request.contextPath}/resources/upload/review${dvo.rvo.no}_0" alt="blog post">
				</figure>
				<p>${dvo.rvo.content }</p>
				<c:if test="${mvo!=null}">
					<div class="serviceBox_2 red">
						<c:if test="${mvo!=null && mvo.id==dvo.rvo.member.id}">
							<a href="${pageContext.request.contextPath}/review/update_form.do?no=${dvo.rvo.no}"
								role="button" class="btn btn-default">수정</a>
						</c:if>
						<a href="${pageContext.request.contextPath}/review/recommend.do?no=${dvo.rvo.no}&id=${mvo.id}"
						role="button" class="btn btn-default">
							<c:choose>
								<c:when test="${dvo.recommend==null }">
									<i class="fa fa-heart-o"></i>
								</c:when>
								<c:otherwise>
									<i class="fa fa-heart"></i>
								</c:otherwise>
							</c:choose>
						</a>
	                </div>
				</c:if>
			</div>
		</article>
	</div>
	<!--News Comments-->
	<c:if test="${mvo!=null}">
		<div class="news_comments">
			<div class="dividerHeading">
				<h4>
					<span>댓글 목록</span>
				</h4>
			</div>
			<div id="comment">
				<ul id="comment-list">
					<c:if test="${dvo.comment[0]==null}">
						등록된 댓글이 없습니다.
					</c:if>
				</ul>
			</div>
			<script type="text/javascript">
			$(document).ready(function(){
				<c:forEach items="${dvo.comment }" var="cvo">
					var temp = '<li class="comment"><div class="avatar">';
					temp += '<img alt="" src="${cvo.member.profile}"' ;
					temp += 'class="avatar"></div>';
					temp += '<div class="comment-container"><h4 class="comment-author">	<a href="#">${cvo.member.name}</a></h4>';
					temp += '<div class="comment-meta"> <a href="#" class="comment-date link-style1">${cvo.postedTime}</a>';
					temp += '<div name="${cvo.no}" class="comment-reply-link"><a id="replyBtn"class="link-style3" href="#respond">답글달기</a> ';
					<c:if test="${mvo!=null && mvo.id==cvo.member.id}">
						temp += '<a id="deleteBtn" class="link-style3" href="#.">x</a>';
					</c:if>
					temp += '</div></div><div class="comment-body"><p>${cvo.content}</p></div></div><ul id="reply${cvo.no}" class="children"></ul></div></li>'
					$("#${cvo.recommentId}").append(temp);
				</c:forEach>
			});
			</script>
	
			<!-- /#comments -->
			<div class="dividerHeading">
				<h4>
					<span>댓글 작성</span>
				</h4>
			</div>
			<form method="post" action="${pageContext.request.contextPath}/review/writeComment.do">
				<div class="comment-box row">
					<div class="col-sm-12">
						<p>
							<textarea name="content" class="form-control" rows="6" cols="40"
								id="comments"
								onfocus="if(this.value == 'Message') { this.value = ''; }"
								onblur="if(this.value == '') { this.value = 'Message'; }"
								placeholder="Message">Message</textarea>
						</p>
					</div>
				</div>
				<input type="hidden" name="recomment" value="0">
				<input type="hidden" name="reviewNo" value="${dvo.rvo.no }">
				<div class="row">
					<div class="col-md-12">
						<input data-loading-text="Loading..." class="btn btn-default btn-lg"
							value="댓글 작성" type="submit">
					</div>
				</div>
			</form>
		</div>
	</c:if>