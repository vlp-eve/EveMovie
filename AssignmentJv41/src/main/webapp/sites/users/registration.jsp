<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .signup-container {
            width: 100%;
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .signup-container h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        .btn-signup {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .btn-signup:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Đăng Ký</h2>
        <form action="" method="post">
       
        <jsp:include page="/common/inform.jsp"></jsp:include>
        
            <div class="form-group">
                <label for="username">Tên đăng nhập:</label>
                <input class="form-control" type="text" id="username" name="username"  value="${user.username }">
            </div>
            <div class="form-group">
                <label for="username">Họ và tên</label>
                <input class="form-control" type="text" id="fullname" name="fullname"  value="${user.fullname }">
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input class="form-control" type="email" id="email" name="email"  value="${user.email }">
            </div>
            <div class="form-group">
                <label for="password">Mật khẩu:</label>
                <input class="form-control" type="password" id="password" name="password" >
            </div>
            <button  class="btn btn-signup">Đăng Ký</button>
        </form>
    </div>
</body>
</html>