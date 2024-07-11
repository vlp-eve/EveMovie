<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item " role="presentation">
			<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
				data-bs-target="#home-tab-pane" type="button" role="tab"
				aria-controls="home-tab-pane" aria-selected="true">User</button>
		</li>
		<li class="nav-item" role="presentation">
			<button class="nav-link" id="videoList-tab" data-bs-toggle="tab"
				data-bs-target="#videoList-tab-pane" type="button" role="tab"
				aria-controls="videoList-tab-pane" aria-selected="false">
				List</button>
		</li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="home-tab-pane"
			role="tabpanel" aria-labelledby="home-tab">
			<form action="" method="post">
				<div class="card-body">
					<div class="row">
						<div class="col">
							<div class="form-group">
								<label for="username">Username</label> <input type="text"
									class="form-control" name="username" id="username"
									value="${user.username }" aria-describedby="usernamehelpId"
									placeholder="username"> <small id="usernamehelpId"
									class="form-text text-muted">Username is required</small>
							</div>
							<div class="form-group">
								<label for="">Fullname</label> <input type="text"
									class="form-control" name="fullname" id="fullname"
									value="${user.fullname }" aria-describedby="fullnamehelpId"
									placeholder="fullname"> <small id="fullnamehelpId"
									class="form-text text-muted">Fullname is required</small>
							</div>
						</div>
						<div class="col">
							<div class="form-group">
								<label for="">Password</label> <input type="password"
									class="form-control" name="password" id="password" value="${user.password }"
									aria-describedby="passwordhelpId" placeholder="password">
								<small id="passwordhelpId" class="form-text text-muted">Password
									is required</small>
							</div>
							<div class="form-group">
								<label for="">Email</label> <input type="text"
									class="form-control" name="email" id="email"
									value="${user.email }" aria-describedby="emailhelpId"
									placeholder="email"> <small id="emailhelpId"
									class="form-text text-muted">Email is required</small>
							</div>
						</div>
					</div>
				</div>
				<hr>
				<div class="card-footer text-muted">
					<button class="btn btn-primary"
						formaction="Admin/UsersManagement/create">Create</button>
					<button class="btn btn-warning"
						formaction="Admin/UsersManagement/update">Update</button>
					<button class="btn btn-danger"
						formaction="Admin/UsersManagement/delete">Delete</button>
					<button class="btn btn-info"
						formaction="Admin/UsersManagement/reset">Reset</button>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videoList-tab-pane" role="tabpanel"
			aria-labelledby="videoList-tab">
			<table class="table table-stripe">
				<tr>
					<td>username</td>
					<td>fullName</td>
					<td>password</td>
					<td>email</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach var="item" items="${users }">
				<tr>
					<td>${item.username }</td>
					<td>${item.fullname }</td>
					<td>${item.password}</td>
					<td>${item.email }</td>
					<td></td>
					<td><a href="Admin/UsersManagement/edit?username=${item.username }"><i class="fa fa-edit" aria-hidden="true"></i>Edit</a>
						<a href="Admin/UsersManagement/delete?username=${item.username }"><i class="fa fa-trasj" aria-hidden="true"></i>Delete</a>
					</td>
					
				</tr>
					</c:forEach>
			</table>
		</div>
	</div>
</section>