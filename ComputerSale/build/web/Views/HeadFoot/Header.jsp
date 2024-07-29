<%-- 
    Document   : Header
    Created on : May 13, 2024, 8:09:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="<%=request.getContextPath()%>/Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- Ensure Bootstrap CSS is included -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* Add this CSS to your stylesheet */
            .dropdown:hover .dropdown-menu {
                display: block;
            }
            .dropdown-menu {
                margin-top: 0; /* Ensure the dropdown menu fits nicely */
            }
        </style>
    </head>
    <body>
        <header class="site-navbar" role="banner">
            <div class="site-navbar-top">
                <div class="container">
                    <div class="row align-items-center">

                        <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
                            <form action="productslist" class="site-block-top-search row">
                                <!--<span class="icon icon-search2"></span>-->
                                <!--<span class="bi bi-search"></span>-->
                                <input type="text" value="${param.search}" name="search" class="form-control border-0" placeholder="Search">
                                <button class="btn btn-outline-success" type="submit" id="search-icon"><span class="bi bi-search"></span></i></button>
                            </form>
                        </div>

                        <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
                            <div class="">
                                <a href="<%=request.getContextPath()%>/home" class="js-logo-clone">
                                    <img src="<%=request.getContextPath()%>/Image/laptop-icon.png" width="50" height="height" alt="alt"/>
                                </a>
                            </div>
                        </div>

                        <div class="col-6 col-md-4 order-3 order-md-3 text-right">
                            <div class="site-top-icons h6">
                                <ul>
                                    <li class="has-children">
                                        <c:if test="${sessionScope.currentCustomer == null && sessionScope.currentEmployee == null}">
                                            <a href="<%=request.getContextPath()%>/login">
                                                <span class="bi bi-person-circle"></span>
                                            </a>
                                        </c:if>
                                        <c:if test="${sessionScope.currentCustomer != null}">
                                            <div class="dropdown">
                                                <a href="<%=request.getContextPath()%>/profile" class="dropdown-toggle" id="profileDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <span class="bi bi-person-circle"></span>
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="profileDropdown" style="min-width: 150px;">
                                                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/profile"><span class="bi bi-person-circle"></span> Profile</a></li>
                                                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/shoppinghistory"><span class="bi bi-arrow-through-heart-fill"></span>Shopping History</a></li>
                                                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/login"><i class="bi bi-box-arrow-in-right"></i> Logout</a></li>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </li>
                                    <c:if test="${sessionScope.currentEmployee!=null}">
                                        <li><a href="<%=request.getContextPath()%>/employeehome"><span class="bi bi-arrow-through-heart-fill"></span></a></li>
                                            </c:if>

                                    <li>
                                        <a href="<%=request.getContextPath()%>/carts" class="site-cart">
                                            <!--<span class="icon icon-shopping_cart"></span>-->
                                            <span class="bi bi-cart3"></span>
                                            <span class="count" id="cartLength">${(sessionScope.cartLength!=0&&sessionScope.cartLength!=null)?(sessionScope.cartLength):0}</span>
                                        </a>
                                    </li>
                                    <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                                </ul>
                            </div> 
                        </div>

                    </div>
                </div>
            </div> 
            <nav class="site-navigation text-right text-md-center" role="navigation">
                <div class="container">
                    <ul class="site-menu js-clone-nav d-none d-md-block">
                        <li><a href="<%=request.getContextPath()%>/home">Home</a></li>
                        <li class="has-children">
                            <a href="<%=request.getContextPath()%>/productslist">Product</a>
                            <ul class="dropdown">
                                <c:forEach items="${requestScope.categoryList}" var="c">
                                    <li><a href="<%=request.getContextPath()%>/productslist?filter=1&category=${c.getId()}">${c.getName()}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <li class="has-children">
                            <a href="<%=request.getContextPath()%>/productslist">Brand</a>
                            <ul class="dropdown">
                                <c:forEach items="${requestScope.brandHeader}" var="c">
                                    <li><a href="<%=request.getContextPath()%>/productslist?filter=1&brand=${c.getId()}">${c.getName()}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <li class="has-children">
                            <a href="<%=request.getContextPath()%>/news?id=1">${newsHeaderName.name}</a>
                            <ul class="dropdown">
                                <c:forEach items="${requestScope.newsHeader}" var="c">
                                    <li><a href="<%=request.getContextPath()%>/news?id=${c.id}">${c.title}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Bootstrap JS, Popper.js, and jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>
