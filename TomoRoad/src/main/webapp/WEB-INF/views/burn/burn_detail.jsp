

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {  // 게시물 버튼 
						$("#golist").click(function() {
											location.href = "${pageContext.request.contextPath}/getBurnList.do";
										});

						$("#update").click(function() {
											if (confirm("게시물을 수정하시겠습니까?")){
												location.href = "${pageContext.request.contextPath}/updateBurnView.do?no=${bvo.no}";
											}
										});

						$("#delete").click(function() {
											if (confirm("게시물을 삭제하시겠습니까?")){
												location.href = "${pageContext.request.contextPath}/deleteBurn.do?no=${bvo.no}";
											}
										});
					});
</script>
<script>
	$(document).ready(function() {
						$.ajax({
									type : "GET",
									url : "showBurnComment.do",
									data : "no=${bvo.no}",
									success : function(data) {
										if(data.length==0){
											$("#comment-list").html("등록된 댓글이 없습니다");
											return false;
										}
										for (var z = 0; z < data.length; z++) {

											if (${!empty mvo}) { // 로그인 되있으면
												var comments = "";//여기서 초기화해줌.		

												if (data[z].state == "comment") { 
													
													if (data[z].recomment != 0) { //대댓글일 경우																									   
															comments += "<ul class='children'>";
															comments += "<li class='comment' id=re"+ data[z].no +" name="+data[z].no+">";
															comments += "<div class='avatar'><img alt='' class='avatar' src="+data[z].profile+"></div>";
															comments += "<div class='comment-container'>";
															comments += "<h4 class='comment-author'>"+ data[z].member_id + "</h4>";
															comments += "<div class='comment-meta'>"+ data[z].posted_time + "</div>";
															comments += "<div class='comment-body'> <br> <p> "+ data[z].content + "</p> </div><br>";
															comments += "<div id='buttons'>";
															comments += "<button id='recommentBtn' class='btn btn-sm btn-social-stumbleupon' style='width:70px; background-color:LightSalmon;' name="+ data[z].no +">답답글</button>&nbsp;";
															
														
													}else { // 본댓글일 경우
														comments += "<li class='comment' id=re"+ data[z].no +" name="+data[z].no+">";
														comments += "<div class='avatar'><img alt='' class='avatar' src="+data[z].profile+"></div>";
														comments += "<div class='comment-container'>";
														comments += "<h4 class='comment-author'>"+ data[z].member_id + "</h4>";
														comments += "<div class='comment-meta'>"+ data[z].posted_time	+ "</div>";
														comments += "<div class='comment-body'> <p>"+ data[z].content + "</p> </div>";
														comments += "<br>";
														comments += "<div id='buttons'>";
														comments += "<button id='recommentBtn' class='btn btn-sm btn-social-stumbleupon' style='width:70px; background-color:LightSalmon;' name="+ data[z].no +">답글</button>&nbsp;";
													}
																										
														
													if ("${mvo.id}" == data[z].member_id) { // 자기 댓글일 경우														
														comments += "<button class='btn btn-sm btn-social-stumbleupon' style='width:70px; background-color:LightSalmon;' id='deleteCommentBtn' name="+ data[z].no +">삭제</button>&nbsp;";
														comments += "<button class='btn btn-sm btn-social-stumbleupon' style='width:70px; background-color:LightSalmon;' id='updateCommentBtn' name="+ data[z].no +">수정</button>";														
													}													
													
													comments += "</div>"; // buttons
												
												} else if(data[z].state=="delete"){ // 삭제된 댓글일 경우
													comments += "<li class='comment' id=re"+ data[z].no +">";
													comments += "<div class='comment-container'>";													
													comments += "<div class='comment-meta'>"+ data[z].posted_time	+ "</div>";
													comments += "<div class='comment-body'> <p> 삭제된 댓글입니다 </p> </div>";
												}

												
												comments += "<div></div>"; // 답답글 textarea 출력부
												
												comments += "</div>"; //comment-container													
												comments += "</li>"; // comment
												comments += "</ul>"; // children
												
												if (data[z].recomment != 0) { 
													$("#re" + data[z].recomment).append(comments);
												}else{
													$("#comment-list").append(comments);
												}
												
												comments += "</li>"; // comment
											} //if
										} //for
									} //success
								}); //ajax
					
						
								$(document).on("click","#deleteCommentBtn",function(){
									var no=$(this).attr("name");
									var result = confirm("댓글을 삭제하시겠습니까?");
									if(result){
									location.href="${pageContext.request.contextPath}/deleteComment.do?no="+no+"&burn_no=${bvo.no}&member_id=${mvo.id}";
									}
								});// 댓글 삭제 버튼 클릭 시
								
								$(document).on("click","#updateCommentBtn",function(){
									var cont = $(this).parent().parent().children(".comment-body").text();									
									$(this).parent().parent().children(".comment-body").html("<textarea id=updateText rows=2 style='width:400px; word-break:break-all;'>" + cont + "</textarea><br><button id='updateComment' class='btn btn-sm btn-social-stumbleupon' style='background-color:Plum; height:25px; width:70px; font-size:11px;'>수정하기</button>&nbsp;<button id='updateCancelBtn' class='btn btn-sm btn-social-stumbleupon' style='background-color:Plum; height:25px; width:70px; font-size:11px;'>취소하기</button>");
									$(this).parent().next().empty();	
								});// 댓글 수정 버튼 클릭시 
								
								$(document).on("click","#updateComment",function(){									
									var content = $(this).parent().children("#updateText"); 
									var no=$(this).parent().parent().parent().attr("name");
									if($.trim(content.val())==""){
										alert("수정할 내용을 입력해주세요!");
										content.focus();
									}else{
										var result= confirm("댓글을 수정하시겠습니까?");
									if(result){
										location.href="${pageContext.request.contextPath}/updateComment.do?no="+no+"&burn_no=${bvo.no}&content="+content.val()+"&member_id=${mvo.id}";
									}
									} 
								});// 댓글 수정하기 버튼 클릭 시
								
								$(document).on("click","#updateCancelBtn",function(){
									location.reload();
								});// 댓글 수정 취소 버튼 클릭 시								
								
								$(document).on("click","#recommentBtn",function(){
									var no=$(this).attr("name");
									var commentbox ="<br><textarea id=commentbox"+no+" name=commentbox rows=3 style=width:400px; word-break: break-all;></textarea>"
									$(this).parent().next().html(commentbox+"<br><button class='btn btn-sm btn-social-stumbleupon' style='background-color:Plum; height:25px; width:70px; font-size:11px;' id=replyBtn name="+no+">답글달기</button>"+"<button class='btn btn-sm btn-social-stumbleupon' style='background-color:Plum; height:25px; width:70px; font-size:11px;' id=replyCancelBtn name="+no+">취소</button>");
								}); //답글 버튼 클릭시
								
								$(document).on("click","#replyBtn",function(){
									var no=$(this).attr("name");
									var content=$("#commentbox"+no);
									if($.trim(content.val())==""){
										alert("답글 내용을 입력해주세요!");
										content.focus();
									}else{
										var recontent="<strong>To. "+$(this).parent().parent().children(".comment-author").text()+"   </strong>"+content.val();
										location.href="${pageContext.request.contextPath}/replyComment.do?recomment="+no+"&burn_no=${bvo.no}&content="+recontent+"&member_id=${mvo.id}&profile=${mvo.profile}";
									}
								}); //답글달기-버튼 클릭 시 
								
								$(document).on("click","#replyCancelBtn",function(){
									var no=$(this).attr("name");
									$(this).parent().html("");
								}); //답글달기-취소 클릭 시
								
								
								
								$("#commentBtn").click(function(){
									var content=$("#commentbox");
									if($.trim(content.val())==""){
										alert("댓글 내용을 입력해주세요!");
										content.focus();
									}else{										
										location.href="${pageContext.request.contextPath}/registeComment.do?content="+content.val()+"&member_id=${mvo.id}&burn_no=${bvo.no}&profile=${mvo.profile}";
									}
								}); // Post Comment 버튼 클릭 시
							
			
						
					});//ready
					
