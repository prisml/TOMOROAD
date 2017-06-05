

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document)
			.ready(
					function() {
						$("#golist")
								.click(
										function() {
											location.href = "${pageContext.request.contextPath}/getBurnList.do";
										});

						$("#update")
								.click(
										function() {
											if (confirm("게시물을 수정하시겠습니까?"))
												location.href = "${pageContext.request.contextPath}/updateBurnView.do?no=${bvo.no}";
										});

						$("#delete")
								.click(
										function() {
											if (confirm("게시물을 삭제하시겠습니까?"))
												location.href = "${pageContext.request.contextPath}/deleteBurn.do?no=${bvo.no}";
										});

					});
</script>
<script>
	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "GET",
									url : "showBurnComment.do",
									data : "no=${bvo.no}",
									success : function(data) {
										if(${empty mvo}){
											$("#re0").html("로그인 후 댓글 확인이 가능합니다");
											return false;
										}
										if(data.length==0){
											$("#re0").html("등록된 댓글이 없습니다");
											return false;
										}
										for (var z = 0; z < data.length; z++) {
											if ("${mvo.id}" != "") { // 로그인 되있으면
												var comments = "";//여기서 초기화해줌.															
												
												if (data[z].state == "comment") { 
													
													if (data[z].recomment != 0) {																									   
															comments += "<li class='children' id=re"+ data[z].no +">";
															comments += "<div class='avatar'></div>"
															comments += "<div class='comment-container'><i class='fa fa-arrow-right'></i>";
															comments += "<h4 class='comment-author'>"+ data[z].member_id + "</h4>";
															comments += "<div class='comment-meta'>"+ data[z].posted_time	+ "</div>";
															comments += "<div class='comment-body'> <p> 대댓글 임네다"+ data[z].content + "</p> </div><br>";																		
														
													} else {
														comments += "<li class='comment' id=re"+ data[z].no +">";
														comments += "<div class='avatar'><img alt='' src='images/blog/avatar_2.png' class='avatar'></div>";
														comments += "<div class='comment-container'>";
														comments += "<h4 class='comment-author'>"+ data[z].member_id + "</h4>";
														comments += "<div class='comment-meta'>"+ data[z].posted_time	+ "</div>";
														comments += "<div class='comment-body'> <p>"+ data[z].content + "</p> </div>";
														comments += "<br>";
														comments += "<a href='#' id='recommentBtn' class='btn btn-sm btn-social-stumbleupon' style='width:70px; background-color:LightSalmon;' name="+ data[z].no +">답글</a>";
													}
													
													//comments += "<br>";
													//comments += "<a href='#' id='recommentBtn' class='btn btn-sm btn-social-stumbleupon' style='width:70px; background-color:LightSalmon;'>답글</a>";
													
													if ("${mvo.id}" == "${bvo.memberId}") { // 자기 댓글일 경우														
														comments += "<a href='#' class='btn btn-sm btn-social-stumbleupon' style='width:70px; background-color:LightSalmon;' id='deleteCommentBtn' name="+ data[z].no +">삭제</a>";
														comments += "<a href='#' class='btn btn-sm btn-social-stumbleupon' style='width:70px; background-color:LightSalmon;' id='updateCommentBtn' name="+ data[z].no +">수정</a>";														
													}
													
													/* comments += "</div>"; //comment-container													
													comments += "</li>"; // children 또는 comment */
													
												
												} else if(data[z].state=="delete"){
													comments += "<li class='comment' id=re"+ data[z].no +">";
													comments += "<div class='comment-container'>";													
													comments += "<div class='comment-meta'>"+ data[z].posted_time	+ "</div>";
													comments += "<div class='comment-body'> <p> 삭제된 댓글입니다 </p> </div>";
												}
												
												comments += "<div></div>"
												
												comments += "</div>"; //comment-container													
												comments += "</li>"; // children 또는 comment
												
												$("#re" + data[z].recomment).append(comments);
											}
										}//for
									}//success
								});//ajax
					
						
								$(document).on("click","#deleteCommentBtn",function(){
									var no=$(this).attr("name");
									var result = confirm("댓글을 삭제하시겠습니까?");
									if(result){
									location.href="${pageContext.request.contextPath}/deleteComment.do?no="+no+"&burn_no=${bvo.no}&member_id=${mvo.id}";
									}else{
										
									}
								});//deleteBtn
								
								$(document).on("click","#updateCommentBtn",function(){
									$(this).parent().parent().next().children().html("<input type=text id=content required=required><input type=button class=updateComment value=수정하기><input type=button class=updateCancleBtn value=취소하기>");
								});//updateCommentBtn
								
								$(document).on("click","#updateComment",function(){
									var content = document.getElementById("content").value; 
									var no=$(this).parent().parent().prev().children().next().next().attr("name");
									if(content==""){
										alert("수정할 내용을 입력해주세요!");
									}else{
										var result= confirm("댓글을 수정하시겠습니까?");
									if(result){
										location.href="${pageContext.request.contextPath}/updateComment.do?no="+no+"&burn_no=${bvo.no}&content="+content+"&member_id=${mvo.id}";
									}
									}
								});//updateComment
								
								$(document).on("click","#updateCancleBtn",function(){
									location.reload();
								});//updateCancle
								
								
								$(document).on("click","#recommentBtn",function(){
									var no=$(this).attr("name");
									var commentbox ="<textarea id=commentbox"+no+" name=commentbox rows=3 style=width:400px; word-break: break-all;></textarea>"
									$(this).next().next().next().html("<div>"+commentbox+"<br><input type=button value=답글달기 class=replyBtn id="+no+">"+"<input type=button id="+no+" value=취소 class=replyCancleBtn></div>");
								}); //답글달기 버튼
								
								$(document).on("click","#replyBtn",function(){
									var no=$(this).attr("name");
									var content=document.getElementById("commentbox"+no).value;
									location.href="${pageContext.request.contextPath}/replyComment.do?recomment="+no+"&burn_no=${bvo.no}&content="+content+"&member_id=${mvo.id}";
								}); //답글
								
								$(document).on("click","#replyCancleBtn",function(){
									var no=$(this).attr("name");
									$("#table"+no).next().html("");
								}); //답글달기취소
								
								$("#commentBtn").click(function(){
									var content=document.getElementById("commentbox").value;
									location.href="${pageContext.request.contextPath}/registeComment.do?content="+content+"&member_id=${mvo.id}&burn_no=${bvo.no}";
								});
							
			
						
					});//ready
					
