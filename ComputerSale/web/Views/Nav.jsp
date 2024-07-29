<%-- 
    Document   : Header
    Created on : May 13, 2024, 8:09:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>
        <div class=" row display-6 p-4 justify-content-center" style="background-color: #0d0c1d;">
            <!--Nút mở side bar bên trái-->
            <div class="col-md-2">
                <div>
                    <!--Hamburger Button, dùng mở canvas bên trái-->
                    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon ">
                            <i class="bi bi-list text-decoration-none text-white"></i>
                        </span>
                    </button>
                    <!--Hết button-->
                </div>
                <!--Thẻ canvas bên tay trái-->
                <div class="offcanvas offcanvas-start text-bg-dark h5" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                    <div class="offcanvas-header"><!-- Tiêu đề canvas -->
                        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">Dashboard</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body"><!-- Nội dung canvas -->
                        <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">All users</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Admin dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Staff dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Customer shortcut</a>
                            </li>
                            
                        </ul>
                    </div>
                </div>
                <!--Kết thúc canvas-->
            </div>


            <!--Thanh search tìm kiếm-->
            <div class="col-md-5">
                    <form class="d-flex" role="search">
                        <div class="input-group align-center">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success" type="submit">
                                <i class="bi bi-search"></i>
                            </button>
                        </div>
                    </form>
            </div>
            <!--Kết thúc thanh search-->
            <!--Điều hướng trang-->
            <div class="col-md-5 row ">
                <div class="col">
                    <a href="<%=request.getContextPath()%>/Views/AllUsers/Home.jsp"
                       class="text-decoration-none text-white">Home</a>
                </div>
                <div class="col">
                    <a href="<%=request.getContextPath()%>/Views/AllUsers/Products.jsp" 
                       class="text-decoration-none text-white">Products</a>
                </div>
                <div class="col text-left">
                    <a href="<%=request.getContextPath()%>/cart"
                       class="text-decoration-none text-white text-left">Cart</a>
                </div>
                <div class="col">
                    <a href="<%=request.getContextPath()%>/login"
                       class="text-decoration-none text-white text-left">
                        Login
                    </a>
                </div>
            </div>
            <!--Kết thúc điều hướng-->
        </div>
    </body>
</html>
