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
      .intro_web .intro_text{
        background-color: #c6d4e7b8;
        
      }
      .intro_web .intro_text .custom-card-text{
        color: #0e0e0f;
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
      .footer {
            background-color: #343a40; /* Màu nền */
            color: #ffffff; /* Màu chữ */
            padding: 20px 0; /* Khoảng cách bên trong */
        }
        .video-container {
            position: relative;
            padding-bottom: 56.25%; /* Tỷ lệ khung hình 16:9 */
            padding-top: 30px;
            height: 0;
            overflow: hidden;
        }
        .video-container iframe,
        .video-container object,
        .video-container embed {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
    </style>
  </head>
  <body>
    
      <main class="container-fluid"> 
        <div class="row justify-content-center ">
            <c:forEach var="item" items="${Videos }">
				<div class="col-md-4 mb-3">
					<div class="card" style="width: 18rem">
						<img width="100%" class="img-fluid" height="215"
							src="${ empty item.poster ? 'images/1.jpg': item.poster }"
							 frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen>
						<div class="card-body">
							<b>${item.title }</b>
							<p class="card-text"></p>
							<div class="card-footer text-center">
							 <a href="Share?videoId=${item.videoId }"
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
                  <li class="page-item disabled">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">-</a>
                  </li>
                  <li class="page-item">
                    <a class="page-link" href="#">+</a>
                  </li>
                  
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
      </main>
    
    
     
    </div>
  </body>
</html>
