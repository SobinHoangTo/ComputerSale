<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <h2>Order Detail</h2>
        <div>
            <div class="card mb-3">
                <div class="card-body">
                    <!-- Repeat this block for each product in the order -->
                    <c:forEach items="${listProductOrder}" var="po">
                        <c:forEach items="${listProduct}" var="p">
                            <c:if test="${po.product_id == p.id}">
                                <div class="row mb-3">
                                    <div class="col-md-2">
                                        <img src="<%=request.getContextPath()%>/Image/Products/${p.representImage}" class="img-fluid" alt="Product Image">
                                    </div>
                                    <div class="col-md-6">
                                        <h5 class="card-title">${p.name}</h5>
                                        <p class="card-text">ID : ${p.id}</p>
                                        <p class="card-text"><small class="text-muted">SERI: ${po.serial_number_id}</small></p>
                                    </div>
                                    <div class="col-md-2">
                                        <span class="badge bg-danger">15 days return</span>
                                    </div>
                                    <div class="col-md-2 text-end">
                                        <p class="card-text">₫${p.price}</p>
                                    </div>
                                </div>
                                
                                <!-- Feedback Form -->
                                <c:if test="${!feedbackMap[po.id]}">
                                    <form method="post" action="feedback">
                                        <input type="hidden" name="orderDetailId" value="${po.id}">
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
                                            <textarea class="form-control" id="feedback-${po.id}" name="feedback" rows="3"></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit Feedback</button>
                                    </form>
                                </c:if>
                                <c:if test="${feedbackMap[po.id]}">
                                    <div class="alert alert-success mt-3" role="alert">
                                        <strong>Your Rating:</strong> ${feedbackMap[po.id].rating} Stars<br>
                                        <strong>Your Feedback:</strong> ${feedbackMap[po.id].feedback}
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                    <!-- End of product block -->
                </div>
            </div>
            <div class="d-flex justify-content-between">
                <div>
                    <p class="fw-bold">Total: ₫25,500</p>
                </div>
            </div>
        </div>
        <!--footer-->
        <%@ include file="../HeadFoot/Footer.jsp" %>
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
