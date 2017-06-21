<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- side nav -->
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    $("#messageicon").css("color","black");
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
</script>
<script>
	$(document).ready(function(){
		 $(document).mousedown(function(e) {
	         $('#mySidenav').each(function() {
	            if ($(this).css('display') == 'block') {
	               var l_position = $(this).offset();
	               l_position.right = parseInt(l_position.left)+ ($(this).width());
	               l_position.bottom = parseInt(l_position.top)+ parseInt($(this).height())+40;
	               if ((l_position.left <= e.pageX && e.pageX <= l_position.right)&& (l_position.top <= e.pageY && e.pageY <= l_position.bottom)) {
	               		
	               } else {	                 
	                  closeNav();
	               }
	            }
	         });
	      });
	      
	});
</script>



<!-- tab header -->
<script>
function openCity(cityName,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(cityName).style.display = "block";
    elmnt.style.backgroundColor = color;
}
// Get the element with id="defaultOpen" and click on it
//document.getElementById("defaultOpen").click();
</script>


<!-- side nav -->
<style>
body {
    font-family: "Lato", sans-serif;
}

.sidenav {
    height: 55%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 10%;
    right: 0;
    background-color: LavenderBlush;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 40px;
}

.sidenav a {	
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 5px;
    font-size: 40px;
    margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>


<!-- tab header -->
<style>
body {font-family: "Lato", sans-serif;}

.tablink {
    background-color: mediumorchid;
    color: white;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 10px 16px;
    font-size: 17px;
    /* width: 45%; */ 
}

.tablink:hover {
    background-color: red;
}

/* Style the tab content */
.tabcontent {
    color: white;
    display: none;
    padding: 15px;
    /* text-align: center; */
}

#fList {background-color:pink;}
#mBox {background-color:salmon;}


</style>


<!-- <script>	
	

</script> -->
<script>
	$(document).ready(function(){
			
			 if(${!empty mvo}){ // 새 메세지 확인
				$.ajax({
					type:"get",
					url :"isNewMsg.do",
					data:"receiver=${mvo.id}",
					success: function(data){						
						if(data!=0){
							$("#messageicon").css("color","red");
						}
					}			
				});
			}
		
		
		$("#searchicon").click(function(){	// 사람 검색시
			var mlist = "";
			var target = $("#searchbox").val();
			$.ajax({
				type :"get",
				url : "burn/findId.do",
				data:"id="+target+"&searcher=${sessionScope.mvo.id}",
				success: function(data){
					for(var i=0; i<data.length; i++){
						mlist += "<a href='#.' class=mm>"+data[i]+"</a><br>";
					}
					$("#mlist").html(mlist);					
				}			
			}); // ajax				
		}); //click
	});

</script>

<script>
$(document).ready(function(){
	var receiver = "";

	$(document).on("click",".mm",function(){ // 검색 후 아이디 클릭시
		receiver = $(this).text();		
		//$("#messagesOpen").trigger("click");
		openCity('mBox', this, 'salmon');
		
		var messages = "";
		
		$.ajax({
			type :"post",
			url : "getMessageList.do",
			data : "sender=${mvo.id}&receiver="+receiver,
			success : function(data){
				for(var i=0; i<data.length; i++){
					if(data[i].sender == "${mvo.id}"){
						messages += "<br><div style='text-align:left;'><strong>";
						messages += data[i].sender+"</strong>";
						messages += "<br><span style='background-color:blue;'>";
						messages += data[i].text;
						messages += "</span><br>"+data[i].time+"</div>";
					}else{
						messages += "<br><div style='text-align:right; margin-right:5px;'><strong>";
						messages += data[i].sender+"</strong>";
						messages += "<br><span style='background-color:green;'>";
						messages += data[i].text;
						messages += "</span><br>"+data[i].time+"</div>";						
					}											
				}
				$("#messageList").html(messages);
				$("#messageList").scrollTop($("#messageList")[0].scrollHeight);
			}
		});		
		
	});
	
	$("#messagesOpen").click(function(){ // 쪽지함 클릭시
		var rm = "";

		$.ajax({
			type:"post",
			url :"getFilteredMessage.do",
			data : "id=${mvo.id}",
			dataType : "json",
			success : function(data){
				rm += "<table>";	
				for(var i = data.length-1; i>=0; i--){							
				rm += "<tr style='border-top:1px solid;'><td width='250px;' class='user'>"+data[i].sender+"</td></tr>";								
				rm += "<tr style='border-bottom:1px solid;'><td>"+data[i].time+"</td></tr>";				
				}
				rm += "</table>";
				$("#messageList").html(rm); 
			}		
		});
	});
	
	
	$(document).on("click",".user",function(){ // 쪽지 함에서 아이디 클릭 시
		receiver = $(this).text();
		var messages = "";
		$.ajax({
			type :"post",
			url : "getMessageList.do",
			data : "sender=${mvo.id}&receiver="+receiver,
			success : function(data){
				for(var i=0; i<data.length; i++){
					if(data[i].sender == "${mvo.id}"){
						messages += "<br><div style='text-align:left;'><strong>";
						messages += data[i].sender+"</strong>";
						messages += "<br><span style='background-color:blue;'>";
						messages += data[i].text;
						messages += "</span><br>"+data[i].time+"</div>";
					}else{
						messages += "<br><div style='text-align:right; margin-right:5px;'><strong>";
						messages += data[i].sender+"</strong>";
						messages += "<br><span style='background-color:green;'>";
						messages += data[i].text;
						messages += "</span><br>"+data[i].time+"</div>";						
					}											
				}
				$("#messageList").html(messages);
				$("#messageList").scrollTop($("#messageList")[0].scrollHeight);
				$("#inputDiv").css("display","block");
			}
		});	
	});
	
	
	$(document).on("click","#sendMessage",function(){ // 개별 창에서 전송클릭시
		var text = $(this).prev().val();
		
		if($.trim(text)==""){
			alert("내용을 입력해 주세요!")
			$(this).prev().focus();
			return false;
		}
			
		$(this).prev().val("");		
		
		var messages = "";
		
		$.ajax({
			type: "post",
			url : "sendMessage.do",
			data : "sender=${mvo.id}&receiver="+receiver+"&text="+text,
			success : function(data){
				for(var i=0; i<data.length; i++){
					if(data[i].sender == "${mvo.id}"){
						messages += "<br><div style='text-align:left;'><strong>";
						messages += data[i].sender+"</strong>";
						messages += "<br><span style='background-color:blue;'>";
						messages += data[i].text;
						messages += "</span><br>"+data[i].time+"</div>";
					}else{
						messages += "<br><div style='text-align:right;'><strong>";
						messages += data[i].sender+"</strong>";
						messages += "<br><span style='background-color:green;'>";
						messages += data[i].text;
						messages += "</span><br>"+data[i].time+"</div>";						
					}											
				}
				$("#messageList").html(messages);
				$("#messageList").scrollTop($("#messageList")[0].scrollHeight);
			}
		});		
	});
	
	
});
</script>



<span style="font-size:30px;cursor:pointer" onclick="openNav()"><i id="messageicon" class="fa fa-envelope-o"></i></span>



<div id="mySidenav" class="sidenav" style="overflow-y:hidden;">

 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 	<div>
 	<button class="tablink" onclick="openCity('fList', this, 'pink')" id="defaultOpen" style="width:36.7%;"> 사람 찾기 </button>
	<button class="tablink" onclick="openCity('mBox', this, 'salmon')" style="width:36.7%;" id="messagesOpen">쪽지</button>		
	</div>
	
	
	<div id="fList" class="tabcontent" style="width:95%; height:100%; text-align: left; ">	
		<br><br>	 		
  		<input type="text" style="color:black; width:80%;" id="searchbox">&nbsp;<i class="fa fa-search" id="searchicon"></i>
  		<br><br>  		
  		<div id="mlist" style="width:100%;  overflow-y: auto; overflow-x:hidden; max-height:260px;">  		
  		</div>  	
	</div>
	

	<div id="mBox" class="tabcontent" style="width:100%; height:100%; text-align:left;">
		<br><br>  		
  		<jsp:include page="message_page.jsp"/>  		  		 
	</div>
	
	
</div>

