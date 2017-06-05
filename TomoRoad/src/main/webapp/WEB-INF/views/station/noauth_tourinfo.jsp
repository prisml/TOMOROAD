<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
역 정보 및 역 주변 관광지를 보여주는 페이지

<div class="col-lg-12 isotope">
	<!--begin portfolio filter -->
	<ul id="filter">
		<li data-filter="*" class="selected"><a href="#">All</a></li>
		<li data-filter=".responsive"><a href="#">수도권</a></li>
		<li data-filter=".mobile"><a href="#">관동 지방</a></li>
		<li data-filter=".branding"><a href="#">충청 지방</a></li>
		<li data-filter=".branding"><a href="#">호남 지방</a></li>
		<li data-filter=".branding"><a href="#">영남 지방</a></li>
	</ul>

	<!--begin portfolio_list -->
	<ul id="list" class="portfolio_list clearfix  isotope" style="position: relative; overflow: hidden; height: 894.563px;">
		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 isotope-item" style="position: absolute; left: 0px; top: 0px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/Seoul.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/local/Seoul.png"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>S e o u l</h5>
					<p>서울</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 mobile isotope-item"  style="position: absolute; left: 380px; top: 0px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/Busan.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/search-icon.png" class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>B u s a n</h5>
					<p>부산</p>
				</figcaption>
				
			</figure>
		</li>

		<!--begin List Item -->
		<li	class="list_item col-lg-4 col-md-6 col-sm-6 responsive isotope-item" style="position: absolute; left: 760px; top: 0px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/Daegu.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/local/Daegu.png"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>D a e g u</h5>
					<p>대구</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 branding isotope-item" style="position: absolute; left: 0px; top: 298px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/Ulsan.png" alt="">

				<div class="option">
					<a href="portfolio_single.html">
					<i class="fa fa-link"></i></a>
					<a href="${pageContext.request.contextPath}/resources/images/local/Ulsan.png" class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>U l s a n</h5>
					<p>울산</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 isotope-item" style="position: absolute; left: 380px; top: 298px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/GwangJu.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/local/GwangJu.png"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>G w a n g J u</h5>
					<p>광주</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 mobile isotope-item" style="position: absolute; left: 760px; top: 298px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/JeJu.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="${pageContext.request.contextPath}/resources/images/local/JeJu.png"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>J E J U</h5>
					<p>제주</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 responsive isotope-item" style="position: absolute; left: 0px; top: 596px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/JeJu.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="images/portfolio/full/portfolio_7.jpg"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>Retina Ready</h5>
					<p>Responsive</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 branding isotope-item" style="position: absolute; left: 380px; top: 596px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/JeJu.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="images/portfolio/full/portfolio_8.jpg"	class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>Boxed Layout</h5>
					<p>Branding</p>
				</figcaption>
			</figure>
		</li>

		<!--begin List Item -->
		<li class="list_item col-lg-4 col-md-6 col-sm-6 branding isotope-item" style="position: absolute; left: 760px; top: 596px;">
			<figure class="touching effect-bubba">
				<img src="${pageContext.request.contextPath}/resources/images/local/JeJu.png" alt="">

				<div class="option">
					<a href="portfolio_single.html" class="fa fa-link"></a>
					<a href="images/portfolio/full/portfolio_1.jpg" class="fa fa-search mfp-image"></a>
				</div>
				
				<figcaption>
					<h5>Touch and Swipe</h5>
					<p>Technology</p>
				</figcaption>
			</figure>
		</li>
		
	</ul>
</div>