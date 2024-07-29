<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Account</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

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
                    <div class="row bg-light rounded align-items-center justify-content-center mx-0">
                        <div class="display-3 p-4 text-dark">Manage Account</div>
                        <div class="col-12">
                            <!-- Start Content -->
                            <div class="container-fluid">
                                <div class="container p-2">
                                    <!-- Start Search -->
                                    <div class="row">
                                        <!-- Search by Name or Email -->
                                        <div class="container col-md-5 mb-3" style="width: 30%;">
                                            <form class="d-flex" role="search" action="manageaccount" method="get">
                                                <div class="input-group">
                                                    <input class="form-control me-2" type="search" 
                                                           placeholder="${param.search!=null? param.search:'Search by Name or Email'}" 
                                                           aria-label="Search" name="search">
                                                    <button class="btn btn-outline-success" type="submit">
                                                        <i class="bi bi-search"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </div>

                                        <!-- Search by Role -->
                                        <div class="container col-md-4 mb-3" style="width: 25%;">
                                            <form class="d-flex" id="formRole" role="search" action="manageaccount" method="get">
                                                <div class="input-group">
                                                    <select id="role" name="roleSearch" onchange="document.getElementById('formRole').submit()" class="form-select me-2">
                                                        <option value="0" ${(param.roleSearch==null||param.roleSearch==0)?"selected":""}>All Role</option>
                                                        <option value="1" ${param.roleSearch==1?"selected":""}>Admin</option>
                                                        <option value="2" ${param.roleSearch==2?"selected":""}>Manager</option>
                                                        <option value="3" ${param.roleSearch==3?"selected":""}>Staff</option>
                                                        <!-- Add other role options here -->
                                                    </select>
                                                </div>
                                            </form>
                                        </div>

                                        <!-- Add Employees button -->
                                        <div class="container col-md-3 mb-3" style="width: 25%;">
                                            <a href="addemployee" class="btn btn-outline-primary w-100">
                                                Add Employees
                                            </a>
                                        </div>
                                    </div>
                                    <!-- End Search -->
                                </div>

                                <div class="bg-light rounded h-100 p-4">
                                    <div class="table-responsive">
                                        <c:if test="${not empty alertMessage}">
                                            <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                                ${alertMessage}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </c:if>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Username</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Phone Number</th>
                                                    <th scope="col" style="text-align: center;">Role</th>
                                                    <th scope="col" style="text-align: center;">Status</th>
                                                    <th scope="col" style="text-align: center;">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:if test="${empty eList}">
                                                    <tr>
                                                        <td colspan="7" class="text-center">No data available</td>
                                                    </tr>
                                                </c:if>
                                                <c:forEach items="${eList}" var="e">
                                                    <tr data-id="${e.id}" data-username="${e.username}" data-email="${e.email}" data-phone="${e.phone}" data-role="${e.role_id}">
                                                        <td>${e.id}</td>
                                                        <td>${e.username}</td>
                                                        <td>${e.email}</td>
                                                        <td style="text-align: right;">${e.phone}</td>
                                                        <td style="text-align: center;">
                                                            <c:choose>
                                                                <c:when test="${e.role_id != 1}">
                                                                    <form action="manageaccount" method="post" style="display: inline;">
                                                                        <input type="hidden" name="id" value="${e.id}" />
                                                                        <input type="hidden" name="action" value="updateRole" />
                                                                        <div class="input-group">
                                                                            <select class="form-select form-select-sm" id="status" name="role">
                                                                                <option value="2" ${e.role_id == 2 ? 'selected' : ''}>Manager</option>
                                                                                <option value="3" ${e.role_id == 3 ? 'selected' : ''}>Staff</option>
                                                                            </select>
                                                                            <button type="submit" name="action" class="btn btn-sm btn-primary">
                                                                                <i class="bi bi-arrow-repeat"></i>
                                                                            </button>
                                                                        </div>
                                                                    </form>
                                                                </c:when>
                                                                <c:otherwise>Admin</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td style="text-align: center;">
                                                            <c:if test="${e.status == 1}">
                                                                <!-- Active Button -->
                                                                <form action="manageaccount" method="POST">
                                                                    <input type="hidden" id="id" name="id" value="${e.id}">
                                                                    <button type="submit" class="btn btn-outline-success btn-sm" title="Active" name="action" value="inactive">
                                                                        <i class="bi bi-toggle-on"></i>
                                                                    </button>
                                                                </form>
                                                            </c:if>
                                                            <c:if test="${e.status == 0}">
                                                                <!-- Inactive Button -->
                                                                <form action="manageaccount" method="POST">
                                                                    <input type="hidden" id="id" name="id" value="${e.id}">
                                                                    <button type="submit" class="btn btn-outline-danger btn-sm" title="Inactive" name="action" value="active">
                                                                        <i class="bi bi-toggle-off"></i>
                                                                    </button>
                                                                </form>
                                                            </c:if>
                                                        </td>
                                                        <td style="text-align: center;">
                                                            <c:if test="${e.role_id != 1}">
                                                                <!-- Button to trigger the modal -->
                                                                <button type="button" class="btn btn-sm btn-light edit-button" style="border-radius: 8px;" data-bs-toggle="modal" data-bs-target="#staticBackdrop-${e.id}" data-role="${e.role_id}" data-id="${e.id}" data-username="${e.username}" data-email="${e.email}" data-phone="${e.phone}" data-firstname="${e.firstname}" data-lastname="${e.lastname}" data-address="${e.address}" data-img="${e.img}" data-regdate="${e.reg_date}" data-status="${e.status}">
                                                                    <i class="bi bi-pencil-square"></i>
                                                                </button>
                                                                <!-- Modal for each employee -->
                                                                <div class="modal fade" id="staticBackdrop-${e.id}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel-${e.id}" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                                                        <div class="modal-content bg-light">
                                                                            <div class="modal-header">
                                                                                <h1 class="modal-title fs-5" id="staticBackdropLabel-${e.id}">View Employee Role</h1>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body bg-light">
                                                                                <div class="card bg-light">
                                                                                    <table class="table table-borderless">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td style="width: 30%;"><strong>ID:</strong></td>
                                                                                                <td><input type="text" id="id-${e.id}" name="id" class="form-control" value="${e.id}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Username:</strong></td>
                                                                                                <td><input type="text" id="username-${e.id}" class="form-control" value="${e.username}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Email:</strong></td>
                                                                                                <td><input type="email" id="email-${e.id}" class="form-control" value="${e.email}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Phone Number:</strong></td>
                                                                                                <td><input type="tel" id="phoneNumber-${e.id}" class="form-control" value="${e.phone}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Address:</strong></td>
                                                                                                <td><input type="text" id="address-${e.id}" class="form-control" value="${e.address}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>First Name:</strong></td>
                                                                                                <td><input type="text" id="firstname-${e.id}" class="form-control" value="${e.firstname}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Last Name:</strong></td>
                                                                                                <td><input type="text" id="lastname-${e.id}" class="form-control" value="${e.lastname}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Image:</strong></td>
                                                                                                <td><input type="text" id="img-${e.id}" class="form-control" value="${e.img}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Registration Date:</strong></td>
                                                                                                <td><input type="text" id="regDate-${e.id}" class="form-control" value="${e.reg_date}" disabled></td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Status:</strong></td>
                                                                                                <td>
                                                                                                    <div class="form-check form-check-inline">
                                                                                                        <input class="form-check-input" type="radio" name="status-${e.id}" id="statusActive-${e.id}" value="1" <c:if test="${e.status == 1}">checked</c:if> disabled>
                                                                                                        <label class="form-check-label" for="statusActive-${e.id}">Active</label>
                                                                                                    </div>
                                                                                                    <div class="form-check form-check-inline">
                                                                                                        <input class="form-check-input" type="radio" name="status-${e.id}" id="statusInactive-${e.id}" value="0" <c:if test="${e.status == 0}">checked</c:if> disabled>
                                                                                                        <label class="form-check-label" for="statusInactive-${e.id}">Inactive</label>
                                                                                                    </div>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <tr>
                                                                                                <td><strong>Role:</strong></td>
                                                                                                <td>
                                                                                                    <c:choose>
                                                                                                        <c:when test="${e.role_id == 2}">Manager</c:when>
                                                                                                        <c:when test="${e.role_id == 3}">Staff</c:when>
                                                                                                    </c:choose>
                                                                                                </td>
                                                                                            </tr>
                                                                                            <!-- Add more rows for additional fields as needed -->
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--pagination-->
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination justify-content-end">
                                            <li class="page-item">
                                                <a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=1">Previous</a>
                                            </li>
                                            <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                                <li class="page-item ${i == param.pageNumber ? 'active' : ''}">
                                                    <a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=${numberOfPage}">Next</a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>


                            </div>
                            <!-- End Content -->
                        </div>
                    </div>
                </div>
                <!-- Blank End -->
                <!-- Modal -->

                <!-- Footer Start -->
                <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
                <!-- Footer End -->
            </div>
            <!-- Content End -->


            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>


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
