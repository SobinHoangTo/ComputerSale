<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta charset="UTF-8">
        <title>Manage Feedback</title>
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
        <style>
            .card-title {
                font-size: 16px; /* Đặt kích thước chữ cố định */
                white-space: nowrap; /* Tránh tràn chữ */
                overflow: hidden; /* Ẩn phần chữ bị tràn */
                text-overflow: ellipsis; /* Thêm dấu "..." ở cuối nếu chữ bị tràn */
                width: 100%; /* Đảm bảo chiều rộng của phần tử phù hợp với thẻ cha */
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


                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded justify-content-center mx-0">
                        <div class="container p-4">
                            <div class="row align-items-center">
                                <div class="col-md-6">
                                    <h1 class="display-3 mt-2 mb-3">Manage Feedback</h1>
                                </div>
                                <div class="col-md-4">
                                    <form class="d-flex" role="search" action="managefeedback" method="get">
                                        <div class="input-group mt-2 mb-3">
                                            <c:set var="placeholderText" value="Search by product name, customer name or feedback" />
                                            <c:if test="${not empty requestScope.searchWords}">
                                                <c:set var="placeholderText" value="Search by Title: ${requestScope.searchWords}" />
                                            </c:if>
                                            <input class="form-control" type="search" placeholder="${placeholderText}" aria-label="Search" name="search">
                                            <button class="btn btn-outline-success" type="submit">
                                                <i class="bi bi-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-md-2">
                                    <div class="d-grid gap-2" style="width: 80%;">
                                        <a href="managefeedback" class="btn btn-primary">
                                            <i class="bi bi-arrow-clockwise"></i> Refresh
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <!-- Alert Message -->
                            <c:if test="${not empty requestScope.alertMessage}">
                                <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                    ${requestScope.alertMessage}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <div class="bg-light rounded p-4">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="table-light">
                                            <tr>
                                                <th style="text-align: center;">ID</th>
                                                <th style="text-align: center;">Product</th>
                                                <th style="text-align: center;">Start rate</th>
                                                <th style="text-align: center;">User Name</th>
                                                <th style="text-align: center;">Feedback</th>
                                                <th style="text-align: center;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${requestScope.feedbackList.entrySet()}" var="entry">
                                                <tr>
                                                    <td>${entry.key.id}</td>
                                                    <td style="max-width: 80px; width: 25%;">
                                                        <a href="productdetails?id=${entry.value.id}"
                                                           >${entry.value.name}
                                                        </a>
                                                    </td> 
                                                    <td>
                                                        <c:forEach var="i" begin="1" end="5">
                                                            <c:choose>
                                                                <c:when test="${i <= entry.key.star_rate}">
                                                                    <i class="bi bi-star-fill text-warning"></i> <!-- Filled star -->
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="bi bi-star text-warning"></i> <!-- Empty star -->
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        ${entry.key.star_rate}
                                                    </td>
                                                    <td>
                                                        <c:forEach items="${customerList}" var="customer">
                                                            ${customer.key==entry.key.id?customer.value.firstname:''}
                                                            ${customer.key==entry.key.id?customer.value.lastname:''}
                                                        </c:forEach>
                                                    </td>
                                                    <td>${entry.key.feedback}</td>
                                                    <td style="text-align: center;">
                                                        <!-- Delete button -->
                                                        <form action="managefeedback" method="post">
                                                            <input type="hidden" name="id" value="${entry.key.id}">
                                                            <input type="hidden" name="action" value="delete">
                                                            <button type="submit" class="btn btn-danger" style="border-radius: 8px;">
                                                                <i class="bi bi-trash"></i>
                                                            </button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/managefeedback?pageNumber=1">Previous</a></li>
                                            <c:if test="${param.pageNumber==1}">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="<%=request.getContextPath()%>/managefeedback?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${requestScope.numberOfPage<=5}">
                                            <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                                <li class="page-item ${i==param.pageNumber?"active":""}">
                                                    <a class="page-link" href="<%=request.getContextPath()%>/managefeedback?pageNumber=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${requestScope.numberOfPage>5}">
                                            <c:choose>
                                                <c:when test="${param.pageNumber-3<=0}">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managefeedback?pageNumber=${i}">${i}</a>
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
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managefeedback?pageNumber=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>

                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a class="page-link" href="#">...</a>
                                                    </li>
                                                    <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managefeedback?pageNumber=${i}">${i}</a>
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
                                               href="<%=request.getContextPath()%>/managefeedback?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/managefeedback?pageNumber=${numberOfPage}">End</a></li>
                                    </ul>
                                </nav>
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
