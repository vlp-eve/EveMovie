<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<base href="/AssignmentJv41/">
<title>${page.title }</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<style>
body {
	height: 100vh; /* Chiều cao là 100% của viewport */
	width: 100%; /* Chiều rộng là 100% của parent */
	margin: 0;
	padding: 0;
	/* overflow: hidden; */
	/* ẩn nội dung vượt ra khỏi phạm vi của phần tử cha. */
	max-width: 2000px; /* Giới hạn chiều rộng của nội dung */
	background-color: #f6f0f0;
}

.infor .infor_name .name_cp {
	font-size: 36px; /* Kích thước font chữ */
	font-weight: bold; /* Độ đậm của font chữ */
	color: #edbadd; /* Màu sắc của font chữ */
	text-align: center; /* Canh giữa văn bản */
	margin-top: 50px; /* Khoảng cách từ trên xuống */
}

.infor .infor_img {
	position: relative;
	display: inline-block;
}

.infor .infor_img .img_inforoe {
	display: block;
	width: 100%;
	height: auto;
}

nav {
	position: sticky;
	top: 20px;
}

.blur-overlay {
	position: absolute;
	top: 0;
	left: 0;
	width: 99%; /* Kích thước của phần bị làm mờ, ở đây là 50% */
	height: 100%;
	background: linear-gradient(to right, rgba(255, 255, 255, 0),
		rgba(255, 255, 255, 1)); /* Gradient từ trong suốt đến độ mờ */
}

.footer {
	background-color: #343a40; /* Màu nền */
	color: #ffffff; /* Màu chữ */
	padding: 20px 0; /* Khoảng cách bên trong */
}
</style>
</head>
<body>
	<div class="contrainer-fluid">
		<header class="container-fluid">
			<div class="infor row">
				<div class="infor_name col-9 text-center">
					<h1 class="name_cp">OE Company</h1>
				</div>
				<div class="infor_img col-3">
					<img class="ms-auto img_inforoe rounded-start-pill"
						src="https://img2.thuthuatphanmem.vn/uploads/2018/11/17/hinh-phong-canh-anime-dep_112650668.jpg"
						width="90%" />
					<div class="blur-overlay"></div>
				</div>
			</div>
			<nav class="navbar navbar-expand-lg"
				style="background-color: #e3f2fd">
				<div class="container-fluid">
					<a href="Home" class="navbar-brand">OE</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="Homepage">Home</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="Favorite">My
									Favorites</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" role="button"
								data-bs-toggle="dropdown" aria-expanded="false">
									My account </a>
								<ul class="dropdown-menu">
									<c:if test="${not isLogin }">
										<li><a class="dropdown-item" href="Login">Login</a></li>
										<li><a class="dropdown-item" href="ForgotPassword">forgot
												password</a></li>
										<li><hr class="dropdown-divider" /></li>
										<li><a class="dropdown-item" href="Registration">Registration</a></li>
									</c:if>
									<c:if test="${isLogin }">
										<li><a class="dropdown-item" href="Logoff">logoff</a></li>
										<li><a class="dropdown-item" href="Changepassword">Change
												password</a></li>
										<li><a class="dropdown-item" href="EditProfile">Edit
												profile</a></li>
									</c:if>
								</ul></li>

						</ul>
						<ul class="navbar-nav mr-auto">
							<li class="nav-item ">  Welcome: ${name}</li>
						</ul>

					</div>
				</div>
			</nav>
		</header>
		<main class="mt-4 container-fluid">
			<jsp:include page="${page.contentUrl }"></jsp:include>
		</main>
		<footer class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12 text-center">
						<p>LPZ Dev &copy; 2024</p>
					</div>
				</div>
			</div>
		</footer>
	</div>
	<c:if test="${not empty page.scriptUrl }">
		<jsp:include page="${page.scriptUrl }"></jsp:include>
	</c:if>
</body>
</html>
