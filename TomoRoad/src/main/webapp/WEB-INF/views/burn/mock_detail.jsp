 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br><br><br><br>
 <script>
	$(document).ready(function(){
		$("#list").click(function(){
			location.href="${pageContext.request.contextPath}/getBurnList.do";
		});
		
		$("#update").click(function(){
			if(confirm("게시물을 수정하시겠습니까?"))
			location.href="${pageContext.request.contextPath}/updateBurnView.do?no=${bvo.no}";
		});
		
		$("#delete").click(function(){
			if(confirm("게시물을 삭제하시겠습니까?"))
			location.href="${pageContext.request.contextPath}/deleteBurn.do?no=${bvo.no}";
		});		
		
	});
</script>

<center>

<table border="1" cellpadding="15" width="600">
	<tr>
		<td>No</td><td>${bvo.no}</td>  <td>제목</td><td>${bvo.title}</td> <td>조회수</td><td>${bvo.hits}</td>		
	</tr>
	<tr>
		<td>역이름</td><td>${bvo.stationName}</td>  <td>작성시간</td><td>${bvo.postedTime}</td>
		<td>작성자</td><td>${bvo.memberId}</td>  
	</tr>
	<tr>
		<td colspan="6">${bvo.content}</td>
	</tr>
</table>
<br>
<table border="1" cellpading="15" width="600"> 
	<tr>
		<td><center>comments</center></td>
	</tr>
</table>
<br>
<script>
	$(document).ready(function(){
		$.ajax({
			type:"GET",
			url:"showBurnComment.do",
			data:"no=${bvo.no}",
			success:function(data){
				for(var z=0;z<data.length;z++){
						if("${mvo.id}"!=""){
						var comments="";//여기서 초기화해줌.
						comments += "<div id=re"+data[z].no+">";
						comments += "<table id=table"+data[z].no+" border=1 cellpadding=15 width=600>";
						comments += "<tr>";
						comments += "<td>"+data[z].no+"</td>";
						if(data[z].state=="comment"){
						comments += "<td>"+data[z].member_id+"</td>";
						comments += "<td id="+data[z].no+">"+data[z].posted_time+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button class=recommentBtn value=답글 id="+data[z].no+">";
						if("${mvo.id}"=="${bvo.memberId}"){
						comments += "<input type=button class=deleteCommentBtn value=삭제 id="+data[z].no+">";
						comments += "<input type=button class=updateCommentBtn value=수정 id="+data[z].no+">";
						}
						comments += "</td>";
						comments += "</tr>"
						comments += "<tr>"						 
						if(data[z].recomment!=0){
						comments += "<td colspan=3>"+data[z].recomment+"에게"+"<br>"+data[z].content+"</td>";
						}else{
						comments += "<td colspan=3>"+data[z].content+"</td>";
						}
						}else if(data[z].state=="delete"){
							comments +="<td>"+data[z].posted_time+"</td>"
							comments +="</tr>";
							comments +="<tr>";
							comments +="<td colspan=3>삭제된 댓글입니다.</td>";
							comments +="</tr>";
						}
						comments += "</tr>";
						comments += "</table>";
						comments += "<div id=ㅇㅇ>";
						comments += "</div>";						
						comments += "</div>";
						$("#re"+data[z].recomment).append(comments);
						}else{
						var comments =""; 
						comments += "<div>";
						comments += "<tr>";
						comments += "<td>";
						comments += "로그인을 하지 않아 댓글을 볼 수 없습니다."
						comments += "</td>";
						comments += "</tr>";
						comments += "</div>";
						$("#re0").html(comments);							
						}
				}//for
			}//success
		});//ajax
		$(document).on("click",".deleteCommentBtn",function(){
			var no=$(this).attr("id");
			var result = confirm("댓글을 삭제하시겠습니까?");
			if(result){
			location.href="${pageContext.request.contextPath}/deleteComment.do?no="+no+"&burn_no=${bvo.no}&member_id=${mvo.id}";
			}else{
				
			}
		});//deleteBtn
		$(document).on("click",".updateCommentBtn",function(){
			$(this).parent().parent().next().children().html("<input type=text id=content required=required><input type=button class=updateComment value=수정하기><input type=button class=updateCancleBtn value=취소하기>");
		});//updateCommentBtn
		$(document).on("click",".updateComment",function(){
			var content = document.getElementById("content").value; 
			var no=$(this).parent().parent().prev().children().next().next().attr("id");
			if(content==""){
				alert("수정할 내용을 입력해주세요!");
			}else{
				var result= confirm("댓글을 수정하시겠습니까?");
			if(result){
				location.href="${pageContext.request.contextPath}/updateComment.do?no="+no+"&burn_no=${bvo.no}&content="+content+"&member_id=${mvo.id}";
			}
			}
		});//updateComment
		$(document).on("click",".updateCancleBtn",function(){
			location.reload();
		});//updateCancle
		$(document).on("click",".recommentBtn",function(){;
			var no=$(this).attr("id");
			var commentbox ="<textarea id=commentbox"+no+" name=commentbox rows=3 style=width:530px; word-break: break-all;></textarea>"
			$("#table"+no).next().html(commentbox+"<br><input type=button value=답글달기 class=replyBtn id="+no+">"+"<input type=button id="+no+" value=취소 class=replyCancleBtn>");
		}); //답글달기 버튼
		$(document).on("click",".replyBtn",function(){
			var no=$(this).attr("id");
			var content=document.getElementById("commentbox"+no).value;
			location.href="${pageContext.request.contextPath}/replyComment.do?recomment="+no+"&burn_no=${bvo.no}&content="+content+"&member_id=${mvo.id}";
		}); //답글
		$(document).on("click",".replyCancleBtn",function(){
			var no=$(this).attr("id");
			$("#table"+no).next().html("");
		}); //답글달기취소
		$("#commentBtn").click(function(){
			var content=document.getElementById("commentbox").value;
			location.href="${pageContext.request.contextPath}/registeComment.do?content="+content+"&member_id=${mvo.id}&burn_no=${bvo.no}";
		});
	});//ready 
</script>
	<div id="re0">
	</div>
<br>
<c:if test="${mvo.id !=null }">
	<div>
		<textarea id="commentbox" name="commentbox" rows="3" style="width:600px; word-break: break-all;"></textarea>
		<br><input id="commentBtn" type="button" value="등록">
	</div>
	<br><br>
</c:if>	
<c:if test="${mvo.id==bvo.memberId}">
<br><br><br>
<input type="button" value="수정" id="update">
<input type="button" value="삭제" id="delete">
</c:if>
<input type="button" value="목록으로" id="list">

</center>