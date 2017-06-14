<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function friendRequest(id){
	location.href = "${pageContext.request.contextPath}/friend_Request.do?senderId=${mvo.id}&receiverId="+id;
}
</script>
아이디 : ${memberInfo.id}<br>
이   름 : ${memberInfo.name}<br>
<img width="200" height="200" src = "${memberInfo.profile}"><br>

<!-- 친구면은 친구버튼, 아니면 친구신청 버튼 -->
<c:choose>
	<c:when test="${friend != null}">
		<input style = color:white; class="btn btn-danger"  type = "text" value = "친구">
	</c:when>
	<c:otherwise>
		<input style = color:white; class="btn btn-danger" type = "button" value="친구신청" onclick="friendRequest('${memberInfo.id}')">
	</c:otherwise>
</c:choose>

   <section class="super_sub_content row">
        <div class="dividerHeading text-center">
            <h4><span>RECENT POST TIMELINE</span></h4>
        </div>

        <div class="col-md-12">
            <section id="timeline" class="timeline-container">
                <div class="timeline-block">
                    <div class="timeline-img tl-green"> <!-- 초록색 그림 -->
                        <i class="fa fa-picture-o"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 5</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-blue">
                        <i class="fa fa-video-camera"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 8</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-pink">
                        <i class="fa fa-globe"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 12</span>
                    </div>
                </div>

                <div class="timeline-block">
                    <div class="timeline-img tl-orange">
                        <i class="fa fa-picture-o"></i>
                    </div>

                    <div class="timeline-content">
                        <h2>This title in post blogs</h2>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin faucibus justo a odio cursus faucibus. Vivamus vehicula massa at arcu porta, sed maximus risus molestie. Morbi nec fringilla magna, sit.
                        </p>
                        <a href="#" class="btn btn-default">Read more</a>
                        <span class="tl-post-date">june 18</span>
                    </div>
                </div>
            </section>
        </div>
    </section>
