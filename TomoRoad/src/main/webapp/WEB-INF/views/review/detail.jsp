<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="featured-heading">
	<div class="container">

		<ul class="grid effect-3" id="grid">

			<li class="span10">
				<div class="row-fluid">
					<div class="block">
						<img src="img/img1.png" alt="">
						<h1>제목 : ${rvo.title }</h1>
						<p>내용 : ${rvo.content }</p>
						<p>게시 날짜 : ${rvo.postedTime }</p>
						<p>작성자 : ${rvo.member.name }</p>
						<p>HITS : ${rvo.hits}</p>
					</div>
				</div>

			</li>

		</ul>
		<a href="${pageContext.request.contextPath}/review/update_form.do?no=${rvo.no}"></a>
	</div>
</div>