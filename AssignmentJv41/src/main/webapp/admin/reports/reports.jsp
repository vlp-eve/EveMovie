<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<ul class="nav nav-tabs" id="myTab" role="tablist">
	<li class="nav-item " role="presentation">
		<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
			data-bs-target="#home-tab-pane" type="button" role="tab"
			aria-controls="home-tab-pane" aria-selected="true">Favorite
		</button>
	</li>
	<li class="nav-item" role="presentation">
		<button class="nav-link" id="videoList-tab" data-bs-toggle="tab"
			data-bs-target="#videoList-tab-pane" type="button" role="tab"
			aria-controls="videoList-tab-pane" aria-selected="false">
			Favorite User</button>
	</li>
	<li class="nav-item " role="presentation">
		<button class="nav-link " id="share-tab" data-bs-toggle="tab"
			data-bs-target="#share-tab-pane" type="button" role="tab"
			aria-controls="share-tab-pane" aria-selected="true">Share</button>
	</li>
</ul>
<div class="tab-content" id="myTabContent">
	<div class="tab-pane fade show active" id="home-tab-pane"
		role="tabpanel" aria-labelledby="home-tab">
		<table class="table table-stripe">
			<tr>
				<td>Video Title</td>
				<td>Favorite Count</td>
				<td>Lastest Date</td>
				<td>Oldest Date</td>
				<td>&nbsp;</td>
			</tr>
			<c:forEach var="item" items="${favList }">
				<tr>
					<td>${item.videoTitle }</td>
					<td>${item.favoriteCount }</td>
					<td>${item.newestDate }</td>
					<td>${item.oldestDate }</td>
				</tr>
				</c:forEach>
		</table>
	</div>
	<div class="tab-pane fade" id="videoList-tab-pane" role="tabpanel"
		aria-labelledby="videoList-tab">
		<form action="" method="get">
			<div class="row mt-3">
				<div class="col">
					<div class="form-inline">
						<div class="form-group">
							<label>Video Title <select name="videoUserId"
								id="videoUserId" class="form-control ml-3">

									<c:forEach var="item" items="${vidList }">
									<option value="${item.videoId }" ${item.videoId == videoUserId?'selected':'' }>${item.title }</option>
									</c:forEach>
							</select>
							</label>
							<button class="btn btn-info">report</button>
						</div>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col mt-3">
					<table class="table table-borderder">
						<tr>
							<td>Username</td>
							<td>Fullname</td>
							<td>Email</td>
							<td>Favorite Date</td>

						</tr>
						<c:forEach var="item" items="${favUsers }">
							<tr>
								<td>${item.username }</td>
								<td>${item.fullname }</td>
								<td>${item.email }	</td>
								<td>${item.likeDate }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</form>
	</div>
	<div class="tab-pane fade" id="share-tab-pane" role="tabpanel"
		aria-labelledby="share-tab">
		<form action="" method="get">
			<div class="row mt-3">
				<div class="col">
					<div class="form-inline">
						<div class="form-group">
							<label>Video Title <select name="" id=""
								class="from-control">
									<option value="">solo leveling</option>
							</select>
							</label>
							<button class="btn btn-info">report</button>
						</div>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col mt-3">
					<table class="table table-borderder">
						<tr>
							<td>Sender Name</td>
							<td>Sender Mail</td>
							<td>Reciver Email</td>
							<td>Send Date</td>

						</tr>
						<tr>
							<td>YYY</td>
							<td>123</td>
							<td>vô hạn</td>
							<td>Active</td>

						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
</div>