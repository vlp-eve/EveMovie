<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row">
	<div class="main_left col-9 ms-3">
		<div class="container mt-5">
			<div class="row">
			<c:forEach var="item" items="${videos }">
				<div class="col-md-4 mb-3">
					<div class="card" style="width: 18rem">
						<img width="100%" class="img-fluid" height="215"
							src="${ empty item.poster ? 'images/1.jpg': item.poster }"
							 frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen>
						<div class="card-body">
							<a href="VideoDetail" name="videoId">${item.title }</a>
							<p class="card-text"></p>
							<div class="card-footer text-center">
							<a href="LikeVideo?videoId=${item.videoId }" class="btn btn-success">Like</a> <a href="Share?videoId=${item.videoId }"
						class="btn btn-info">Share</a>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				
			</div>
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item disabled"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="main_right col"></div>
</div>