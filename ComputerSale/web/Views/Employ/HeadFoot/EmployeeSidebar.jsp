<%-- 
    Document   : AdminHeader
    Created on : Jun 3, 2024, 4:04:52 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .sidebar {
                width: 250px; /* Increase the width of the sidebar */
            }
            .navbar-nav {
                width: 100%; /* Ensure the navbar items fill the sidebar width */
            }
        </style>
    </head>
    <body>

        <!-- Sidebar Start -->
        <div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-light navbar-light">
                <a href="employeehome" class="navbar-brand mx-4 mb-3">
                    <h3 class="text-primary"><i class="fa fa-user-edit me-2"></i>DASHBOARD</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="Image/Avatar/Employee/${sessionScope.currentEmployee.img}" alt="" style="width: 40px; height: 40px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
                        <h6 class="mb-0">${sessionScope.currentEmployee.getFirstname()} ${sessionScope.currentEmployee.getLastname()}</h6>
                        <span>${sessionScope.currentEmployee.getRole_id()==1?"Admin":sessionScope.currentEmployee.getRole_id()==2?"Manager":"Staff"}</span>
                    </div>
                </div>
                <div class="navbar-nav">
                    <a href="<%=request.getContextPath()%>/" class="nav-item nav-link">
                        <i class="fa fa-home me-2"></i>Website
                    </a>
                    <c:if test="${sessionScope.currentEmployee.getRole_id()==1}">
                        <a href="<%=request.getContextPath()%>/viewstatistic" class="nav-item nav-link">
                            <i class="fa fa-tachometer-alt me-2"></i>Dashboard
                        </a>
                    </c:if>

                    <c:if test="${sessionScope.currentEmployee.getRole_id()==2||sessionScope.currentEmployee.getRole_id()==1}">
                        <a href="<%=request.getContextPath()%>/manageaccount" class="nav-item nav-link">
                            <i class="fa fa-th me-2"></i>Account
                        </a>
                    </c:if>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Create New</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="<%=request.getContextPath()%>/addemployee" class="dropdown-item">Account</a>
                            <a href="<%=request.getContextPath()%>/discount" class="dropdown-item">Discount</a>
                            <a href="<%=request.getContextPath()%>/addnews" class="dropdown-item">News</a>
                            <a href="<%=request.getContextPath()%>/addproduct" class="dropdown-item">Products</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Manage</a>
                        <div class="dropdown-menu bg-transparent border-0">
                            <a href="<%=request.getContextPath()%>/managefeedback" class="dropdown-item">Feedback</a>
                            <a href="<%=request.getContextPath()%>/manageorders" class="dropdown-item">Orders</a>
                            <a href="<%=request.getContextPath()%>/managewarranty" class="dropdown-item">Warranty</a>
                            <a href="<%=request.getContextPath()%>/managediscount" class="dropdown-item">Discount</a>
                            <a href="<%=request.getContextPath()%>/managenews" class="dropdown-item">News</a>
                            <a href="<%=request.getContextPath()%>/managenewscategory" class="dropdown-item">News Category</a>
                            <a href="<%=request.getContextPath()%>/manageproducts?act=all" class="dropdown-item">Products</a>
                            <a href="<%=request.getContextPath()%>/managebrand?act=all" class="dropdown-item">Brand</a>
                            <a href="<%=request.getContextPath()%>/managecategory?act=all" class="dropdown-item">Product Category</a>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
        <!-- Sidebar End -->
    </body>
</html>
