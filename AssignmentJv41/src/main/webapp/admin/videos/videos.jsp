	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<ul class="nav nav-tabs" id="myTab" role="tablist">
	<li class="nav-item" role="presentation">
		<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
			data-bs-target="#home-tab-pane" type="button" role="tab"
			aria-controls="home-tab-pane" aria-selected="true">Video</button>
	</li>
	<li class="nav-item" role="presentation">
		<button class="nav-link" id="videoList-tab" data-bs-toggle="tab"
			data-bs-target="#videoList-tab-pane" type="button" role="tab"
			aria-controls="videoList-tab-pane" aria-selected="false">
			Edit</button>
	</li>
</ul>
<div class="tab-content" id="myTabContent">
<jsp:include page="/common/inform.jsp"></jsp:include>
	<div class="tab-pane fade show active" id="home-tab-pane"
		role="tabpanel" aria-labelledby="home-tab">
		<form action="" method="post" enctype="multipart/form-data">
			<div class="card-body">
				<div class="row">
					<div class="col-3">
						<div class="border p-3">
							<img
								src=" ${video.poster != null?video.poster:'https://img.wattpad.com/7d2d402080181139d215d8e43e4133cd9f8e0cc3/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f4955386c6e6a66684f744f6e78673d3d2d3835333532393535372e313566656462373435363532336435653834313634343639353936302e6a7067?s=fit&w=720&h=720' }"
								class="img-fluid" alt="">
							<div class="input-group mb-3 mt-3">
								<div class="input-group-prepend">
									<span class="input-group-text"> Upload </span>
								</div>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="cover" name="cover"/>
									
								</div>
							</div>
						</div>
					</div>
					<div class="col-9">
						<div class="form-group">
							<label for="YoutubeId" class="form-label">YoutubeId</label> <input
								type="text" class="form-control" id="YoutubeId"
								aria-describedby="YoutubeIdhid" name="videoId" value="${video.videoId }">
							<div id="YoutubeIdhid" class="form-text">YoutubeId is
								required</div>
						</div>
						<div class="form-group">
							<label for="VideoTitle" class="form-label">Video Title</label> <input
								type="text" class="form-control" id="VideoTitle"
								aria-describedby="VideoTitlehid" name="title" value="${video.title }">
							<div id="VideoTitlehid" class="form-text">Video Title is
								required</div>
						</div>
						<div class="form-group">
							<label for="ViewCount" class="form-label">View Count</label> <input
								type="number" class="form-control" id="ViewCount"
								aria-describedby="ViewCounthid" name="views" value="${video.views }">
							<div id="ViewCounthid" class="form-text">View Count is
								required</div>
						</div>
						<div class="form-check form-check-inline">
							<label for="statusActive" class="p-3"> <input
								type="radio" class="form-check-input" name="active"
								id="statusActive" value="true" value="${video.active? 'checked':'' }">Active
							</label> <label for="statusInactive" class="p-3"> <input
								type="radio" class="form-check-input" name="active"
								id="statusInactive" value="false" value="${!video.active? 'checked':'' }">Inactive
							</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<label for="description">Description</label>
						<textarea name="description" id="description" cols="30" rows="4"
							class="form-control">${video.description }</textarea>
					</div>
				</div>
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-primary" formaction="Admin/VideosManagement/create">Create</button>
						<button class="btn btn-warning" formaction="Admin/VideosManagement/update">Update</button>
						<button class="btn btn-danger" formaction="Admin/VideosManagement/delete">Delete</button>
						<button class="btn btn-info" formaction="Admin/VideosManagement/reset">Reset</button>
			</div>
		</form>
	</div>
	<div class="tab-pane fade" id="videoList-tab-pane" role="tabpanel"
		aria-labelledby="videoList-tab">
		<table class="table table-striped">
			<tr>
				<td>YoutubeId</td>
				<td>VideoTitle</td>
				<td>ViewCount</td>
				<td>Status</td>
				<td>&nbsp;</td>
			</tr>
			<c:forEach var="item" items="${videos }">
				<tr>
					<td>${item.videoId }</td>
					<td>${item.title }</td>
					<td>${item.views }</td>
					<td>${item.active? 'Active': 'Deactive' }</td>
					<td><a href="Admin/VideosManagement/edit?videoId=${item.videoId }"><i class="fa fa-edit" aria-hidden="true"></i>Edit</a>
						<a href="Admin/VideosManagement/delete?videoId=${item.videoId }"><i class="fa fa-trasj" aria-hidden="true"></i>Delete</a>
					</td>
				</tr>
				</c:forEach>
		</table>
	</div>
</div>
