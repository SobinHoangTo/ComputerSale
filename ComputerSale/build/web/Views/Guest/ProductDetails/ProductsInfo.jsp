<%-- 
    Document   : ProductsInfor
    Created on : May 20, 2024, 9:23:02 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Info</title>
    </head>
    <body>
        <div class="site-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <img src="<%=request.getContextPath()%>/Image/Products/${product.representImage}" alt="Image" class="img-fluid">
                    </div>
                    <div class="col-md-6 mb-2">
                        <h2 class="text-dark">${product.name}</h2>
                        <div>
                            <p><strong>Name:</strong> ${product.name}</p>
                            <p><strong>CPU:</strong> ${product.CPU}</p>
                            <p><strong>GPU:</strong> ${product.GPU}</p>
                            <p><strong>RAM:</strong> ${product.RAM}</p>
                            <p><strong>ROM:</strong> ${product.ROM}</p>
                            <p><strong>Monitor:</strong> ${product.monitor}</p>
                            <p><strong>Operating System:</strong> ${product.OS}</p>
                            <p><strong>Description:</strong> ${product.description}</p>
                            <p class="text-danger h3"><strong>${product.price} VND</strong></p>
                        </div>

                        <div class="row ml-2">
                            <p class="mr-2">
                                <button onclick="AddToCart(${param.id})"
                                        class="buy-now btn btn-sm btn-primary">Add To Cart</button></p>
                            <p class="ml-2"><a href="payment" class="buy-now btn btn-sm btn-primary">Buy Now</a></p>
                        </div>
                    </div>
                </div>
                <div class="row p-4">
                    <div class="mt-2 col-md-12 ">
                        <h2 class="text-dark">Comment</h2>
                        <c:forEach items="${comment}" var="comment">
                            <c:set value="${comment.value}" var="rate"></c:set>
                                <div class="container bg-light col-md-12 p-4">
                                    <div class="row">
                                        <div class="col-md-8 h4">
                                            <strong> ${comment.key} </strong>
                                    </div>
                                    <div class="col-md-4 text-end">
                                        <p>
                                            <c:forEach begin="1" end="${rate.star_rate}" var="i">★</c:forEach>
                                            <c:forEach begin="${rate.star_rate + 1}" end="5" var="i">☆</c:forEach>
                                            </p>
                                        </div>

                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <strong>Feedback: </strong>
                                        ${rate.feedback}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                                    function AddToCart(id) {
                                        $.ajax({
                                            url: '<%=request.getContextPath()%>/addtocart',
                                            type: 'POST',
                                            data: {id: id},
                                            async: true,
                                            success: function (response) {
                                                try {
                                                    var res = JSON.parse(response);
                                                    if (res) {
                                                        if (res.data) {
                                                            console.log(response);
                                                            var num = parseInt(res.data);
                                                            if (num && num > 0)
                                                                document.getElementById("cartLength").innerHTML = num;
                                                        }

                                                        if (res.error) {
                                                            window.alert(error);
                                                        } else {
                                                            window.alert("Add done <3");
                                                        }
                                                    }
                                                } catch (e) {
                                                    console.log('Exception' + e);
                                                    window.alert("Exception " + e);
                                                }
                                            },
                                            error: function (response) {
                                                console.log('Send reponse unsuccessfully' + response);
                                                window.location = "<%=request.getContextPath()%>/login";
                                            }
                                        });
                                    }
        </script>
    </body>
</html>
