<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Brand</title>
        <!-- Bootstrap CSS -->
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <link href="img/favicon.ico" rel="icon">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Roboto:wght@500;700&display=swap" rel="stylesheet"> 
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />
        <link href="cssE/bootstrap.min.css" rel="stylesheet">
        <link href="cssE/style.css" rel="stylesheet">   
        <style>
            .image-container {
                position: relative;
                display: inline-block;
            }
            .remove-image-button {
                position: absolute;
                top: 5px;
                right: 5px;
                background-color: red;
                color: white;
                border: none;
                border-radius: 50%;
                padding: 5px 10px;
                cursor: pointer;
                font-size: 18px;
            }
            .remove-image-button:hover {
                background-color: darkred;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid position-relative d-flex p-0">

            <!-- Sidebar Start -->
            <%@include file="../HeadFoot/EmployeeSidebar.jsp" %>
            <!-- Sidebar End -->

            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="../HeadFoot/EmployeeNav.jsp" %>
                <!-- Navbar End -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded justify-content-center mx-0">
                        <div class="container p-2">
                            <!-- Title -->
                            <h1 class="text-dark mt-3 mb-2 display-3">Manage Brand</h1>
                            <!-- Search Bar and Add Category Button -->
                            <div class="row">
                                <!-- Search Bar -->
                                <div class="container col-md-5 mb-3" style="width: 45%;">
                                    <form action="managebrand?page=${currentPage}" method="POST" class="d-flex" role="search">
                                        <input type="hidden" name="action" value="search">
                                        <div class="input-group p-2">
                                            <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Search name brand..." aria-label="Search brand"
                                                   aria-describedby="search-icon">
                                            <button class="btn btn-outline-success" type="submit" id="search-icon"><i class="bi bi-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                                <div class="container col-md-4 mb-3" style="width: 25%;">
                                </div>
                                <div class="container col-md-4 mb-3" style="width: 25%;">
                                    <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#addBrandModal">
                                        Add Brand
                                    </button>
                                </div>
                            </div>

                            <div class="row">
                                

                                <div class="col-sm-2"></div>

                                <div class="col-sm-5">
                                    <c:if test="${not empty param.mess}">
                                        <div class="alert alert-${param.alertType} col-sm-10" role="mess">
                                            ${param.mess}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                            <!-- Add Brand Modal -->
                            <div class="modal fade" id="addBrandModal" tabindex="-1" aria-labelledby="addBrandModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content bg-light">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addBrandModalLabel" style="color: red;">Create New Brand</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>

                                        <!-- Modal Body -->
                                        <div class="modal-body">
                                            <!-- Form to add new brand -->
                                            <form action="managebrand" method="post" enctype="multipart/form-data">
                                                <input type="hidden" name="action" value="add">
                                                <!-- Name -->
                                                <div class="mb-3">
                                                    <label for="name" class="form-label">Name<span class="text-danger"> (*)</span></label>
                                                    <input type="text" class="form-control" name="name" required>
                                                </div>
                                                <!-- Logo Image -->
                                                <div class="mb-3">
                                                    <label for="logo" class="form-label">Logo<span class="text-danger"> (*)</span></label><br/>
                                                    <div class="image-container mb-2">
                                                        <img src="<%=request.getContextPath()%>/Image/emty_image.jpg" id="addBrandLogo" class="img-fluid" style="width: 200px; border: 1px solid #555;">
                                                        <button type="button" id="addRemoveImageButton" class="remove-image-button" style="display: none;" 
                                                                onclick="removeImage('addBrandLogo', 'addRemoveImageButton', 'addImageUpload', '<%=request.getContextPath()%>/Image/emty_image.jpg')">&times;</button>
                                                    </div>
                                                    <input type="file" class="form-control" name="logo" accept="image/*" id="addImageUpload" onchange="previewImage(this, 'addBrandLogo', 'addRemoveImageButton')" required>
                                                </div>

                                                <!-- Link -->
                                                <div class="mb-3">
                                                    <label for="link" class="form-label">Link<span class="text-danger"> (*)</span></label>
                                                    <input type="text" class="form-control" name="link" required>
                                                </div>
                                                <!-- Modal Footer -->
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Add</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Brand List Table -->
                            <div class="container mt-4">
                                <c:if test="${not empty alertMessage}">
                                    <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                        ${alertMessage}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-striped">
                                        <thead class="table-light">
                                            <tr class="text-nowrap">
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Logo</th>
                                                <th>Link</th>
                                                <th>Created By</th>
                                                <th>Created On</th>
                                                <th>Modified By</th>
                                                <th>Modified On</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${empty listBrand}">
                                                <tr>
                                                    <td colspan="9" class="text-center">No Brand available</td>
                                                </tr>
                                            </c:if>
                                            <c:forEach items="${requestScope.listBrand}" var="b">
                                                <tr class="text-nowrap">
                                                    <td><strong>${b.id}</strong></td>
                                                    <td><strong class="text-center">${b.name}</strong></td>
                                                    <td>
                                                        <div class="image-container">
                                                            <img id="brandLogo${b.id}" class="img-fluid" src="<%=request.getContextPath()%>/Image/Brands/${b.getLogo()}" alt="${b.getName()}" style="max-width: 100px;">
                                                        </div>
                                                    </td>
                                                    <td><strong>${b.link}</strong></td>
                                                    <td class="text-end"><strong>${b.created_by}</strong></td>
                                                    <td class="text-end"><strong>${b.created_on}</strong></td>
                                                    <td class="text-end"><strong>${b.modified_by}</strong></td>
                                                    <td class="text-end"><strong>${b.modified_on}</strong></td>
                                                    <td>
                                                        <c:if test="${b.getStatus() == 0}">
                                                            <div class="btn-group" role="group" aria-label="Brand Actions">
                                                                <form action="managebrand" method="post">
                                                                    <input type="hidden" name="action" value="display">
                                                                    <input type="hidden" name="id" value="${b.id}">
                                                                    <button type="submit" class="btn btn-outline-danger btn-sm view-btn" title="Display">
                                                                        <i class="bi bi-toggle-off"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${b.getStatus() != 0}">
                                                            <div class="btn-group" role="group" aria-label="Brand Actions">
                                                                <form action="managebrand" method="post">
                                                                    <input type="hidden" name="action" value="hidden">
                                                                    <input type="hidden" name="id" value="${b.id}">
                                                                    <button type="submit" class="btn btn-outline-success btn-sm" title="Hidden">
                                                                        <i class="bi bi-toggle-on"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </c:if>
                                                        <div class="btn-group" role="group" aria-label="Brand Actions">
                                                            <button type="button" class="btn btn-light btn-sm me-3" title="Edit" data-bs-toggle="modal" data-bs-target="#editBrandModal${b.id}">
                                                                <i class="bi bi-pencil-square"></i>
                                                            </button>
                                                        </div>
                                                        <div class="btn-group" role="group" aria-label="Brand Actions">
                                                            <div class="modal fade" id="editBrandModal${b.id}" tabindex="-1" aria-labelledby="editBrandModalLabel${b.id}" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content bg-light">
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="editBrandModalLabel${b.id}" style="color: red;">Edit Brand</h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <form action="managebrand" method="post" enctype="multipart/form-data">
                                                                                <input type="hidden" name="action" value="edit">
                                                                                <input type="hidden" name="id" value="${b.id}">
                                                                                <div class="form-group mb-3">
                                                                                    <label for="name" class="form-label">Name<span class="text-danger"> (*)</span></label>
                                                                                    <strong><input type="text" class="form-control" name="name" value="${b.getName()}" required></strong>
                                                                                </div>
                                                                                <div class="form-group mb-3">
                                                                                    <label for="logo" class="form-label">Logo<span class="text-danger"> (*)</span></label><br/>
                                                                                    <div class="image-container">
                                                                                        <img id="editBrandLogo${b.id}" src="Image/Brands/${b.getLogo()}" alt="${b.getName()}" style="width: 30%; border: 1px solid #555;">
                                                                                        <button type="button" id="editRemoveImageButton${b.id}" class="remove-image-button" style="display: none;" 
                                                                                                onclick="removeImage('editBrandLogo${b.id}', 'editRemoveImageButton${b.id}', 'editImageUpload${b.id}', '<%=request.getContextPath()%>/Image/Brands/${b.getLogo()}')">&times;</button>
                                                                                    </div>
                                                                                    <input type="hidden" name="existingLogo" value="${b.getLogo()}">
                                                                                    <input type="file" class="form-control" name="logo" id="editImageUpload${b.id}" accept="image/*" onchange="previewImage(this, 'editBrandLogo${b.id}', 'editRemoveImageButton${b.id}')">
                                                                                </div>
                                                                                <div class="form-group mb-3">
                                                                                    <label for="link" class="form-label">Link<span class="text-danger"> (*)</span></label>
                                                                                    <strong><input type="text" class="form-control" name="link" value="${b.getLink()}" required></strong>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" class="btn btn-primary">Save changes</button>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <!--pagination-->
                                <nav aria-label="Page navigation">
                                    <ul class="pagination justify-content-end">
                                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/managebrand?pageNumber=1">Previous</a></li>
                                            <c:if test="${param.pageNumber==1}">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="<%=request.getContextPath()%>/managebrand?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${requestScope.numberOfPage<=5}">
                                            <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                                <li class="page-item ${i==param.pageNumber?"active":""}">
                                                    <a class="page-link" href="<%=request.getContextPath()%>/managebrand?pageNumber=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${requestScope.numberOfPage>5}">
                                            <c:choose>
                                                <c:when test="${param.pageNumber-3<=0}">
                                                    <c:forEach begin="1" end="5" var="i">
                                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managebrand?pageNumber=${i}">${i}</a>
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
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managebrand?pageNumber=${i}">${i}</a>
                                                        </li>
                                                    </c:forEach>

                                                </c:when>
                                                <c:otherwise>
                                                    <li>
                                                        <a class="page-link" href="#">...</a>
                                                    </li>
                                                    <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                                            <a class="page-link" href="<%=request.getContextPath()%>/managebrand?pageNumber=${i}">${i}</a>
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
                                               href="<%=request.getContextPath()%>/managebrand?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/managebrand?pageNumber=${numberOfPage}">End</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
                </div>
                <!--<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>-->
                <button class="btn btn-lg btn-primary btn-lg-square back-to-top d-none" id="back-to-top" onclick="window.scrollTo({top: 0, left: 0, behavior: 'smooth'});"><i class="bi bi-arrow-up"></i></button>
            </div>
            <!-- Include JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <script src="lib/chart/chart.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="lib/tempusdominus/js/moment.min.js"></script>
            <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
            <script src="js/main.js"></script>

            <!-- Custom JavaScript for Image Preview and Remove -->
            <script>
function previewImage(input, imgElementId, removeButtonId) {
    const file = input.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById(imgElementId).src = e.target.result;
            document.getElementById(imgElementId).style.display = 'block';
            document.getElementById(removeButtonId).style.display = 'inline';
        };
        reader.readAsDataURL(file);
    }
}

function removeImage(imgElementId, removeButtonId, inputFileId, originalSrc) {
    document.getElementById(imgElementId).src = originalSrc;
    document.getElementById(imgElementId).style.display = 'block';
    document.getElementById(removeButtonId).style.display = 'none';
    document.getElementById(inputFileId).value = '';
}
            </script>

    </body>
</html>
