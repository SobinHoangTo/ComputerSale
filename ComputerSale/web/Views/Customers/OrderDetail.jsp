<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping History</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="cssC/bootstrap.min.css">
        <link rel="stylesheet" href="cssC/magnific-popup.css">
        <link rel="stylesheet" href="cssC/jquery-ui.css">
        <link rel="stylesheet" href="cssC/owl.carousel.min.css">
        <link rel="stylesheet" href="cssC/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="cssC/aos.css">
        <link rel="stylesheet" href="cssC/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="site-wrap">
            <!--header-->
            <%@ include file="../HeadFoot/Header.jsp" %>

            <div class="bg-light py-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 mb-0"><a href="home">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Cart</strong></div>
                    </div>
                </div>
            </div>

            <div class="container mt-5">
                <h2>Order Detail</h2><br/>
                <div class="row mb-3">
                    <div class="col-md-5">
                        <h5 class="card-text">Customer: ${customer}</h5>
                        <p class="card-text"><strong>Address:</strong> ${orderInfor.address}</p>
                        <p class="card-text"><strong>Phone:</strong> ${orderInfor.phone}</p>
                    </div>
                    <div class="col-md-3">
                        <p class="card-text"><strong>Order date: </strong>${orderInfor.order_date}</p>
                        <p class="card-text"><strong>Paid date: </strong>${orderInfor.paid_date}</p>
                        <strong>Status: </strong>
                        <c:if test="${o.order_status == 1}">
                            <p class="badge bg-info">Pending</p>
                        </c:if>
                        <c:if test="${orderInfor.order_status == 2}">
                            <p class="badge bg-danger">Rejected</p>
                        </c:if>
                        <c:if test="${orderInfor.order_status == 3}">
                            <p class="badge bg-primary">Packaging</p>
                        </c:if>
                        <c:if test="${orderInfor.order_status == 4}">
                            <p class="badge bg-warning">Shipping</p>
                        </c:if>
                        <c:if test="${orderInfor.order_status == 5}">
                            <p class="badge bg-success">Received</p>
                        </c:if>
                        <c:if test="${orderInfor.order_status == 6}">
                            <p class="badge bg-dark">Return goods</p>
                        </c:if>
                        <c:if test="${orderInfor.order_status == 7}">
                            <p class="badge bg-secondary">Receive goods back</p>
                        </c:if>
                    </div>
                    <div class="col-md-4">
                        <p class="card-text"><strong>Note: </strong>${orderInfor.note}</p>
                    </div>
                </div>
                <c:forEach items="${listProductOrder}" var="po">
                    <c:forEach items="${listProduct}" var="p">
                        <c:if test="${po.product_id == p.id}">
                            <div class="card mb-3">

                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-md-2">
                                            <a href="productdetails?id=${p.id}">
                                                <img src="<%=request.getContextPath()%>/Image/Products/${p.representImage}" class="img-fluid" alt="Product Image">
                                            </a>
                                        </div>
                                        <div class="col-md-6">
                                            <h5 class="card-title"><a href="productdetails?id=${p.id}">${p.name}</a></h5>
                                            <p class="card-text">ID : ${p.id}</p>
                                            <p class="card-text"><small class="text-muted">SERI: ${po.serial_number_id}</small></p>
                                        </div>
                                        <div class="col-md-2">
                                            <span class="badge bg-danger">15 days return</span>
                                        </div>
                                        <div class="col-md-2 text-end">
                                            <p class="card-text">₫<fmt:formatNumber value="${p.price}" type='number' groupingUsed='true'/></p>
                                        </div>
                                    </div>

                                    <!-- Feedback Form -->
                                    <c:if test="${orderInfor.order_status == 5}">
                                        <c:choose>
                                            <c:when test="${feedbackMap[po.id] == null}">
                                                <form method="post" action="feedback">
                                                    <input type="hidden" name="orderDetailId" value="${po.id}">
                                                    <input type="hidden" name="orderId" value="${orderId}">
                                                    <div class="mb-3">
                                                        <label for="rating-${po.id}" class="form-label">Rating:</label>
                                                        <select class="form-select" id="rating-${po.id}" name="rating">
                                                            <option value="1">1 Star</option>
                                                            <option value="2">2 Stars</option>
                                                            <option value="3">3 Stars</option>
                                                            <option value="4">4 Stars</option>
                                                            <option value="5">5 Stars</option>
                                                        </select>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="feedback-${po.id}" class="form-label">Feedback:</label>
                                                        <textarea class="form-control" id="feedback-${po.id}" name="feedback" rows="3" placeholder="Leave your feedback here"></textarea>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Submit Feedback</button>
                                                </form>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="alert alert-success mt-3" role="alert">
                                                    <strong>Your Rating:</strong>
                                                    <c:forEach begin="1" end="${feedbackMap[po.id].star_rate}" var="i">★</c:forEach>
                                                    <c:forEach begin="${feedbackMap[po.id].star_rate + 1}" end="5" var="i">☆</c:forEach><br/>
                                                    <strong>Your Feedback:</strong> ${feedbackMap[po.id].feedback}
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:forEach>
                <!--footer-->
                <%@ include file="../HeadFoot/Footer.jsp" %>
            </div>
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
