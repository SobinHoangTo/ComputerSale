<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagination Page</title>
    </head>
    <body>
        <!--pagination-->
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-end">
                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=1">Previous</a></li>
                <c:if test="${param.pageNumber==1}">
                    <li class="page-item disabled">
                        <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${requestScope.numberOfPage<=5}">
                    <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                        <li class="page-item ${i==param.pageNumber?"active":""}">
                            <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </c:if>
                <c:if test="${requestScope.numberOfPage>5}">
                    <c:choose>
                        <c:when test="${param.pageNumber-3<=0}">
                            <c:forEach begin="1" end="5" var="i">
                                <li class="page-item ${i==param.pageNumber?"active":""}">
                                    <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <li>
                                <a class="page-link" href="#">...</a>
                            </li>
                        </c:when>
                        <c:when test="${param.pageNumber+2>=requestScope.numberOfPage}">
                            <li>
                                <a class="page-link" href="#">...</a>
                            </li>
                            <c:forEach begin="${requestScope.numberOfPage-4}" end="${requestScope.numberOfPage}" var="i">
                                <li class=" ${i==param.pageNumber?"active":""}">
                                    <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${i}">${i}</a>
                                </li>
                            </c:forEach>

                        </c:when>
                        <c:otherwise>
                            <li>
                                <a class="page-link" href="#">...</a>
                            </li>
                            <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                <li class="page-item ${i==param.pageNumber?"active":""}">
                                    <a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${i}">${i}</a>
                                </li>
                            </c:forEach>
                            <li>
                                <a class="page-link" href="#">...</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </c:if>
                <li class="page-item">
                    <a class="page-link"
                       href="<%=request.getContextPath()%>/manageorders?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/manageorders?pageNumber=${numberOfPage-1}">End</a></li>
            </ul>
        </nav>
    </body>
</html>
