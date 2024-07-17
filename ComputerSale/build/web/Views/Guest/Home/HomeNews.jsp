<%-- 
    Document   : HomeNews
    Created on : May 19, 2024, 9:02:32 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News Page</title>
    </head>
    <body>
        <div class="container">
            <h1 class="mt-5 mb-4 text-center">Big Sale!</h1>
            <div class="card-columns">
                <c:forEach items="${news}" var="newsItem">
                    <div class="card">
                        <a href="news?id=${newsItem.id}" class="text-decoration-none text-dark">
                            <img class="card-img-top" src="../../../Image/Products/laptops-2048px-5607.png" alt="News Image">
                            <div class="card-body">
                                <h5 class="card-title">${newsItem.title}</h5>
                                <p class="card-text">${newsItem.short_description}</p>
                                <!--<p class="card-text"><small class="text-muted">Last updated </small></p>-->
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </body>
</html>
