<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br><br><br><br>

<center>

<table border="1" cellpadding="15" width="600">
	<tr>
		<td>No</td><td>${bvo.no}</td>  <td>제목</td><td colspan="3">${bvo.title}</td>		
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
						comments += "<td>"+data[z].member_id+"</td>";
						comments += "<td>"+data[z].posted_time+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=button id=recommentBtn value=답글>";
						if("${mvo.id}"=="${bvo.memberId}"){
						comments += "<input type=button id=deleteCommentBtn value=삭제>";
						}
						comments += "</td>";
						comments += "</tr>"
						comments += "<tr>"						 
						if(data[z].recomment!=0){
						comments += "<td colspan=3>"+data[z].recomment+"에게"+"<br>"+data[z].content+"</td>";
						}else{
						comments += "<td colspan=3>"+data[z].content+"</td>";
						}
						comments += "</tr>";
						comments += "</table>";
						comments += "</div>";
						$("#re"+data[z].recomment).append(comments);
						}else{
						var comments =""; 
						comments += "<table>";
						comments += "<tr>";
						comments += "<td>";
						comments += "로그인을 하지 않아 댓글을 볼 수 없습니다."
						comments += "</td>";
						comments += "</tr>";
						comments += "</table>";
						$("#re0").html(comments);							
						}
				}//for
			}//success
		});//ajax
	});//ready 
</script>
	<div id="re0">
	</div>
<br>
<c:if test="${mvo.id !=null }">
	<div>
		<textarea id="commentbox" name="commentbox" rows="3" style="width:600px; word-break: break-all;"></textarea>
		<br><input type="button" value="등록">
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
