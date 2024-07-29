<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">


        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/style.css">    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">


        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!--filter products-->
        <div class="row">
            <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">Found: ${numberOfItems} result(s)</h2></div>
                <div class="d-flex">
                    <div class="dropdown mr-1 ml-md-auto">
                        
                    </div>
                    <div class="btn-group">
                        <button type="button" class="btn btn-secondary btn-sm dropdown-toggle" id="dropdownMenuReference" data-toggle="dropdown">Reference</button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuReference">
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/productslist">Relevance</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/productslist?sort=1">Name, A to Z</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/productslist?sort=2">Name, Z to A</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/productslist?sort=3">Price, low to high</a>
                            <a class="dropdown-item" href="<%=request.getContextPath()%>/productslist?sort=4">Price, high to low</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--product list-->
        <div class="row mb-5">
            <c:forEach var="i" items="${requestScope.pList}" varStatus="status">
                <div class="col-sm-6 col-lg-4 mb-4 d-flex align-items-stretch" data-aos="fade-up">
                    <div class="block-4 text-center border d-flex flex-column" style="width: 100%; max-width: 300px; overflow: hidden;">
                        <figure class="block-4-image" style="height: 200px; overflow: hidden;">
                            <a href="productdetails?id=${i.getId()}">
                                <img src="<%=request.getContextPath()%>/Image/Products/${i.representImage}" alt="Image placeholder" class="img-fluid" style="width: 100%; height: 100%; object-fit: cover;">
                            </a>
                        </figure>
                        <div class="block-4-text p-4 d-flex flex-column justify-content-between flex-grow-1">
                            <h3 class="h-50" style="height: 60px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; word-wrap: break-word;">
                                <a href="<%=request.getContextPath()%>/productdetails/${i.getId()}-${i.getName().toLowerCase().replaceAll("\\s", "-")}" style="display: block; height: 100%;">${i.getName()}</a>
                            </h3>
                            <p class="text-primary font-weight-bold">
                                <c:set var="discountFound" value="false" />
                                <c:forEach var="d" items="${requestScope.discount}">
                                    <c:if test="${i.id == d.key}">
                                        <span class="text-primary" style="text-decoration: line-through;"><fmt:formatNumber value="${i.price}" type='number' groupingUsed='true'/> VND</span>
                                        <br/>
                                        <c:set var="discountedPrice" value="${(i.price * (1 - d.value / 100)).intValue()}" />
                                        <span class="text-danger"> <fmt:formatNumber value="${discountedPrice}" type='number' groupingUsed='true'/> VND </span>
                                        <span class="badge badge-danger">${d.value}%</span>
                                        <c:set var="discountFound" value="true" />
                                    </c:if>
                                </c:forEach>
                                <c:if test="${not discountFound}">
                                   <fmt:formatNumber value="${i.price}" type='number' groupingUsed='true'/> VND
                                </c:if>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <!--paging-->
        <div class="row" data-aos="fade-up">
            <div class="col-md-12 text-right">
                <div class="site-block-27">
                    <ul>


                        <c:if test="${requestScope.numberOfPage>1}">
                            <li class="">
                                <a href="<%=request.getContextPath()%>/productslist?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}">&lt;</a>
                            </li> 
                        </c:if>

                        <c:if test="${requestScope.numberOfPage<=5}">
                            <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                <li class=" ${i==param.pageNumber?"active":""}">
                                    <a href="<%=request.getContextPath()%>/productslist?pageNumber=${i}">${i}</a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.numberOfPage>5}">
                            <c:choose>
                                <c:when test="${param.pageNumber-3<=0}">
                                    <c:forEach begin="1" end="5" var="i">
                                        <li class=" ${i==param.pageNumber?"active":""}">
                                            <a href="<%=request.getContextPath()%>/productslist?pageNumber=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li>
                                        <a href="#">...</a>
                                    </li>
                                </c:when>
                                <c:when test="${param.pageNumber+2>=requestScope.numberOfPage}">
                                    <li>
                                        <a href="#">...</a>
                                    </li>
                                    <c:forEach begin="${requestScope.numberOfPage-4}" end="${requestScope.numberOfPage}" var="i">
                                        <li class=" ${i==param.pageNumber?"active":""}">
                                            <a href="<%=request.getContextPath()%>/productslist?pageNumber=${i}">${i}</a>
                                        </li>
                                    </c:forEach>

                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="#">...</a>
                                    </li>
                                    <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                        <li class=" ${i==param.pageNumber?"active":""}">
                                            <a href="<%=request.getContextPath()%>/productslist?pageNumber=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                    <li>
                                        <a href="#">...</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${requestScope.numberOfPage>1}">
                            <li class="">
                                <a href="<%=request.getContextPath()%>/productslist?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}">&gt;</a>
                            </li>
                        </c:if>

                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