</script>

<br>
<%-- <c:if test="${mvo.id !=null }">
	<div>
		<textarea id="commentbox" name="commentbox" rows="3" style="width:600px; word-break: break-all;"></textarea>
		<br><input id="commentBtn" type="button" value="등록">
	</div>
	<br><br>
</c:if>	 --%>

<!-- 

        <section id="page_head" class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="page_title">
                    <h2> Burn Board </h2>
                    <span class="sub_heading"> Burn your Passion </span>
                </div>
                <nav id="breadcrumbs">
                    <ul>
                        <li>You are here:</li>
                        <li><a href="home.do">Home</a></li>
                        <li>Burn Board</li>
                    </ul>
                </nav>
            </div>
        </section> -->

	<div class="blog_single">
		<article class="post">
			<div class="post_date">
				<span class="month">No</span> <span class="day"> ${bvo.no} </span>
			</div>
			<div class="post_content">
				<div class="post_meta">
					<h2>${bvo.title}</h2>
					<div class="metaInfo">
						<span><i class="fa fa-calendar"></i> <a href="#">${bvo.postedTime} </a> </span> 
						<span><i class="fa fa-user"></i> By <a href="#"> ${bvo.memberId} </a> </span> 
						<span><i class="fa fa-tag"></i>		<a href="#"> ${bvo.stationName} </a> </span> 
						<span><i class="fa fa-comments"></i> <a href="#"> ${bvo.hits} </a></span>
					</div>
				</div>
				<p>${bvo.content}</p>
			</div>
		</article>
	</div>

	<div align="center">
		<span>
		<c:if test="${mvo.id==bvo.memberId}">
			<a href="#" id="update" class="btn btn-sm btn-social-stumbleupon" style="width: 100px">UPDATE</a>
			<a href="#" id="delete" class="btn btn-sm btn-social-pinterest"	style="width: 100px">DELETE</a>
		</c:if>
			<a href="#" id="golist" class="btn btn-sm btn-social-pinterest" style="width: 100px; background-color: #FFD700">LIST</a>
		</span>	
	</div>

	<!--News Comments-->
	<div class="news_comments">
		<div class="dividerHeading">
			<h4>
				<span> Comments </span>
			</h4>
		</div>
		<div id="comment">
			<ul id="re0">
				
					<!-- <ul class="children">
                                            <li class="comment">
                                                <div class="avatar"><img alt="" src="images/blog/avatar_3.png" class="avatar"></div>
                                                <div class="comment-container">
                                                    <h4 class="comment-author"><a href="#">Thomas Smith</a></span></h4>
                                                    <div class="comment-meta"><a href="#" class="comment-date link-style1">February 14, 2015</a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div>
                                                    <div class="comment-body">
                                                        <p>Labores pertinax theophrastus vim an. Error ditas in sea, per no omnis iisque nonumes. Est an dicam option, ad quis iriure saperet nec, ignota causae inciderint ex vix. Iisque qualisque imp duo eu, pro reque consequ untur. No vero laudem legere pri, error denique vis ne, duo iusto bonorum.</p>
                                                    </div>
                                                </div>
                                                <ul class="children">
                                                    <li class="comment">
                                                        <div class="avatar"><img alt="" src="images/blog/avatar_2.png" class="avatar"></div>
                                                        <div class="comment-container">
                                                            <h4 class="comment-author"><a href="#">Eva Smith</a></span></h4>
                                                            <div class="comment-meta"><a href="#" class="comment-date link-style1">February 14, 2015</a><a class="comment-reply-link link-style3" href="#respond">Reply &raquo;</a></div>
                                                            <div class="comment-body">
                                                                <p>Dico animal vis cu, sed no aliquam appellantur, et exerci eleifend eos. Vixese eros tiloi novum adtam, mazim inimicus maiestatis ad vim. Ex his unum fuisset reformidans, has iriure ornatus atomorum ut, ad tation feugiat impedit per.</p>
                                                            </div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul> -->
				
			</ul>
		</div>
		<c:if test="${mvo.id !=null }">
		<!-- /#comments -->
		<div class="dividerHeading">
			<h4>
				<span>Leave a comment</span>
			</h4>
		</div>
		<div class="comment-box row">
			<div class="col-sm-12">
				<p>
					<textarea name="comments" class="form-control" rows="3" cols="40"
						id="commentbox" placeholder="댓글을 입력해주세요"></textarea>
				</p>
			</div>
		</div>
			<a class="btn btn-lg btn-default" href="#" id="commentBtn">Post
				Comment</a>
		</c:if>
	</div>



