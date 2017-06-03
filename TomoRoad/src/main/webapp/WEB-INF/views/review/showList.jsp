<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="rlist" value="${reviewList.list }" />
<c:set var="size" value="${fn:length(rlist)}"/>



<c:forEach begin="0" end="2" var="i">
	<div class="featured-blocks">
		<div class="container">
			<div class="row-fluid">
				<c:forEach begin="0" end="2" var="j">
					<c:if test="${size>i*3+j }">
						<div class="span3">
							<div class="block">
								<div class="icon">
									<i class="fw-icon-user"></i>
								</div>
								<h1>${rlist[i*3+j].title }</h1>
								<p>${rlist[i*3+j].place.name }</p>
								<p>${rlist[i*3+j].hits }</p>
								<a href="${pageContext.request.contextPath}/review/detailHit.do?no=${rlist[i*3+j].no}" role="button" class="btn">detail</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
</c:forEach>
<div class="featured-blocks">
	<div class="container">
		<a
			href="${pageContext.request.contextPath}/review/register_form.do"
			role="button" class="btn">register</a>
	</div>
</div>