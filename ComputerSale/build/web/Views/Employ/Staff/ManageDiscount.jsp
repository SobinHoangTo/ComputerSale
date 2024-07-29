<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta charset="UTF-8">
        <title>Manage Discount</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="cssE/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="cssE/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <!--            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>-->
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <%@include file="../HeadFoot/EmployeeSidebar.jsp" %>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="../HeadFoot/EmployeeNav.jsp" %>
                <!-- Navbar End -->


                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded justify-content-center mx-0">
                        <!-- Main Content -->
                        <div class="container mt-4">
                            <!-- Title -->
                            <h1 class="display-4 p-2">Manage Discounts</h1>
                            <h1 class="p-2">${mess}</h1>
                            <!-- Start Search -->
                            <div class="row">
                                <!-- Search by Product Name -->
                                <div class="container col-md-5 mb-3" style="width: 45%;">
                                    <form class="d-flex" role="search" action="managediscount" method="get">
                                        <div class="input-group p-2">
                                            <input class="form-control me-2" type="search" 
                                                   placeholder="Search by Product Name"
                                                   value="${param.search}"
                                                   aria-label="Search" name="search">
                                            <button class="btn btn-outline-success" type="submit">
                                                <i class="bi bi-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <!-- Search by Created users -->
                                <div class="container col-md-4 mb-3" style="width: 25%;">
                                    <form class="d-flex" role="search" action="managediscount" method="get">
                                        <div class="input-group p-2">
                                            <select id="status" name="status" class="form-select me-2">
                                                <option value="0" ${param.status ==null ?'selected':''}>All</option>
                                                <option value="1" ${param.status ==1 ?'selected':''}>Sale ended</option>
                                                <option value="2" ${param.status ==2 ?'selected':''}>On sale</option>
                                                <option value="3"${param.status ==3 ?'selected':''}>Coming up</option>
                                            </select>
                                            <button class="btn btn-outline-success" type="submit">
                                                <i class="bi bi-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <!-- Add Discount Button -->
                                <div class="container col-md-4 mb-3" style="width: 25%;">
                                    <!-- Add Discount Button -->
                                    <div class="p-2 input-group">
                                        <a href="discount" class="btn btn-primary">Add Discount</a>
                                    </div>
                                </div>

                            </div>
                            <!-- End Search -->

                            <!-- Discount Table -->
                            <div class="container mt-4">
                                <%-- Display alert messages if present --%>
                                <c:if test="${not empty alertMessage}">
                                    <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                        ${alertMessage}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center;">ID</th>
                                                <th>Product Name</th>
                                                <th style="text-align: right;">Quantity</th>
                                                <th style="text-align: right;">Value</th>
                                                <th>Start Date</th>
                                                <th>Expiration Date</th>
                                                <th>Created By</th>
                                                <th style="width: 10%; text-align: center;">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${empty requestScope.discount}">
                                                <tr>
                                                    <td colspan="9" class="text-center alert alert-warning" role="alert">
                                                        No results found.
                                                    </td>
                                                </tr>
                                            </c:if>
                                            <c:if test="${not empty requestScope.discount}">
                                                <c:forEach items="${requestScope.discount.entrySet()}" var="entry">
                                                    <c:set var="product" value="${entry.value}" />
                                                    <c:set var="discount" value="${entry.key}" />
                                                    <tr>
                                                        <td style="text-align: center;">${discount.id}</td>
                                                        <td style="max-width: 150px;">
                                                            <a href="productdetails?id=${product.id}">${product.name}</a>
                                                        </td> 
                                                        <td style="text-align: right;">${discount.quantity}</td>
                                                        <td style="text-align: right;">${discount.value}%</td>
                                                        <td>${discount.start_date}</td>
                                                        <td>${discount.exp_date}</td>
                                                        <td>
                                                            <c:forEach items="${requestScope.employee}" var="e">
                                                                ${discount.created_by == e.id ? 
                                                                  e.username : ''}
                                                            </c:forEach>
                                                        </td>
                                                        <td style="text-align: center;">
                                                            <div class="btn-group" role="group" aria-label="Discount Actions">
                                                                <!-- Edit Button -->
                                                                <button type="button" class="btn btn-secondary btn-sm me-3" data-bs-toggle="modal" data-bs-target="#editDiscountModal${discount.id}">
                                                                    <i class="bi bi-pencil-square"></i>
                                                                </button>

                                                                <!-- Delete Button -->
                                                                <form action="managediscount" method="post">
                                                                    <input type="hidden" name="action" value="delete">
                                                                    <input type="hidden" name="product_id" value="${product.id}">
                                                                    <button type="submit" value="delete" class="btn btn-danger btn-sm" id="deleteButton">
                                                                        <i class="bi bi-trash"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </td>

                                                    </tr>
                                                    <!-- Edit Discount Modal -->
                                                <div class="modal fade" id="editDiscountModal${discount.id}" tabindex="-1" aria-labelledby="editDiscountModalLabel${discount.id}"
                                                     aria-hidden="true">
                                                    <div class="modal-dialog modal-dialog-centered">
                                                        <div class="modal-content bg-light">
                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="editDiscountModalLabel${discount.id}">Edit Discount</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <!-- Modal Body -->
                                                            <div class="modal-body">
                                                                <!-- Form to edit discount details -->
                                                                <form action="managediscount" method="post">
                                                                    <div class="modal-body">
                                                                        <div class="form-group mb-3">
                                                                            <label for="productId${discount.id}" class="form-label"> ID:</label>
                                                                            <input type="text" class="form-control" id="productId${discount.id}" name="id" value="${discount.id}" readonly>
                                                                        </div>
                                                                        <div class="form-group mb-3">
                                                                            <label for="productName${discount.id}" class="form-label">Product Name:</label>
                                                                            <select id="productName${discount.id}" name="product_id" class="form-select" aria-label="Default select example">
                                                                                <c:forEach items="${requestScope.productList}" var="product">
                                                                                    <option value="${product.id}" 
                                                                                            ${product.id == discount.product_id ? 'selected' : ''}
                                                                                            >${product.name}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="form-group mb-3">
                                                                            <label for="quantity${discount.id}" class="form-label">Quantity:</label>
                                                                            <input type="number" class="form-control" id="quantity${discount.id}" name="quantity" value="${discount.quantity}">
                                                                        </div>
                                                                        <div class="form-group mb-3">
                                                                            <label for="value${discount.id}" class="form-label">Value:</label>
                                                                            <input type="number" class="form-control" id="value${discount.id}" name="value" value="${discount.value}">
                                                                        </div>
                                                                        <div class="form-group mb-3">
                                                                            <label for="start_date${discount.id}" class="form-label">Start Date:</label>
                                                                            <input type="date" class="form-control" id="start_date${discount.id}" name="start_date" value="${discount.start_date}">
                                                                        </div>
                                                                        <div class="form-group mb-3">
                                                                            <label for="expDate${discount.id}" class="form-label">Expiration Date:</label>
                                                                            <input type="date" class="form-control" id="expDate${discount.id}" name="exp_date" value="${discount.exp_date}">
                                                                        </div>
                                                                        <!-- Hidden field to store product ID -->
                                                                        <input type="hidden" name="product_id" value="${discount.id}">
                                                                        <input type="hidden" name="action" value="edit">
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                        </tbody>
                                    </table>
                                </div>
                                <!--paging-->
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/managediscount?pageNumber=1">Previous</a></li>
                                            <c:if test="${param.pageNumber==1}">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="<%=request.getContextPath()%>/managediscount?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${requestScope.numberOfPage<=5}">
                                            <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                                <li class="page-item ${i==param.pageNumber?"active":""}">
                                                    <a class="page-link" href="<%=request.getContextPath()%>/managediscount?pageNumber=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${requestScope.numberOfPage>5}">
                                            <c:choose>
                                                <c:when test="${param.pageNumber-3<=0}">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managediscount?pageNumber=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <li>
                                                        <a class="page-link" href="#">...</a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${param.pageNumber+2>=requestScope.numberOfPage}">
                                                    <li>
                                                        <a class="page-link" href="#">...</a>
                                                    </li>
                                                    <c:forEach begin="${requestScope.numberOfPage-4}" end="${requestScope.numberOfPage}" var="i">
                                                        <li class=" ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managediscount?pageNumber=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>

                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a class="page-link" href="#">...</a>
                                                    </li>
                                                    <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managediscount?pageNumber=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <li>
                                                        <a class="page-link" href="#">...</a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <li class="page-item">
                                            <a class="page-link"
                                               href="<%=request.getContextPath()%>/managediscount?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/managediscount?pageNumber=${numberOfPage}">End</a></li>
                                    </ul>
                                </nav>
                                <!--end pagination-->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Blank End -->


                <!-- Footer Start -->
                <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>  

    </body>
</html>
