<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
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
    </head>
    <body>


        <div class="site-wrap">
            <!--Header-->
            <%@ include file="../HeadFoot/Header.jsp" %>
            <!--end Header-->

            <div class="bg-light py-3">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 mb-0"><a href="home">Home</a> <span class="mx-2 mb-0">/</span> <a href="carts">Cart</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Checkout</strong></div>
                    </div>
                </div>
            </div>

            <div class="site-section">
                <div class="container">
                    <!--ask customer-->
                    <form action="payment" method="post">
                        <div class="row">
                            <div class="col-md-6 mb-5 mb-md-0">
                                <h2 class="h3 mb-3 text-black">Billing Details</h2>
                                <div class="p-3 p-lg-5 border">

                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label for="c_address" class="text-black">Name</label>
                                            <input type="text" class="form-control" value="${sessionScope.currentCustomer.getFirstname()} ${sessionScope.currentCustomer.getLastname()}" readonly>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label for="c_address" class="text-black">Address <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="address" value="${sessionScope.currentCustomer.getAddress()}" name="address" placeholder="Street address" >
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <label for="c_address" class="text-black">Phone <span class="text-danger">*</span></label>
                                            <input type="text" class="form-control" id="phone" value="${sessionScope.currentCustomer.getPhone()}" name="phone" placeholder="Phone number" >
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label for="c_order_notes" class="text-black">Order Notes</label>
                                        <textarea name="note" id="c_order_notes" cols="30" rows="5" class="form-control" placeholder="Write your notes here..."></textarea>
                                    </div>

                                </div>
                            </div>
                            <div class="col-md-6">
                                <!--Coupon Code-->

                                <!--end Coupon Code-->
                                <div class="row mb-5">
                                    <div class="col-md-12">
                                        <h2 class="h3 mb-3 text-black">Your Order</h2>
                                        <div class="p-3 p-lg-5 border">
                                            <table class="table site-block-order-table mb-5">
                                                <thead>
                                                <th>Product</th>
                                                <th>Total</th>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="i" items="${order}">
                                                        <tr>
                                                            <td>${i.getValue().getProduct().getName()} <strong class="mx-2">x</strong> ${i.getValue().getQuantity()}</td>
                                                            <td>${i.getValue().getProduct().getPrice()*i.getValue().getQuantity()}</td>
                                                        </tr>
                                                    </c:forEach>

                                                    <tr>
                                                        <td class="text-black font-weight-bold"><strong>Order Total</strong></td>
                                                        <td class="text-black font-weight-bold"><strong>${requestScope.totalPrice}VNĐ</strong></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                            <div class="border p-3 mb-3">
                                                <h3 class="h6 mb-0"><a class="d-block" data-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">Direct Bank Transfer</a></h3>

                                                <div class="collapse" id="collapsebank">
                                                    <div class="py-2">
                                                        <p class="mb-0">Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order won’t be shipped until the funds have cleared in our account.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <input type="hidden" value="${requestScope.totalPrice}" name="amount">
                                                <input type="submit" class="btn btn-primary btn-lg py-3 btn-block" value="Place Order">
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>

                    <!-- </form> -->
                </div>
            </div>

            <!--Footer-->
            <%@ include file="../HeadFoot/Footer.jsp" %>
        </div>

        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>

        <script src="js/main.js"></script>
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    </body>
</html>