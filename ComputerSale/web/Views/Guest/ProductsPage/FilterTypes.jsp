<%-- 
    Document   : FilterTypes
    Created on : May 19, 2024, 10:31:29 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filter Types</title>

    </head>
    <body>
        <div class="border p-4 rounded mb-4">
            <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Filter by price</h3>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="price" type="checkbox" name="listGroupRadio" value=""><span class="text-black">Below 10 million</span>
                </label>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="price" type="checkbox" name="listGroupRadio" value=""><span class="text-black">20 million - 30 million</span>
                </label>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="price" type="checkbox" name="listGroupRadio" value=""><span class="text-black">30 million - 40 million</span>
                </label>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="price" type="checkbox" name="listGroupRadio" value=""><span class="text-black">40 million - 50 million</span>
                </label>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="price" type="checkbox" name="listGroupRadio" value=""><span class="text-black">Above 50 million</span>
                </label>

            </div>
            <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Brand</h3>
                <c:forEach var="i" items="${requestScope.bList}">
                    <div>
                        <input class="mr-2 mt-1" name="brand" type="checkbox" value="${i.getId()}"
                               <c:forEach var="j" items="${sessionScope.brandList}">
                                   ${(j==i.getId())?"checked":''}
                               </c:forEach>
                               >
                    </div>
                </c:forEach>
            </div>
            <div class="mb-4">
                <h3 class="mb-3 h6 text-uppercase text-black d-block">Ram</h3>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="ram" type="checkbox" name="listGroupRadio" value=""><span class="text-black">4GB</span>
                </label>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="ram" type="checkbox" name="listGroupRadio" value=""><span class="text-black">8GB</span>
                </label>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="ram" type="checkbox" name="listGroupRadio" value=""><span class="text-black">16GB</span>
                </label>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="ram" type="checkbox" name="listGroupRadio" value=""><span class="text-black">32GB</span>
                </label>
                <label for="s_sm" class="d-flex">
                    <input type="checkbox" id="s_sm" class="mr-2 mt-1" name="ram" type="checkbox" name="listGroupRadio" value=""><span class="text-black">64GB</span>
                </label>

            </div>

        </div>
        <c:forEach var="i" items="${requestScope.bList}">
            <div>
                <input class="form-check-input me-1" 
                       name="brand" type="checkbox" value="${i.getId()}"
                       <c:forEach var="j" items="${sessionScope.brandList}">
                           ${(j==i.getId())?"checked":''}
                       </c:forEach>
                       >${i.getName()}
            </div>
        </c:forEach>
    </body>
</html>
