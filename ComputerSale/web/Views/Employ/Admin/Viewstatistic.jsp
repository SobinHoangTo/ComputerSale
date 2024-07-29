<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home Admin</title>
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


                <!-- Sale & Revenue Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-line fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Today Sale</p>
                                    <h6 class="mb-0"><fmt:formatNumber value="${requestScope.lineData.get(requestScope.lineData.size()-1)}" type='number' groupingUsed='true'/> VND</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total Sale</p>
                                    <h6 class="mb-0"><fmt:formatNumber value="${requestScope.totalSale}" type='number' groupingUsed='true'/> VND</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-area fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Today Product Sold</p>
                                    <h6 class="mb-0"><fmt:formatNumber value="${requestScope.todaySold}" type='number' groupingUsed='true'/></h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Total of Product Sold</p>
                                    <h6 class="mb-0"><fmt:formatNumber value="${requestScope.totalSold}" type='number' groupingUsed='true'/></h6>
                                </div>
                            </div>
                        </div>
                        <!-- Sales Chart Start -->
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Product Sales By Last 10 Days</h6>
                                </div>

                                <canvas id="products-sales" style="width:100%;max-width:600px"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Product Sales By Categories</h6>
                                </div>
                                <canvas id="categories-sales" style="width:100%;max-width:600px"></canvas>
                            </div>
                        </div>
                        <!-- Sales Chart End -->

                        <!-- Recent Sales Start -->
                        <div class="container-fluid">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Recent Orders</h6>
                                    <a href="<%=request.getContextPath()%>/manageorders">Show All</a>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-black">
                                                <th scope="col">Date</th>
                                                <th scope="col">Invoice</th>
                                                <th scope="col">Customer</th>
                                                <th scope="col">Amount</th>
                                                <th scope="col">Status</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="i" items="${requestScope.orderList}">
                                                <tr>
                                                    <td>${i.get(0)}</td>
                                                    <td>${i.get(1)}</td>
                                                    <td>${i.get(2)}</td>
                                                    <td><fmt:formatNumber value="${i.get(3)}" type='number' groupingUsed='true'/> VNĐ</td>
                                                    <td>${i.get(4)!=null?"Paid":"Not Paid"}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Recent Sales End -->
                        <!--Start rating-->
                        <div class="container-fluid">
                            <div class="row g-4">
                                <!--Cusomer-->
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4 col-md-12">Product rate</h6>
                                        <div class="card-deck row row-cols-2">
                                            <!-- Start loop -->
                                            <div class="col">
                                                <div class="card border-success mb-3">
                                                    <div class="card-body text-center">
                                                        <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" alt="Product Image" class="rounded-circle mb-3" style="width: 100px; height: 100px;">
                                                        <h5 class="card-title mb-1" style="margin-bottom: .25rem;">${productRateList.get(0).get(0)}</h5>
                                                        <p class="card-text mb-2" style="margin-bottom: .5rem;">Average: ${productRateList.get(0).get(1)}</p>
                                                        <div class="rating">
                                                            <c:forEach var="i" begin="1" end="5">
                                                                <c:if test="${productRateList.get(0).get(1)-i>=0}">
                                                                    <span class="fa fa-star checked" style="color: orange;"></span>
                                                                </c:if>
                                                                <c:if test="${productRateList.get(0).get(1)-i<0}">
                                                                    <span class="fa fa-star" style="color: #ddd;"></span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer text-muted text-center" style="color: #6c757d;">
                                                        <small>Last updated 3 mins ago</small>
                                                    </div>
                                                </div>

                                                <!-- Add this to the head of your HTML to include Font Awesome -->
                                                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

                                            </div>
                                            <div class="col">
                                                <div class="card border-danger mb-3">
                                                    <div class="card-body text-center">
                                                        <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" alt="Product Image" class="rounded-circle mb-3" style="width: 100px; height: 100px;">
                                                        <h5 class="card-title mb-1" style="margin-bottom: .25rem;">${productRateList.get(productRateList.size()-1).get(0)}</h5>
                                                        <p class="card-text mb-2" style="margin-bottom: .5rem;">Average: ${productRateList.get(productRateList.size()-1).get(1)}</p>
                                                        <div class="rating" >
                                                            <c:forEach var="i" begin="1" end="5">
                                                                <c:if test="${productRateList.get(productRateList.size()-1).get(1)-i>=0}">
                                                                    <span class="fa fa-star checked" style="color: orange;"></span>
                                                                </c:if>
                                                                <c:if test="${productRateList.get(productRateList.size()-1).get(1)-i<0}">
                                                                    <span class="fa fa-star" style="color: #ddd;"></span>
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer text-muted text-center" style="color: #6c757d;">
                                                        <small>Last updated 3 mins ago</small>
                                                    </div>
                                                </div>


                                            </div>
                                            <!-- End loop -->
                                        </div>
                                    </div>
                                </div>
                                <!--end customer-->

                                <!--Product rating-->
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4">Testimonial</h6>
                                        <div class="card-deck row row-cols-2">
                                            <!-- Start loop -->
                                            <div class="col">
                                                <div class="card">
                                                    <div class="card-body text-center">
                                                        <img class="rounded-circle mb-3" src="img/testimonial-1.jpg" alt="" width="100" height="100">
                                                        <h5 class="card-title mb-1" style="margin-bottom: .25rem;">Good Customer</h5>
                                                        <p class="card-text  mb-2">This customer provided excellent feedback and was highly satisfied with our service.</p>
                                                    </div>
                                                    <div class="card-footer text-center">
                                                        <small class="text-muted">Last updated 3 mins ago</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col">
                                                <div class="card">
                                                    <div class="card-body text-center">
                                                        <img class="rounded-circle mb-3" src="img/testimonial-2.jpg" alt="" width="100" height="100">
                                                        <h5 class="card-title mb-1" style="margin-bottom: .25rem;">Bad Customer</h5>
                                                        <p class="card-text  mb-2">This customer had a negative experience and expressed dissatisfaction with our product.</p>
                                                    </div>
                                                    <div class="card-footer text-center">
                                                        <small class="text-muted">Last updated 3 mins ago</small>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End loop -->
                                        </div>


                                    </div>
                                </div>
                                <!--end product rating-->
                            </div>
                        </div>
                        <!--end rating-->

                        <!--product quality-->
                        <div class="container-fluid">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Product quality</h6>
                                    <form action="viewstatistic" method="post" id="formQuality">
                                        <select name="type" onchange="document.getElementById('formQuality').submit()">
                                            <option value="1" >Best quality</option>
                                            <option value="2" ${param.type==2?"selected":""}>Worst quality</option>
                                        </select>
                                    </form>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-black">
                                                <th scope="col">Product ID</th>
                                                <th scope="col">Product Name</th>
                                                <th scope="col">Number of Warranty Claims</th>
                                                <th scope="col">Total Units Sold</th>
                                                <th scope="col">Quality Rating</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="i" items="${requestScope.productQualityList}">
                                                <tr>
                                                    <td>${i.get(0)}</td>
                                                    <td>${i.get(1)}</td>
                                                    <td>${i.get(2)}</td>
                                                    <td>${i.get(3)}</td>
                                                    <td>${i.get(4)>=0.7?"Good":i.get(4)>=0.4?"Medium":"Bad"}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!--end quality-->
                    </div>
                </div>
                <!-- Sale & Revenue End -->

                <!-- Footer Start -->
                <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
                <!-- Footer End -->
            </div>
            <!-- Content End -->
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script>
                                            new Chart("products-sales", {
                                                type: "line",
                                                data: {
                                                    labels: ${requestScope.last10Day},
                                                    datasets: [{
                                                            fill: false,
                                                            lineTension: 0,
                                                            backgroundColor: "rgba(0,0,255,1.0)",
                                                            borderColor: "rgba(0,0,255,0.1)",
                                                            data: ${requestScope.lineData}
                                                        }]
                                                },
                                                options: {
                                                    legend: {display: false}
                                                }
                                            });
        </script>
        <script>
            new Chart("categories-sales", {
                type: "bar",
                data: {
                    labels: ${requestScope.category},
                    datasets: [{
                            backgroundColor: ["red", "green", "blue", "orange", "brown"],
                            data: ${requestScope.chartData}
                        }]
                },
                options: {
                    legend: {display: false}
                }
            });
        </script>
    </body>
</html>
