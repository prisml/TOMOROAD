<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- side nav -->
<script>
function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
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
    height: 50%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 10%;
    right: 0;
    background-color: LavenderBlush;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
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
    font-size: 36px;
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
    padding: 14px 16px;
    font-size: 17px;
    width: 50%;
}

.tablink:hover {
    background-color: red;
}

/* Style the tab content */
.tabcontent {
    color: white;
    display: none;
    padding: 50px;
    text-align: center;
}

#fList {background-color:pink;}
#mBox {background-color:salmon;}


</style>


<div id="mySidenav" class="sidenav">

 <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 	
 	<button class="tablink" onclick="openCity('fList', this, 'pink')" id="defaultOpen">친구</button>
	<button class="tablink" onclick="openCity('mBox', this, 'salmon')">쪽지</button>		

	<div id="fList" class="tabcontent">  		
  		<p style="word-break:break-all;">
  			친구리스트
  		</p>
	</div>

	<div id="mBox" class="tabcontent">  		
  		<p style="word-break:break-all;">
  			쪽지함
  		</p> 
	</div>
	
	
</div>

<script>	
	$(document).ready(function(){
		
		/* if(${!empty mvo}){
		$.ajax({
			type:"get",
			url :"isNewMsg.do",
			data:"receiver=${mvo.id}",
			success: function(data){				
				if(data!=0){
					$("#mm").css("background-color","red");
				}
			}			
		});
		} */
	});

</script>

<span style="font-size:30px;cursor:pointer" onclick="openNav()"><i id="mm" class="fa fa-envelope-o"></i></span>

