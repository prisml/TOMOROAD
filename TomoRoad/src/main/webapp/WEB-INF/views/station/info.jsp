<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
${param.id}

<!-- 사진영역 -->
<div class="col-lg-12 col-md-12 col-sm-12">
	<div class="porDetCarousel">
		
		<!--사진-->
		<div class="carousel-content">
			<img class="carousel-item" src="images/portfolio/portfolio_slider1.jpg" alt=" style="display: none;">
			<img class="carousel-item active" src="images/portfolio/portfolio_slider2.jpg" alt="" style="display: block;">
			<img class="carousel-item" src="images/portfolio/portfolio_slider3.jpg" alt="" style="display: none;">
		</div>
		
		<!-- 화살표 -->
		<div class="carousel-control">
			<div class="carousel-prev"></div>
			<div class="carousel-next"></div>
			<ul class="carousel-pagination"><!-- 아래에 바(어떤 사진으로 하느냐에 따라 active가 바뀜 -->
				<li class=""></li>
				<li class="active"></li>
				<li class=""></li>
			</ul>
		</div>
		
	</div>
</div>

<!-- 게시판 설명영역(가로전체)-->
<div class="row sub_content">

	<!-- 게시판 글만 딱 써있는 부분 -->
	<div class="col-lg-8 col-md-8 col-sm-8">
		<div class="project_description">
			<div class="widget_title"><!-- 제목 -->
				<h4>
					<span>서울역</span>
				</h4>
			</div>
			
			<!-- 내용 -->
			<p>주소 : 서울특별시 용산구 한강대로 405 서울역</p>
			<p>전화번호 : 1544-7788</p>
		</div>
	</div>

<!-- 이부분 뭐여?
	<div class="col-lg-4 col-md-4 col-sm-4">
		<div class="project_details">
			<div class="widget_title">
				<h4>
					<span>Project Details</span>
				</h4>
			</div>
			<ul class="details">
				<li><span>Client :</span>Louis</li>
				<li><span>Company :</span> Rain Technologies inc.</li>
				<li><span>Category :</span> Web Design, Photography</li>
				<li><span>Date :</span> 05 September 2015</li>
				<li><span>Project URL :</span> <a href="#">www.bestjquery.com</a></li>
			</ul>
		</div>
	</div> -->
</div>

<section class="latest_work row sub_content">
	<div class="col-md-12">
		<div class="dividerHeading">
			<h4>
				<span>Recent Work</span>
			</h4>
		</div>

		<div id="recent-work-slider" class="owl-carousel owl-theme"
			style="opacity: 1; display: block;">
			<div class="owl-wrapper-outer">
				<div class="owl-wrapper"
					style="width: 3840px; left: 0px; display: block;">
					<div class="owl-item" style="width: 240px;">
						<div class="box">
							<figure class="touching effect-bubba">
								<img src="images/portfolio/portfolio_1.jpg" alt=""
									class="img-responsive">

								<div class="option">
									<a href="portfolio_single.html" class="fa fa-link"></a> <a
										href="images/portfolio/full/portfolio_1.jpg"
										class="fa fa-search mfp-image"></a>
								</div>
								<figcaption class="item-description">
									<h5>Touch and Swipe</h5>
									<p>Technology</p>
								</figcaption>
							</figure>
						</div>
					</div>
					<div class="owl-item" style="width: 240px;">
						<div class="box">
							<figure class="touching effect-bubba">
								<img src="images/portfolio/portfolio_2.jpg" alt=""
									class="img-responsive">

								<div class="option">
									<a href="portfolio_single.html" class="fa fa-link"></a>
									<a href="images/portfolio/full/portfolio_2.jpg" class="fa fa-search mfp-image"></a>
								</div>
								<figcaption class="item-description">
									<h5>fully responsive</h5>
									<p>Mobile</p>
								</figcaption>
							</figure>
						</div>
					</div>
					<div class="owl-item" style="width: 240px;">
						<div class="box">
							<figure class="touching effect-bubba">
								<img src="images/portfolio/portfolio_3.jpg" alt=""
									class="img-responsive">

								<div class="option">
									<a href="portfolio_single.html" class="fa fa-link"></a> <a
										href="images/portfolio/full/portfolio_3.jpg"
										class="fa fa-search mfp-image"></a>
								</div>
								<figcaption class="item-description">
									<h5>Retina Ready</h5>
									<p>Responsive</p>
								</figcaption>
							</figure>
						</div>
					</div>
					<div class="owl-item" style="width: 240px;">
						<div class="box">
							<figure class="touching effect-bubba">
								<img src="images/portfolio/portfolio_4.jpg" alt=""
									class="img-responsive">

								<div class="option">
									<a href="portfolio_single.html" class="fa fa-link"></a> <a
										href="images/portfolio/full/portfolio_4.jpg"
										class="fa fa-search mfp-image"></a>
								</div>
								<figcaption class="item-description">
									<h5>Boxed Layout</h5>
									<p>Branding</p>
								</figcaption>
							</figure>
						</div>
					</div>
					<div class="owl-item" style="width: 240px;">
						<div class="box">
							<figure class="touching effect-bubba">
								<img src="images/portfolio/portfolio_5.jpg" alt=""
									class="img-responsive">

								<div class="option">
									<a href="portfolio_single.html" class="fa fa-link"></a> <a
										href="images/portfolio/full/portfolio_5.jpg"
										class="fa fa-search mfp-image"></a>
								</div>
								<figcaption class="item-description">
									<h5>Touch and Swipe</h5>
									<p>Technology</p>
								</figcaption>
							</figure>
						</div>
					</div>
					<div class="owl-item" style="width: 240px;">
						<div class="box">
							<figure class="touching effect-bubba">
								<img src="images/portfolio/portfolio_6.jpg" alt=""
									class="img-responsive">

								<div class="option">
									<a href="portfolio_single.html" class="fa fa-link"></a> <a
										href="images/portfolio/full/portfolio_6.jpg"
										class="fa fa-search mfp-image"></a>
								</div>
								<figcaption class="item-description">
									<h5>fully responsive</h5>
									<p>Mobile</p>
								</figcaption>
							</figure>
						</div>
					</div>
					<div class="owl-item" style="width: 240px;">
						<div class="box">
							<figure class="touching effect-bubba">
								<img src="images/portfolio/portfolio_7.jpg" alt=""
									class="img-responsive">

								<div class="option">
									<a href="portfolio_single.html" class="fa fa-link"></a> <a
										href="images/portfolio/full/portfolio_7.jpg"
										class="fa fa-search mfp-image"></a>
								</div>
								<figcaption class="item-description">
									<h5>Retina Ready</h5>
									<p>Responsive</p>
								</figcaption>
							</figure>
						</div>
					</div>
					<div class="owl-item" style="width: 240px;">
						<div class="box">
							<figure class="touching effect-bubba">
								<img src="images/portfolio/portfolio_8.jpg" alt=""
									class="img-responsive">

								<div class="option">
									<a href="portfolio_single.html" class="fa fa-link"></a> <a
										href="images/portfolio/full/portfolio_8.jpg"
										class="fa fa-search mfp-image"></a>
								</div>
								<figcaption class="item-description">
									<h5>Boxed Layout</h5>
									<p>Branding</p>
								</figcaption>
							</figure>
						</div>
					</div>
				</div>
			</div>
			<div class="owl-controls clickable">
				<div class="owl-buttons">
					<div class="owl-prev"></div>
					<div class="owl-next"></div>
				</div>
			</div>
		</div>
	</div>
</section>
