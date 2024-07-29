<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="<%=request.getContextPath()%>/Image/laptop-icon.png" type="image/x-icon">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Info</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        #frame {
            width: 500px;
            height: 350px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            border: 1px solid #ddd;
            margin-bottom: 10px;
            position: relative;
        }
        .thumbnail-img {
            max-width: 50px;
            margin: 5px;
            cursor: pointer;
        }
        .arrow {
            position: absolute;
            top: 50%;
            background-color: rgba(255, 255, 255, 0.5);
            border: none;
            cursor: pointer;
            padding: 10px;
            padding: 20px;
            font-size: 2em;
        }
        .arrow-left {
            left: 0;
        }
        .arrow-right {
            right: 0;
        }
    </style>
</head>
<body>
    <div class="site-section">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <!-- Main Image Display -->
                    <div id="frame">
                        <button class="arrow arrow-left" onclick="previousImage()">&#8249;</button>
                        <img id="mainImage" class="main-img justify-content-center" src="<%=request.getContextPath()%>/Image/Products/ImgList/${listImage[0].img}" alt="mainImage" width="500px" height="350px">
                        <button class="arrow arrow-right" onclick="nextImage()">&#8250;</button>
                    </div>
                    <!-- Thumbnails -->
                    <div class="container-fluid p-3 bg-light py-3">
                        <div class="row">
                            <c:forEach items="${listImage}" var="image" varStatus="status">
                                <c:if test="${image.product_id == product.id}">
                                    <img class="img-fluid thumbnail-img" style="width: 115px; border: 2px solid #ddd;" onclick="zoomout(this, ${status.index})" src="<%=request.getContextPath()%>/Image/Products/ImgList/${image.img}" alt="detailImages">
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
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
                        <p class="text-danger h3">
                            <c:if test="${requestScope.discount!=null}">
                                <span class="text-primary" style="text-decoration: line-through;">
                                    <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VND
                                </span>
                                <br/>
                                <c:set var="discountedPrice" value="${(product.price * (1 - requestScope.discount / 100)).intValue()}" />
                                <span class="text-danger">
                                    <fmt:formatNumber value="${discountedPrice}" type="number" groupingUsed="true"/> VND
                                </span>
                                <span class="badge badge-danger">${requestScope.discount}%</span>
                                <c:set var="discountFound" value="true" />
                            </c:if>

                            <c:if test="${requestScope.discount==null}">
                                <fmt:formatNumber value="${product.price}" type="number" groupingUsed="true"/> VND
                            </c:if>
                        </p>
                    </div>

                    <div class="row ml-2">
                        <p class="mr-2">
                            <button onclick="AddToCart(${param.id != null?param.id:requestScope.id})"
                                    class="buy-now btn btn-sm btn-primary">Add To Cart</button></p>
                        <p class="ml-2"><a href="<%=request.getContextPath()%>/checkout?productID=${param.id}" class="buy-now btn btn-sm btn-primary">Buy Now</a></p>
                    </div>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        var currentImageIndex = 0;
        var images = [
            <c:forEach items="${listImage}" var="image" varStatus="status">
                <c:if test="${image.product_id == product.id}">
                    "<%=request.getContextPath()%>/Image/Products/ImgList/${image.img}"<c:if test="${!status.last}">,</c:if>
                </c:if>
            </c:forEach>
        ];

        function zoomout(imgElement, index) {
            var mainImage = document.getElementById("mainImage");
            mainImage.src = imgElement.src;
            currentImageIndex = index;
        }

        function previousImage() {
            currentImageIndex = (currentImageIndex - 1 + images.length) >= images.length ? images.length - 1 : (currentImageIndex - 1 + images.length) % images.length;
            document.getElementById("mainImage").src = images[currentImageIndex];
        }

        function nextImage() {
            currentImageIndex = (currentImageIndex + 1) % images.length;
            document.getElementById("mainImage").src = images[currentImageIndex];
        }

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
