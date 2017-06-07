<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-lg-8 col-md-8 col-sm-8">
	<div class="dividerHeading">
		<h4>
			<span>글 수정</span>
		</h4>
	</div>

	<div class="alert alert-success hidden alert-dismissable"
		id="contactSuccess">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">×</button>
		<strong>Success!</strong> Your message has been sent to us.
	</div>

	<div class="alert alert-error hidden" id="contactError">
		<button type="button" class="close" data-dismiss="alert"
			aria-hidden="true">×</button>
		<strong>Error!</strong> There was an error sending your message.
	</div>

	<form method="post" id="contactForm"
		action="${pageContext.request.contextPath}/review/update.do"
		novalidate="novalidate">
		<input type="hidden" name="no" value="${dvo.rvo.no }">
		<div class="row">
			<div class="form-group">
				<div class="col-lg-6 ">
					<input id="name" name="title" class="form-control" maxlength="100"
						data-msg-required="Please enter title." value="${dvo.rvo.title }"
						placeholder="Title" type="text">
				</div>
				<div class="col-lg-6 ">
					<select name="placeNo" class="from-control">
						<c:forEach items="${dvo.placeList}" var="pvo">
							<option value="${pvo.no }">${pvo.name }</option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-md-6">
					<input id="subject" name="picture" class="form-control"
						maxlength="100" data-msg-required="Please input your picture."
						value="" placeholder="사진등록" type="text">
				</div>
				<div class="col-md-6">
					<input id="subject" name="star" class="form-control"
						maxlength="100"
						value="${dvo.rvo.star }" placeholder="별점" type="number" max="5" min="0">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group">
				<div class="col-md-12">
					<textarea id="message" class="form-control" name="content"
						rows="10" cols="50" data-msg-required="Please enter your content."
						maxlength="5000" placeholder="Content">${dvo.rvo.content }</textarea>

				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<input data-loading-text="Loading..." class="btn btn-default btn-lg"
					value="Update" type="submit">
			</div>
		</div>
	</form>
</div>
<div class="col-lg-4 col-md-4 col-sm-4">
	<div class="sidebar">
		<div class="widget_info">
			<div class="dividerHeading">
				<h4>
					<span>Contact Info</span>
				</h4>
			</div>
			<p>Lorem ipsum dolor sit amet, consectetur adip, sed do eiusmod
				tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
				veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
				ea commodo consequat.</p>
			<ul class="widget_info_contact">
				<li><i class="fa fa-map-marker"></i>
					<p>
						<strong>Address</strong>: #2021 Lorem Ipsum
					</p></li>
				<li><i class="fa fa-user"></i>
					<p>
						<strong>Phone</strong>:(+91) 9000-12345
					</p></li>
				<li><i class="fa fa-envelope"></i>
					<p>
						<strong>Email</strong>: <a href="#">mail@example.com</a>
					</p></li>
				<li><i class="fa fa-globe"></i>
					<p>
						<strong>Web</strong>: <a href="#" data-placement="bottom"
							data-toggle="tooltip" title="www.example.com">www.example.com</a>
					</p></li>
			</ul>

		</div>

		<div class="widget_social">
			<div class="dividerHeading">
				<h4>
					<span>Get Social</span>
				</h4>
			</div>
			<ul class="widget_social">
				<li><a class="fb" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Facbook"><i class="fa fa-facebook"></i></a></li>
				<li><a class="twtr" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter"></i></a></li>
				<li><a class="gmail" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Google"><i
						class="fa fa-google-plus"></i></a></li>
				<li><a class="dribbble" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Dribbble"><i
						class="fa fa-dribbble"></i></a></li>
				<li><a class="skype" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
				<li><a class="pinterest" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Pinterest"><i
						class="fa fa-pinterest"></i></a></li>
				<li><a class="instagram" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Instagram"><i
						class="fa fa-instagram"></i></a></li>
				<li><a class="youtube" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Youtube"><i class="fa fa-youtube"></i></a></li>
				<li><a class="linkedin" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Linkedin"><i
						class="fa fa-linkedin"></i></a></li>
				<li><a class="flickrs" href="#." data-placement="bottom"
					data-toggle="tooltip" title="Flickr"><i class="fa fa-flickr"></i></a></li>
				<li><a class="rss" href="#." data-placement="bottom"
					data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
			</ul>
		</div>
	</div>
</div>