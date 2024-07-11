<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${page.title }</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
	<base href="/AssignmentJv41/">
    <style>
        body {
            background-color: #f8f9fa;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <header>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="#">Admin Dashboard</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="Admin/UsersManagement">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Admin/UsersManagement">User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Admin/VideoManagement">Video</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ReportManagement">Reports</a>
                        </li>
                    </ul>
                    <!-- Right side of navbar -->
                    <ul class="navbar-nav ms-auto">
                        <!-- <li class="nav-item">
                  <a class="nav-link" href="#"><i class="fas fa-user"></i> Admin</a>
                </li> -->
                        <li class="nav-item">
                            <a class="nav-link" href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <section>
            <jsp:include page="${page.contentUrl }"></jsp:include>
        </section>

    </div>
	<c:if test="${not empty page.scriptUrl }">
	<jsp:include page="${page.scriptUrl}"></jsp:include>
	</c:if>
</body>

</html>