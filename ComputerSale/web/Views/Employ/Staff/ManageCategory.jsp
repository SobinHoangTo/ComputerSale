<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Category</title>
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
                            <h1 class="display-3 p-4">Manage Category</h1>
                            <!-- Search Bar and Add Category Button -->
                            <div class="container d-flex justify-content-between mb-3">
                                <!-- Search Bar -->
                                <div class="input-group">
                                    <form action="managecategory" method="Post" class="d-flex" role="search">
                                        <input type="hidden" name="action" value="search">
                                        <div class="input-group">
                                            <input type="text" name="search" value="${keyword}" class="form-control" placeholder="Search category..." aria-label="Search category"
                                                   aria-describedby="search-icon">
                                            <button class="btn btn-outline-success" type="submit" id="search-icon"><i class="bi bi-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-lg-4 mb-2">

                                </div>  
                                <div class="col-lg-2 mb-2">
                                    <button type="button" class="btn btn-primary w-100" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                                        Add Category
                                    </button>
                                    <!--<a class="btn btn-primary w-100" href="<%=request.getContextPath ()%>/Views/Employ/Staff/AddCategory.jsp">Add Category</a>-->
                                </div>
                            </div>

                            <!-- Add Category Modal -->
                            <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content bg-light">
                                        <!-- Modal Header -->
                                        <div class="modal-header">

                                            <!-- Modal Header -->
                                            <h5 class="modal-title" id="addCategoryModalLabel" style="color: red;"><strong>Create New Category</strong></h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>

                                        <!-- Modal Body -->
                                        <div class="modal-body">
                                            <!-- Form to add new Category -->
                                            <form action="managecategory" method="post">
                                                <input type="hidden" name="action" value="add">
                                                <!-- Name -->
                                                <div class="mb-3">
                                                    <label for="name" class="form-label"><strong>Name Category</strong></label>
                                                    <input type="text" class="form-control" name="name" required>
                                                </div>
                                                <!-- Submit Button -->
                                                <button type="submit" class="btn btn-primary">Add Category</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Category Table -->
                            <div class="container mt-4">
                                <div class="table-responsive">
                                    <!-- Category Table -->
                                    <table class="table table-bordered table-striped">

                                        <thead class="table-light">
                                            <tr class="text-nowrap">
                                                <th>ID</th>
                                                <th>Name Category</th>
                                                <th>Created By</th>
                                                <th>Created On</th>
                                                <th>Modified By</th>
                                                <th>Modified On</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${empty listCategory}">
                                                <tr>
                                                    <td colspan="7" class="text-center">No category available</td>
                                                </tr>
                                            </c:if>
                                            <c:forEach items="${requestScope.listCategory}" var="c">
                                                <tr class="text-nowrap">
                                                    <td>${c.id}</td>
                                                    <td>${c.name}</td>
                                                    <td  class="text-end">${c.created_by}</td>
                                                    <td  class="text-end">${c.created_on}</td>
                                                    <td  class="text-end">${c.modified_by}</td>
                                                    <td  class="text-end">${c.modified_on}</td>
                                                    <td>
                                                        <c:if test="${c.getStatus() != 0}">
                                                            <div class="btn-group" role="group" aria-label="Category Actions">
                                                                <form action="managecategory" method="post">
                                                                    <input type="hidden" name="action" value="hidden">
                                                                    <input type="hidden" name="id" value="${c.id}">
                                                                    <!-- Display Status Button -->
                                                                    <button type="submit" class="btn btn-info btn-sm" title="Hidden" data-bs-toggle="modal">
                                                                        <i class="bi bi-eye"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${c.getStatus() == 0}">
                                                            <div class="btn-group" role="group" aria-label="Category Actions">
                                                                <form action="managecategory" method="post">
                                                                    <input type="hidden" name="action" value="display">
                                                                    <input type="hidden" name="id" value="${c.id}">
                                                                    <!-- Display Status Button -->
                                                                    <button type="submit" class="btn btn-secondary btn-sm" title="Display" data-bs-toggle="modal">
                                                                        <i class="bi bi-eye"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </c:if>

                                                        <div class="btn-group" role="group" aria-label="Category Actions">
                                                            <button type="button" class="btn btn-secondary btn-sm me-3" title="Edit" data-bs-toggle="modal"
                                                                    data-bs-target="#editCategoryModal${c.id}">
                                                                <i class="bi bi-pencil-square"></i> 
                                                            </button>
                                                        </div>

                                                        <div class="btn-group" role="group" aria-label="Category Actions">
                                                            <form action="managecategory" method="post">
                                                                <input type="hidden" name="action" value="delete">
                                                                <input type="hidden" name="id" value="${c.id}">
                                                                <button type="submit" class="btn btn-danger btn-sm me-3" title="Delete" id="deleteButton">
                                                                    <i class="bi bi-trash"></i>
                                                                </button>
                                                            </form>

                                                            <div class="modal fade" id="editCategoryModal${c.id}" tabindex="-1" aria-labelledby="editCategoryModalLabel${c.id}" aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered">
                                                                    <div class="modal-content bg-light">
                                                                        <!-- Modal Header -->
                                                                        <div class="modal-header">
                                                                            <h5 class="modal-title" id="editCategoryModalLabel${c.id}" style="color: red;"><strong>Edit Category</strong></h5>
                                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                        </div>
                                                                        <!-- Modal Body -->
                                                                        <div class="modal-body">
                                                                            <!-- Form to edit category details -->
                                                                            <form action="managecategory" method="post">

                                                                                <div class="form-group mb-3">
                                                                                    <label for="name" class="form-label"><strong>Name</strong></label>
                                                                                    <input type="text" class="form-control" name="name" value="${c.getName()}" required>
                                                                                </div>
                                                                                <input type="hidden" name="action" value="edit">
                                                                                <input type="hidden" name="id" value="${c.id}">
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
                            </div>
                        </div>
                    </div>
                </div>
                <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
                <!-- Back to Top -->
            </div>
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/chart/chart.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/tempusdominus/js/moment.min.js"></script>
        <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>
        <script src="js/main.js"></script> 
    </body>
</html>
