<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta charset="UTF-8">
        <title>Manage News</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="cssE/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="cssE/style.css" rel="stylesheet">

        <!-- Place the first <script> tag in your HTML's <head> -->
        <script src="https://cdn.tiny.cloud/1/locm8jywmtjh6nerq0ewtacw8cqc2wrdfl2mfalkps9mng70/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
    </head>
    <body>
        <div class="container-fluid position-relative d-flex p-0">
            <!-- Spinner Start -->
            <!--            <div id="spinner" class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>-->
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <%@include file="../HeadFoot/EmployeeSidebar.jsp" %>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="../HeadFoot/EmployeeNav.jsp" %>
                <!-- Navbar End -->


                <!-- Blank Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded justify-content-center mx-0">
                        <div class="container p-2">
                            <div class="row">
                                <div class="container col-md-12 mb-3">
                                    <h1 class="display-3 p-2">News</h1>
                                </div>
                                <!-- Search by Name or Email -->
                                <div class="container col-md-6 mb-3" style="width: 30%; float: right;">
                                    <form class="d-flex" role="search" action="managenews" method="get">
                                        <div class="input-group">
                                            <c:set var="placeholderText" value="Search" />
                                            <c:if test="${not empty requestScope.searchWords}">
                                                <c:set var="placeholderText" value="Search: ${requestScope.searchWords}" />
                                            </c:if>
                                            <input class="form-control me-2" type="search" 
                                                   placeholder="${placeholderText}"
                                                   aria-label="Search" name="search">
                                            <button class="btn btn-outline-success" type="submit">
                                                <i class="bi bi-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>


                                <div class="container col-md-3 mb-3" style="width: 18%;">
                                    <form class="d-flex" role="search" action="managenews" method="get">
                                        <div class="input-group">
                                            <select id="category" name="category" class="form-select me-2">
                                                <option value="0">All</option> 
                                                <c:forEach items="${categoryList}" var="category">
                                                    <option value="${category.id}" ${param.category==category.id?'selected':''}>${category.name}</option> 
                                                </c:forEach>
                                            </select>
                                            <button class="btn btn-outline-success" type="submit">
                                                <i class="bi bi-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>

                                <!-- End Search -->
                                <div class="container col-md-3 " style="width: 18%; display: inline;" >
                                    <a href="addnews" class="btn btn-primary">Add news</a>
                                </div>

                            </div>

                            <div class="container-fluid col-md-12 p-4">
                                <!--mess when done action-->
                                <c:if test="${not empty requestScope.alertMessage}">
                                    <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                        ${requestScope.alertMessage}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>

                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th style="width: 5%;">#</th>
                                            <th style="width: 10%;">Category</th>
                                            <th style="width: 30%;">Title</th>
                                            <th style="width: 10%;">Author</th>
                                            <th style="width: 35%;">Short Description</th>
                                            <th style="width: 5%;">Status</th>
                                            <th style="width: 5%;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requestScope.nMap}" var="entry" varStatus="loop">
                                            <tr>
                                                <th scope="row" style="text-align: center;">${entry.id}</th>
                                                <td>
                                                    <c:forEach var="category" items="${categoryList}">
                                                        ${entry.news_category_id == category.id ? category.name : ''}
                                                    </c:forEach>
                                                </td>
                                                <td>${entry.title}</td>
                                                <td>
                                                    <c:forEach items="${employee}" var="e">
                                                        <c:if test="${e.id == entry.author}">
                                                            ${e.firstname} ${e.lastname}
                                                        </c:if>
                                                    </c:forEach>
                                                </td>
                                                <td>${entry.short_description}</td>
                                                <td>
                                                    <c:if test="${entry.status==1}">
                                                        <button id="activeButton" class="btn btn-success">
                                                            <i class="bi bi-toggle-on"></i>
                                                        </button>
                                                    </c:if>
                                                    <c:if test="${entry.status==0}">
                                                        <button id="inactiveButton" class="btn btn-danger">
                                                            <i class="bi bi-toggle-off"></i>
                                                        </button>  
                                                    </c:if>
                                                </td>
                                                <td style="text-align: center;">
                                                    <!-- View Button --> 
                                                    <c:if test="${entry.id>1}">
                                                        <a href="addnews?newsid=${entry.id}" class="btn btn-primary btn-sm" title="View">
                                                            <i class="bi bi-eye"></i>
                                                        </a>
                                                    </c:if>
                                                    <c:if test="${entry.id==1}">
                                                        <a href="editstoreinfo?newsid=${entry.id}" class="btn btn-primary btn-sm" title="View">
                                                            <i class="bi bi-eye"></i>
                                                        </a>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <!--pagination-->
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/managenews?pageNumber=1">Previous</a></li>
                                            <c:if test="${param.pageNumber==1}">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="<%=request.getContextPath()%>/managenews?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${requestScope.numberOfPage<=5}">
                                            <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                                <li class="page-item ${i==param.pageNumber?"active":""}">
                                                    <a class="page-link" href="<%=request.getContextPath()%>/managenews?pageNumber=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${requestScope.numberOfPage>5}">
                                            <c:choose>
                                                <c:when test="${param.pageNumber-3<=0}">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managenews?pageNumber=${i}">${i}</a>
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
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managenews?pageNumber=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>

                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a class="page-link" href="#">...</a>
                                                    </li>
                                                    <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managenews?pageNumber=${i}">${i}</a>
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
                                               href="<%=request.getContextPath()%>/managenews?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/managenews?pageNumber=${numberOfPage}">End</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- Blank End -->


                </div>
                <!-- Footer Start -->
                <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
                <!-- Footer End -->
                <!-- Content End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
            </div>


            <!-- Place the following <script> and <textarea> tags your HTML's <body> -->
            <script>
                tinymce.init({
                    selector: 'textarea',
                    plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage advtemplate ai mentions tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss markdown',
                    toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
                    tinycomments_mode: 'embedded',
                    tinycomments_author: 'Author name',
                    mergetags_list: [
                        {value: 'First.Name', title: 'First Name'},
                        {value: 'Email', title: 'Email'},
                    ],
                    ai_request: (request, respondWith) => respondWith.string(() => Promise.reject("See docs to implement AI Assistant")),
                });
            </script>
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