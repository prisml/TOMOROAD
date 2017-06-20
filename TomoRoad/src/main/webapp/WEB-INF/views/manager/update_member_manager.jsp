<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<div class="col-lg-12 col-sm-12"> 
	
	 <div class="dividerHeading" >
            <h4><span>수정 해주세요╹◡╹)ﾉ</span></h4>
        </div>
        
      <form method="post" action="${pageContext.request.contextPath}/updateMemberByManager.do" id="updateForm" onsubmit="return samePw()">      
        <div class="form-group">

            <div align="center">
               아이디:<input type="text" class="form-control" name="id"  value="${mmvo.id}" readonly required="required"
               style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">
              <span id="idCheckView"></span>
            </div>
            
            <br>
            <div align="center">
                비밀번호:<input type="password" class="form-control" name="password" id="password" value="${mmvo.password}" required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">
            </div>
            
			<br>
		    <div align="center">
               <input type="text" class="form-control" name="name"  id="name" value="${mmvo.name}" required="required" 
               style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">
            </div>  
            
            <br>
            <div align="center">
                    <label>성별</label>
					<br>
                                <label>
                      <%--   <c:choose>
                                <c:when test="${mmvo.sex=='여자'}">
                                 <input type="radio" name="sex"  id="sex" value="여자" placeholder="여자" required="required" checked="checked">여자
                                </c:when>
                                <c:when test="${mmvo.sex=='남자'}">
                                <input type="radio" name="sex"  id="sex" value="남자" placeholder="남자" required="required" checked="checked">남자
                                </c:when>
                                </c:choose> --%>
                                <input type="text"   class="form-control"  value="${mmvo.sex}" readonly>  
                                <br>
                                   <input type="radio" name="sex"  id="sex" value="여자" placeholder="여자" required="required">여자
                                    &nbsp;&nbsp;
                                    <input type="radio" name="sex"  id="sex" value="남자" placeholder="남자" required="required">남자 
                                </label>
                </div> 
                
            <br>
			<div align="center">
                연락처:<input type="text" class="form-control" name="tel"  id="tel" value="${mmvo.tel}" required="required" 
                style="width: 250px; height: 50px; margin: 0 auto; align:center; font-size: 16px;">
            </div>            
            <br> 
            <br><br>
            <div class="form-group" align="center">
            <input class="btn btn-danger" type="submit" style="width: 500px; height: 35px; margin: 0 auto; align:center;" value="수정">
           </div>
            <div class="form-group" align="center">
            <a class="btn btn-danger" href="${pageContext.request.contextPath}/getMemberList.do" style="width: 500px; height: 35px; margin: 0 auto; align:center;">관리자 화면</a>
           </div>
           <br>
           <br>
            <br>  
                     
        </div>
      </form>
    </div>