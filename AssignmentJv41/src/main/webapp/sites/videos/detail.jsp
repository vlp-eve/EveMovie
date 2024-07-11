<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
    ></script>
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

      .blur-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 99%; /* Kích thước của phần bị làm mờ, ở đây là 50% */
        height: 100%;
        background: linear-gradient(
          to right,
          rgba(255, 255, 255, 0),
          rgba(255, 255, 255, 1)
        ); /* Gradient từ trong suốt đến độ mờ */
      }
      .movie-introduction {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
      .footer {
            background-color: #343a40; /* Màu nền */
            color: #ffffff; /* Màu chữ */
            padding: 20px 0; /* Khoảng cách bên trong */
        }
    </style>
  </head>
  <body>
   <div class="row  mb-3  ">
	<div class="item  col-12 col-lg-9 mt-3   ">
		<div class="card col-12 col-md-3 w-100">
			<div class="card-video text-center ">
				<!-- Thêm lớp CSS text-center
				<iframe class="w-100 " height="526"
					src="https://www.youtube.com/embed/2YvjxIc5VOU?si=rojuqbMw_MPKKwTk"
					allowfullscreen></iframe>-->
				<img alt="" src="${video.poster }" class="w-100 " height="526">
			</div>
			<h5 class="card-title mt-2 ms-3  ">${video.title }</h5>

			<div class=" d-flex justify-content-between ms-3  align-items-end">
				<div>
					<p>${video.views }Lượt xem</p>

				</div>

				<div class=" text-end">
					<a href="LikeVideo?videoId=${video.videoId }&page=Detail"
						class="btn btn-success me-2 ">Like</a> <a
						href="ShareVideo?videoId=${video.videoId }"
						class="btn btn-warning  me-2">Share</a>
				</div>

			</div>
			<h5 class="ms-3">Mô tả</h5>
			<p class="ms-3">${video.description}</p>
		</div>

	</div>

	<div class="menu col-12 col-lg-3 mt-2"
		style="max-height: 660px; overflow-y: auto;">
		<c:forEach var="item" items="${videos }">
			<div class="row g-0 align-items-center ">
				<div class="col-md-4 p-1 rounded-2  ">
					<div class="card-video text-center mt-2">
						<!-- Thêm lớp CSS text-center 
					<iframe
						src="https://www.youtube.com/embed/2YvjxIc5VOU?si=rojuqbMw_MPKKwTk"
						allowfullscreen style="max-width: 100%; height: 100px;"></iframe>-->
						<img alt=""
							src="${empty item.poster ? 'images/desktop.jpg': item.poster}"
							style="max-width: 100%; height: 100px;">
					</div>
				</div>
				<div class="col-md-8">
					<div class="card-body d-flex flex-row align-items-center">
						<h5 class="card-title mb-0">
							<a href="Detail?videoId=${item.videoId }">${item.title}</a>
						</h5>
					</div>
				</div>
				
			</div>
		</c:forEach>
	</div>
    </div>
  </body>
</html>

