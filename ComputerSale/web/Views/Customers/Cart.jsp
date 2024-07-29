<%-- 
    Document   : Cart
    Created on : May 16, 2024, 12:03:41 AM
    Author     : Nguyễn Quang Minh
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
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
        <style>

            .mid{
                text-align: center;
            }
        </style>

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
            <form class="site-section" method="post" action="<%=request.getContextPath()%>/checkout">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-md-12">
                            <div class="site-blocks-table" id="cartDisplay">
                                <c:if test="${not empty alertMessage}">
                                    <c:forEach var="i" items="${alertMessage}">
                                        <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                            ${i}
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:forEach>

                                </c:if>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="">Select</th>
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-total">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:choose>
                                            <c:when test="${requestScope.cart == null || requestScope.cart.size() == 0}">
                                                <tr>
                                                    <td colspan="7" class="text-center">Cart is empty</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach var="i" items="${requestScope.cart}">
                                                    <tr id="item${i.getValue().getProduct().getId()}">
                                                        <td>
                                                            <input type="checkbox" class="checkbox" value="${i.getValue().getProduct().getId()}" onclick="checkbox()" name="check"/>
                                                        </td>
                                                        <td class="product-thumbnail">
                                                            <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" alt="${i.getValue().getProduct().getName()}" class="img-fluid">
                                                        </td>
                                                        <td class="product-name">
                                                            <h2 class="h5 text-black">${i.getValue().getProduct().getName()}</h2>
                                                        </td>
                                                        <td>${i.getValue().getProduct().getPrice()}VNĐ</td>
                                                        <td>
                                                            <div class="input-group mb-3" style="max-width: 120px;">
                                                                <div class="input-group-prepend">
                                                                    <button class="btn btn-outline-primary" onclick="decreaseQuantity(${i.getValue().getProduct().getId()})" type="button">&minus;</button>
                                                                </div>
                                                                <input type="text" class="form-control text-center" value="${i.getValue().getQuantity()}" id="quantity${i.getValue().getProduct().getId()}" aria-label="Example text with button addon" aria-describedby="button-addon1" readonly>
                                                                <div class="input-group-append">
                                                                    <button class="btn btn-outline-primary" onclick="increaseQuantity(${i.getValue().getProduct().getId()})" type="button">&plus;</button>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td id="totalItemPrice${i.getValue().getProduct().getId()}">
                                                            ${i.getValue().getProduct().getPrice() * i.getValue().getQuantity()}VNĐ
                                                        </td>
                                                        <td>
                                                            <a href="#" onclick="deleteItem(${i.getValue().getProduct().getId()})" class="btn btn-primary btn-sm">X</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="row mb-5">
                                <div class="col-md-6 mb-3 mb-md-0">
                                    <a href="shoppinghistory" class="btn btn-primary btn-sm btn-block">Your history</a>
                                </div>
                                <div class="col-md-6">
                                    <a href="home" class="btn btn-outline-primary btn-sm btn-block">Continue Shopping</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 pl-5">
                            <div class="row justify-content-end">
                                <div class="col-md-7">
                                    <div class="row">
                                        <div class="col-md-12 text-right border-bottom mb-5">
                                            <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                        </div>
                                    </div>
                                    <div class="row mb-5">
                                        <div class="col-md-6">
                                            <span class="text-black">Total</span>
                                        </div>
                                        <div class="col-md-6 text-right">
                                            <strong class="text-black" id="totalPrice">0VNĐ</strong>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <input class="btn btn-primary btn-lg py-3 btn-block" type="submit" value="Proceed To Checkout">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--footer-->
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                                                                function increaseQuantity(id)
                                                                {
                                                                    updateCart(id, 1);
                                                                }
                                                                function decreaseQuantity(id) {
                                                                    updateCart(id, 0);
                                                                }
                                                                function deleteItem(id) {
                                                                    updateCart(id, 2);
                                                                }
                                                                function updateCart(id, value) {
                                                                    $.ajax({
                                                                        url: '<%=request.getContextPath()%>/updatecart',
                                                                        type: 'POST',
                                                                        data: {id: id, value: value},
                                                                        async: true,
                                                                        success: function (response) {
                                                                            var res = JSON.parse(response);
                                                                            if (res) {
                                                                                console.log(response);
                                                                                var quantity = parseInt(res.data);
                                                                                if (quantity === 0) {
                                                                                    document.getElementById('item' + id).remove();
                                                                                } else {
                                                                                    document.getElementById('quantity' + id).value = quantity;
                                                                                    document.getElementById('totalItemPrice' + id).innerHTML = res.totalItemPrice;
                                                                                }
                                                                                if (res.cartLength !== 0) {
                                                                                    document.getElementById('cartLength').innerHTML = res.cartLength;
                                                                                } else {
                                                                                    document.getElementById('cartLength').innerHTML = 0;
                                                                                    document.getElementById('cartDisplay').innerHTML = "Cart is empty";
                                                                                }
                                                                                checkbox();
                                                                            }
                                                                        }
                                                                    });
                                                                }
                                                                function checkbox() {
                                                                    var totalPrice = 0;
                                                                    var elements = document.getElementsByClassName('checkbox');
                                                                    for (var i = 0, length = elements.length; i < length; i++) {
                                                                        if (elements[i].checked) {
                                                                            totalPrice += parseInt(document.getElementById('totalItemPrice' + elements[i].value).innerHTML);
                                                                        }
                                                                    }
                                                                    document.getElementById('totalPrice').innerHTML = totalPrice + "VNĐ";
                                                                }
                                                                function checkboxAll() {
                                                                    var checkAll = document.getElementById('checkAll').checked;
                                                                    var elements = document.getElementsByClassName('checkbox');
                                                                    for (var i = 0, length = elements.length; i < length; i++) {
                                                                        elements[i].checked = checkAll;
                                                                    }
                                                                    checkbox();
                                                                }
        </script>
    </body>
</html>
