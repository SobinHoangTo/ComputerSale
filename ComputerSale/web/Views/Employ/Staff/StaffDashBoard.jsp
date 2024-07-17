<%-- 
    Document   : Home
    Created on : May 13, 2024, 8:23:48 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Dashboard</title>
        <!--bootstrap link-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!--bootstrap icon-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>
        <!--Header-->

        <%@ include file="../HeadFoot/Header.jsp" %>

        <!--end Header-->

        <!--Start Content-->
        <div class="container-fluid p-4" style="background-color: #FFF0E3;">
            <div class="container p-4">
                <div class="row">
                    <!-- Box 1: Manage Product -->
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">Manage Product</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                <a href="<%=request.getContextPath()%>/manageproducts" class="btn btn-primary">Go to Product Management</a>
                            </div>
                        </div>
                    </div>

                    <!-- Box 2: Manage News -->
                    <div class="col-md-6">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">Manage News</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                <a href="<%=request.getContextPath()%>/managenews" class="btn btn-primary">Go to News Management</a>
                            </div>
                        </div>
                    </div>

                    <!-- Box 3: Manage Discount -->
                    <div class="col-md-6 mt-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">Manage Discount</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                <a href="<%=request.getContextPath()%>/managediscount" class="btn btn-primary">Go to Discount Management</a>
                            </div>
                        </div>
                    </div>

                    <!-- Box 4: Manage Brand -->
                    <div class="col-md-6 mt-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">Manage Brand</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                <a href="<%=request.getContextPath()%>/managebrand" class="btn btn-primary">Go to Brand Management</a>
                            </div>
                        </div>
                    </div>

                    <!-- Box 5: Manage Warranty -->
                    <div class="col-md-6 mt-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">Manage Warranty</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                <a href="<%=request.getContextPath()%>/managewarranty" class="btn btn-primary">Go to Warranty Management</a>
                            </div>
                        </div>
                    </div>

                    <!-- Box 6: Check Bill -->
                    <div class="col-md-6 mt-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <h5 class="card-title">Check Bill</h5>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec lorem nec velit facilisis fringilla.</p>
                                <a href="<%=request.getContextPath()%>/" class="btn btn-primary">Go to Bill Checking</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!--end Content-->
        <!--Footer-->


        <%@ include file="../HeadFoot/Footer.jsp" %>

        <!--end Footer-->
    </body>
</html>
