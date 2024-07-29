<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Orders</title>

        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
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

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Bootstrap Bundle (Bootstrap + Popper.js) JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <style>
            .response-input {
                border-radius: 8px;
                margin-left: 5px;
            }
            .carousel-inner img {
                max-height: 250px;
                object-fit: cover;
            }
            .card-img-overlay {
                background: rgba(0, 0, 0, 0.25);
            }
            .scrollable-cell {
                max-height: 100px;
                overflow-y: auto;
            }
            .card-title {
                font-size: 16px; /* Đặt kích thước chữ cố định */
                white-space: nowrap; /* Tránh tràn chữ */
                overflow: hidden; /* Ẩn phần chữ bị tràn */
                text-overflow: ellipsis; /* Thêm dấu "..." ở cuối nếu chữ bị tràn */
                width: 100%; /* Đảm bảo chiều rộng của phần tử phù hợp với thẻ cha */
            }
        </style>

        <style>
            .modal-content {
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                padding: 20px;
            }

            .modal-header {
                border-bottom: 2px solid crimson;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }

            .modal-title {
                font-weight: bold;
                color: crimson;
            }

            .store-info {
                color: crimson;
                margin-bottom: 10px;
            }

            .store-info .store-title {
                font-size: 20px;
                margin-bottom: 5px;
            }

            .store-info .contact-info {
                font-size: 14px;
            }

            .order-number {
                font-weight: bold;
                font-size: 30px;
                color: crimson;
                text-align: center;
                margin-bottom: 20px;
            }

            .actions {
                text-align: right;
                margin-bottom: 10px;
            }

            .customer-info, .order-info {
                margin-bottom: 20px;
            }

            /* Specific table styles for the modal */
            .modal-content table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            .modal-content table,
            .modal-content th,
            .modal-content td {
                border: 1px solid crimson;
            }

            .modal-content th {
                background-color: crimson;
                color: white;
                padding: 10px;
                text-align: center;
            }

            .modal-content td {
                padding: 8px;
                text-align: left;
            }

            .total {
                font-weight: bold;
                text-align: right;
                font-size: 18px;
                margin-top: 20px;
            }

            .email-form {
                margin-top: 20px;
                padding: 20px;
                background-color: #f8f8f8;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .email-form h4 {
                margin-bottom: 15px;
                color: crimson;
            }

            .email-form .form-label {
                color: #333;
            }

            .email-form .form-control {
                border-radius: 5px;
                border: 1px solid crimson;
            }

            .email-form .btn-primary {
                background-color: crimson;
                border-color: crimson;
            }

            .email-form .btn-primary:hover {
                background-color: #d70000;
                border-color: #d70000;
            }

        </style>
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

                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded p-2 mx-0">
                        <div class="container row">
                            <h1 class="text-dark  col-md-6 mt-3 mb-2 display-3">Manage Orders</h1><fmt:formatNumber value="${i.price}" type='number' groupingUsed='true'/> 
                            <h5 class="text-danger col-md-6 mt-3 mb-2  display-4"style="text-align: right;">Total: <fmt:formatNumber value="${total}" type='number' groupingUsed='true'/> VND (SOLD)</h5>
                        </div>
                        <!-- Search by Name or Email -->
                        <div class="container col-md-6 mb-3" style="width: 60%; float: right;">
                            <form class="d-flex" role="search" action="manageorders" method="get">
                                <div class="input-group mt-4">
                                    <c:set var="placeholderText" value="Search by Customer Name,Username,Phone or Address" />
                                    <c:if test="${not empty requestScope.search}">
                                        <c:set var="placeholderText" value="Search: ${requestScope.search}" />
                                    </c:if>
                                    <input class="form-control me-2" type="search" 
                                           placeholder="${placeholderText}"
                                           aria-label="Search" name="search">
                                    <button class="btn btn-outline-success" type="submit">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                            </form>
                        </div>


                        <div class="container col-md-3 mb-3" style="width: 20%;">
                            <form action="manageorders" method="get" style="display: inline;">
                                <div class="input-group mt-4">
                                    <select class="form-select form-select-sm" id="statusSearch" name="statusSearch">
                                        <option value="0" ${param.statusSearch == 0 ? 'selected' : ''}>All</option>
                                        <option value="1" ${param.statusSearch == 1 ? 'selected' : ''}>Pending</option>
                                        <option value="2" ${param.statusSearch == 2 ? 'selected' : ''}>Rejected</option>
                                        <option value="3" ${param.statusSearch == 3 ? 'selected' : ''}>Packaging</option>
                                        <option value="4" ${param.statusSearch == 4 ? 'selected' : ''}>Shipping</option>
                                        <option value="5" ${param.statusSearch == 5 ? 'selected' : ''}>Received</option>
                                        <option value="6" ${param.statusSearch == 6 ? 'selected' : ''}>Return</option>
                                        <option value="7" ${param.statusSearch == 7 ? 'selected' : ''}>Receive goods back</option>
                                    </select>
                                    <button class="btn btn-outline-success" type="submit">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                            </form>
                        </div>

                        <div class="container p-4">
                            <c:if test="${not empty alertMessage}">
                                <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                    ${alertMessage}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <div class="table-responsive">
                                <table class="table table-bordered table-light">
                                    <thead>
                                        <tr class="text-center">
                                            <th style="width: 5%;">Code</th>
                                            <th style="width: 30%;">Customer Name</th>
                                            <th style="width: 10%;">Phone</th>
                                            <th style="width: 20%;">Customer Note</th>
                                            <th style="width: 15%;">Amount</th>
                                            <th style="width: 15%;">Status</th>
                                            <th style="width: 5%;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="order" items="${orders}">
                                            <tr>
                                                <td style="text-align: center;">${order.id}</td>

                                                <c:forEach items="${customer}" var="c">
                                                    <c:if test="${order.customer_id == c.id}">
                                                        <td>${c.firstname} ${c.lastname}</td>
                                                        <td style="text-align: center;">${c.phone}</td>
                                                    </c:if>
                                                </c:forEach>

                                                <td>${order.note}</td>

                                                <td style="text-align: right;">
                                                    <c:forEach items="${sum}" var="e">
                                                        <c:if test="${order.id == e.key}">
                                                            <fmt:formatNumber value="${e.value}" type='number' groupingUsed='true'/>
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td style="text-align: center;">
                                                    <c:choose>
                                                        <c:when test="${compareStatus[order.id] == 1}">
                                                            <!-- Debug Output -->
                                                            <form action="manageorders" method="post" style="display: inline;">
                                                                <input type="hidden" name="orderId" value="${order.id}"/>
                                                                <div class="input-group">
                                                                    <select class="form-select form-select-sm" id="status" name="status">
                                                                        <option value="1" ${order.order_status == 1 ? 'selected' : ''}>Pending</option>
                                                                        <option value="2" ${order.order_status == 2 ? 'selected' : ''}>Rejected</option>
                                                                        <option value="3" ${order.order_status == 3 ? 'selected' : ''}>Packaging</option>
                                                                        <option value="4" ${order.order_status == 4 ? 'selected' : ''}>Shipping</option>
                                                                        <option value="7" ${order.order_status == 7 ? 'selected' : ''}>Receive goods back</option>
                                                                    </select>
                                                                    <button type="submit" name="action" class="btn btn-sm btn-primary">
                                                                        <i class="bi bi-arrow-repeat"></i>
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:choose>
                                                                <c:when test="${order.order_status == 2}">
                                                                    <span class="badge bg-danger">Rejected</span>
                                                                </c:when>
                                                                <c:when test="${order.order_status == 4}">
                                                                    <span class="badge bg-warning">Shipping</span>
                                                                </c:when>
                                                                <c:when test="${order.order_status == 5}">
                                                                    <span class="badge bg-success">Received</span>
                                                                </c:when>
                                                                <c:when test="${order.order_status == 6}">
                                                                    <span class="badge bg-danger">Return goods</span>
                                                                </c:when>
                                                                <c:when test="${order.order_status == 7}">
                                                                    <span class="badge bg-secondary">Receive goods back</span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <!-- Default case, should not happen if statuses are correctly handled -->
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <!-- View Button -->
                                                    <button type="button" class="btn btn-info btn-sm" title="View" data-bs-toggle="modal" data-bs-target="#viewModal_proID_${order.id}">
                                                        <i class="bi bi-eye"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>

                            <!--pagination-->
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=1">Previous</a></li>
                                        <c:if test="${param.pageNumber==1}">
                                        <li class="page-item disabled">
                                            <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${requestScope.numberOfPage<=5}">
                                        <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                            <li class="page-item ${i==param.pageNumber?"active":""}">
                                                <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${i}">${i}</a>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.numberOfPage>5}">
                                        <c:choose>
                                            <c:when test="${param.pageNumber-3<=0}">
                                                <c:forEach begin="1" end="5" var="i">
                                                    <li class="page-item ${i==param.pageNumber?"active":""}">
                                                        <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${i}">${i}</a>
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
                                                        <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>

                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a class="page-link" href="#">...</a>
                                                </li>
                                                <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                                    <li class="page-item ${i==param.pageNumber?"active":""}">
                                                        <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${i}">${i}</a>
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
                                           href="<%=request.getContextPath()%>/manageorders?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}"
                                           aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${numberOfPage}">End</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

                <!-- Modal for Viewing Details -->
                <c:forEach var="entry" items="${odDetails}">
                    <c:set var="orderId" value="${entry.key}"/>
                    <c:set var="orderdetail" value="${entry.value}"/>
                    <div class="modal fade" id="viewModal_proID_${orderId}" tabindex="-1" aria-labelledby="viewModalLabel1" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <!-- Modal content -->
                            <div class="modal-content bg-light">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="viewModalLabel1">Order Details</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="actions">
                                        <a href="createPDF?action=1&id=${orderId}" target="_blank">PDF</a>

                                    </div>
                                    <div class="card bg-light text-dark">
                                        <div class="card-body">
                                            <div class="container">
                                                <div class="header">
                                                    <div class="store-info">
                                                        <div class="store-title"><strong>Linh and Associates Store</strong></div>
                                                        <div class="contact-info">
                                                            <div>Address: FPT University HL</div>
                                                            <div>Phone: 123456789</div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="order-number">
                                                    Orders
                                                </div>
                                                <div class="actions" style="text-align: center;">
                                                    Date:  ${currentDate}
                                                </div>
                                                <div class="customer-info">
                                                    <strong>CUSTOMER INFORMATION</strong>
                                                    <hr>
                                                    <c:set var="found" value="false" scope="page" />

                                                    <c:forEach items="${orders}" var="order">
                                                        <c:if test="${found == false}">
                                                            <c:if test="${order.id == orderId}">
                                                                <c:set var="found" value="true" scope="page" />
                                                                <c:forEach items="${customer}" var="c">
                                                                    <c:if test="${order.customer_id == c.id}">
                                                                        <p>Customer Name: ${c.firstname} ${c.lastname}
                                                                            <br/>Phone: ${c.phone}
                                                                        </p>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:if>
                                                        </c:if>
                                                    </c:forEach>

                                                </div>
                                                <div class="order-info">
                                                    <strong>ORDER INFORMATION</strong>
                                                    <hr>
                                                    <p>Order ID: ${orderId}</p>
                                                    <p>Product List</p>
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th style="width: 5%;">No.</th>
                                                                <th style="width: 45%;">Product Name</th>
                                                                <th style="width: 15%;">Unit Price</th>
                                                                <th style="width: 15%;">Quantity</th>
                                                                <th style="width: 30%;">Total</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:set var="totalPrice" value="0" />
                                                            <c:forEach items="${orderdetail}" var="od" varStatus="loop">
                                                                <tr>
                                                                    <td>${loop.index + 1}</td>
                                                                    <td>
                                                                        <c:forEach items="${product}" var="product">
                                                                            <c:if test="${od.product_id == product.id}">
                                                                                ${product.name}
                                                                            </c:if>
                                                                        </c:forEach>
                                                                    </td>
                                                                    <td class="text-end"><fmt:formatNumber value="${od.price}" type='number' groupingUsed='true'/></td>
                                                                    <td class="text-end">
                                                                        <c:set var="quantity" value="0" />
                                                                        <c:forEach items="${serial}" var="serial">
                                                                            <c:if test="${serial.id == od.serial_number_id}">
                                                                                <c:set var="quantity" value="${quantity + 1}" />
                                                                            </c:if>
                                                                        </c:forEach>
                                                                        ${quantity}
                                                                    </td>
                                                                    <td class="text-end"><fmt:formatNumber value="${od.price * quantity}" type='number' groupingUsed='true'/></td>
                                                                    <c:set var="totalPrice" value="${totalPrice + (od.price * quantity)}" />
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                        <tfoot>
                                                            <tr>
                                                                <td colspan="4">Total</td>
                                                                <td class="text-end"><fmt:formatNumber value="${totalPrice}" type='number' groupingUsed='true'/> VNĐ</td>
                                                            </tr>
                                                        </tfoot>
                                                    </table>
                                                </div>
                                            </div>


                                        </div>

                                    </div>z
                                </div>
                            </div>
                            <!-- End content -->
                        </div>
                    </div>
                </c:forEach>
                <!-- End of Modal -->

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

        <!-- End Modal for Viewing Details -->
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybVuL5jB5tb/daSZktj53WPcg6EdTIHOq2TEscKr7k9SZg7E6" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-pib6gN6QOymjq1LAiw3OfTbCktdTzFJZZo6IVZ/kEdfmDnnm/tro2l9f4pI+pbDy" crossorigin="anonymous"></script>

    </body>
</html>
