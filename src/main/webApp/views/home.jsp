<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>agriConnect</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }
        .navbar {
            background: linear-gradient(90deg, #28a745, #218838);
        }
        .navbar-brand {
            font-weight: 600;
            color: #fff !important;
        }
        .nav-link {
            color: #fff !important;
            font-weight: 500;
            transition: 0.3s;
        }
        .nav-link:hover {
            color: #f8f9fa !important;
        }
        .card {
            border-radius: 15px;
            transition: 0.3s;
            overflow: hidden;
            background: #fff;
        }
        .card:hover {
            transform: scale(1.03);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
        }
        .card img {
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            max-height: 200px;
            object-fit: cover;
        }
        .card-title {
            font-weight: 600;
            color: #333;
        }
        .card-text {
            font-size: 14px;
            color: #666;
        }
        .pagination .page-link {
            color: #28a745;
            border-radius: 20px;
            transition: 0.3s;
        }
        .pagination .page-item.active .page-link {
            background-color: #28a745;
            border-color: #28a745;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
    <a class="navbar-brand" href="/">agriConnect</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <form action="/" class="form-inline my-2 my-lg-0 ml-auto">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>
        <ul class="navbar-nav ml-2">
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome, ${sessionScope.loggedInUser}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">Sign Out</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="/login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/register">Sign Up</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <c:forEach var="product" items="${products.content}">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <c:if test="${not empty product.imageUrl}">
                        <img src="${product.imageUrl}" class="card-img-top" alt="${product.title}">
                    </c:if>
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.description}</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-success font-weight-bold">$${product.price}</span>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${products.hasPrevious()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${products.number - 1}">Previous</a>
                </li>
            </c:if>
            <c:forEach var="i" begin="0" end="${products.totalPages - 1}">
                <li class="page-item ${i == products.number ? 'active' : ''}">
                    <a class="page-link" href="?page=${i}">${i + 1}</a>
                </li>
            </c:forEach>
            <c:if test="${products.hasNext()}">
                <li class="page-item">
                    <a class="page-link" href="?page=${products.number + 1}">Next</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
