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
                                                    <select id="role" name="role" onchange="document.getElementById('formRole').submit()" class="form-select me-2">
                                                        <option value="0" ${(param.role==null||param.role==0)?"selected":""}>All Role</option>
                                                        <option value="1" ${param.role==1?"selected":""}>Admin</option>
                                                        <option value="2" ${param.role==2?"selected":""}>Manager</option>
                                                        <option value="3" ${param.role==3?"selected":""}>Staff</option>
                                                        <!-- Add other role options here -->
                                                    </select>
                                                </div>
                                            </form>
                                        </div>

                                        <!-- Add Employees button -->
                                        <div class="container col-md-3 mb-3" style="width: 25%;">
                                            <button class="btn btn-outline-primary w-100" data-bs-toggle="modal" data-bs-target="#addForm" type="button">
                                                Add Employees
                                            </button>
                                        </div>
                                    </div>
                                    <!-- End Search -->
                                    <!-- Add Employee Modal -->
                                    <div class="modal fade" id="addForm" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="addFormLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content bg-secondary">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="addFormLabel">Add Employee</h1>
                                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="addemployee" method="post">
                                                    <div class="modal-body">
                                                        <div class="card bg-secondary">
                                                            <!-- Username -->
                                                            <div class="mb-3">
                                                                <label for="addusername" class="form-label">Username</label>
                                                                <input type="text" class="form-control" id="addusername" name="addusername" required>
                                                            </div>
                                                            <!-- Email -->
                                                            <div class="mb-3">
                                                                <label for="addemail" class="form-label">Email address</label>
                                                                <input type="email" class="form-control" id="addemail" name="addemail" required>
                                                            </div>
                                                            <!-- Phone Number -->
                                                            <div class="mb-3">
                                                                <label for="addphone" class="form-label">Phone Number</label>
                                                                <input type="tel" class="form-control" id="addphone" name="addphone" required>
                                                            </div>
                                                            <!-- Address -->
                                                            <div class="mb-3">
                                                                <label for="addaddress" class="form-label">Address</label>
                                                                <input type="text" class="form-control" id="addaddress" name="addaddress" required>
                                                            </div>
                                                            <!-- Date of Birth -->
                                                            <div class="mb-3">
                                                                <label for="adddob" class="form-label">Date of Birth</label>
                                                                <input type="date" class="form-control" id="adddob" name="adddob" required>
                                                            </div>
                                                            <!-- Hidden Field for Page -->
                                                            <input type="hidden" name="page" id="addrole" value="manageacc">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="submit" class="btn btn-primary">Submit</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Add Employee Modal -->
                                </div>

                                <div class="bg-light rounded h-100 p-4">
                                    <div class="table-responsive">
                                        <c:if test="${not empty alertMessage}">
                                            <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                                ${alertMessage}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </c:if>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Username</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col">Phone Number</th>
                                                    <th scope="col">Role</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <c:if test="${empty eList}">
                                                    <tr>
                                                        <td colspan="6" class="text-center">No data available</td>
                                                    </tr>
                                                </c:if>
                                                <c:forEach items="${eList}" var="e">
                                                    <tr data-id="${e.id}" data-username="${e.username}" 
                                                        data-email="${e.email}" data-phone="${e.phone}"
                                                        data-role="${e.role_id}">
                                                        <td>${e.id}</td>
                                                        <td>${e.username}</td>
                                                        <td>${e.email}</td>
                                                        <td>${e.phone}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${e.role_id == 1}">Admin</c:when>
                                                                <c:when test="${e.role_id == 2}">Manager</c:when>
                                                                <c:when test="${e.role_id == 3}">Staff</c:when>
                                                                <c:otherwise>Unknown</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:if test="${e.role_id != 1}">
                                                                <button type="button" class="btn btn-light edit-button" 
                                                                        style="border-radius: 8px;" data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                                                                        data-role="${e.role_id}">
                                                                    <i class="bi bi-pencil-square"></i>
                                                                </button>
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
                                            <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=1">Previous</a></li>
                                                <c:if test="${param.pageNumber==1}">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}" aria-label="Previous">
                                                        <span aria-hidden="true">&laquo;</span>
                                                        <span class="sr-only">Previous</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                            <c:if test="${requestScope.numberOfPage<=5}">
                                                <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                                    <li class="page-item ${i==param.pageNumber?"active":""}">
                                                        <a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${requestScope.numberOfPage>5}">
                                                <c:choose>
                                                    <c:when test="${param.pageNumber-3<=0}">
                                                        <c:forEach begin="1" end="5" var="i">
                                                            <li class="page-item ${i==param.pageNumber?"active":""}">
                                                                <a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=${i}">${i}</a>
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
                                                                <a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=${i}">${i}</a>
                                                            </li>
                                                        </c:forEach>

                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <a class="page-link" href="#">...</a>
                                                        </li>
                                                        <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                                            <li class="page-item ${i==param.pageNumber?"active":""}">
                                                                <a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=${i}">${i}</a>
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
                                                   href="<%=request.getContextPath()%>/manageaccount?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                            <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/manageaccount?pageNumber=${numberOfPage}">End</a></li>
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
                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content bg-light">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="staticBackdropLabel">Change Employee Role</h1>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="manageaccount" method="post">
                                <div class="modal-body bg-light">
                                    <div class="card bg-light">
                                        <table class="table table-borderless">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input type="hidden" id="id" name="id" class="form-control">
                                                        <input type="text" id="id-display" class="form-control" disabled>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="text" id="username" class="form-control" disabled>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="email" id="email" class="form-control" disabled>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="tel" id="phoneNumber" class="form-control" disabled>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <select class="form-select" aria-label="Default select example" id="role" name="role">
                                                            <option value="3">Staff</option>
                                                            <option value="2">Manager</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary" id="changeRoleButton">Change</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>

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


        <!-- Send data to the modal -->
        <script>
                                                        document.addEventListener("DOMContentLoaded", function () {
                                                            var editButtons = document.querySelectorAll(".edit-button");

                                                            editButtons.forEach(function (button) {
                                                                button.addEventListener("click", function () {
                                                                    var tr = button.closest("tr");
                                                                    var id = tr.getAttribute("data-id");
                                                                    var username = tr.getAttribute("data-username");
                                                                    var email = tr.getAttribute("data-email");
                                                                    var phone = tr.getAttribute("data-phone");
                                                                    var role = tr.getAttribute("data-role");

                                                                    document.getElementById("id").value = id;
                                                                    document.getElementById("id-display").value = id;
                                                                    document.getElementById("username").value = username;
                                                                    document.getElementById("email").value = email;
                                                                    document.getElementById("phoneNumber").value = phone;

                                                                    // Set the selected option based on the role value
                                                                    var selectRole = document.getElementById("role");
                                                                    selectRole.value = role;
                                                                });
                                                            });
                                                        });
        </script>
    </body>
</html>