</script>

<br>

	<div class="blog_single">
		<article class="post">
			<div class="post_date">
				<span class="month">No</span> <span class="day"> ${bvo.no} </span>
			</div>
			<div class="post_content">
				<div class="post_meta">
					<h2>${bvo.title}</h2>
					<div class="metaInfo">
						<span><i class="fa fa-calendar"></i> <a href="#.">${bvo.postedTime} </a> </span> 
						<span><i class="fa fa-user"></i> By <a href="#."> ${bvo.memberId} </a> </span> 
						<span><i class="fa fa-tag"></i>		<a href="#."> ${bvo.stationName} </a> </span>
						<span><i class="fa fa-comments"></i> <a href="#."> ${bvo.commentCount} </a></span> 
						<span><i class="fa fa-eye"></i> <a href="#."> ${bvo.hits} </a></span>
					</div>
				</div>
				<p>${bvo.content}</p>
			</div>
		</article>
	</div>

	<div align="center">
		<span>
		<c:if test="${mvo.id==bvo.memberId}">
			<button id="update" class="btn btn-sm btn-social-stumbleupon" style="width: 100px">수정</button>
			<button id="delete" class="btn btn-sm btn-social-pinterest"	style="width: 100px">삭제</button>
		</c:if>
			<button id="golist" class="btn btn-sm btn-social-pinterest" style="width: 100px; background-color: #FFCC00">목록으로</button>
		</span>	
	</div>

	<!--News Comments-->
	<div class="news_comments">
		<div class="dividerHeading">
			<h4>
				<span> 댓글 (${bvo.commentCount}) </span>
			</h4>
		</div>
		<div id="comment">
			<ul id="comment-list">  <!-- 댓글 출력부 -->
			
			</ul>
		</div>
		<c:if test="${mvo.id !=null }">
		<!-- /#comments -->
		<div class="dividerHeading">
			<h4>
				<span> 댓글 작성 </span>
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
			<button class="btn btn-lg btn-default" id="commentBtn" style="font-size:12px;">
			댓글 등록하기
			</button>
		</c:if>
	</div>



