<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Warranty</title>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
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
        <style>
            .response-input {
                border-radius: 8px;
                margin-left: 5px;
            }
            .carousel-inner img {
                max-height: 250px;
                object-fit: cover;
            }
            .card-img-overlay {
                background: rgba(0, 0, 0, 0.25);
            }
            .scrollable-cell {
                max-height: 100px;
                overflow-y: auto;
            }
        </style>
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
                    <div class="row bg-light rounded p-4 mx-0">
                        <h1 class="text-dark mb-3 display-3 ">Warranty</h1>
                        <c:if test="${not empty alertMessage}">
                            <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                ${alertMessage}
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </c:if>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead class="table-light">
                                    <tr>
                                        <th style="width: 5%;">ID</th>
                                        <th style="width: 25%;">Product</th>
                                        <th style="width: 15%;">Serial Number</th>
                                        <th style="width: 35%;">Reason</th>
                                        <th style="width: 15%">Status</th>
                                        <th style="width: 5%;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="list" value="${requestScope.list}"/>
                                    <c:forEach begin="1" end="${list.size()}" var="i">
                                        <!-- Example row, repeat this block for each warranty entry -->
                                        <tr>
                                            <td style="width: 5%;">${list.get(list.size()-i).get(0)}</td>
                                            <td style="width: 25%; max-width: 150px;">
                                                <a href="productdetails?id= ${list.get(list.size()-i).get(0)}" class="text-decoration-none view-btn">
                                                    ${list.get(list.size()-i).get(1)}
                                                </a>
                                            </td>
                                            <td style="width: 15%;">${list.get(list.size()-i).get(2)}</td>
                                            <td style="width: 35%;" class="scrollable-cell">${list.get(list.size()-i).get(3)}</td>
                                            <td style="width: 15%">
                                                <form action="updatewarranty" method="post" style="display: inline;">
                                                    <input type="hidden" name="id" value="${list.get(list.size()-i).get(0)}">
                                                    <div class="input-group">
                                                        <select class="form-select form-select-sm" id="status" name="status">
                                                            <option value="2" >Accept</option>
                                                            <option value="3" >Reject</option>
                                                        </select>
                                                        <button type="submit" name="action" class="btn btn-sm btn-primary">
                                                            <i class="bi bi-arrow-repeat"></i>
                                                        </button>
                                                    </div>
                                                </form>
                                            </td>
                                            <td style="width: 5%;">
                                                <a class="btn btn-primary btn-sm view-btn" data-bs-toggle="modal" data-bs-target="#viewModal1">
                                                    <i class="bi bi-eye"></i> 
                                                </a>
                                                <!--                                                <a type="button" class="btn btn-success btn-sm">
                                                                                                    <i class="bi bi-check-circle"></i>
                                                                                                </a>
                                                                                                <a type="button" class="btn btn-danger btn-sm">
                                                                                                    <i class="bi bi-x-circle"></i>
                                                                                                </a>-->
                                            </td>
                                        </tr>
                                        <!-- End of example row -->
                                    </c:forEach>
                                </tbody>
                            </table>

                            <c:forEach begin="1" end="${list.size()}" var="i">
                                <!-- Modal for Viewing Details -->
                                <div class="modal fade" id="viewModal1" tabindex="-1" aria-labelledby="viewModalLabel1" aria-hidden="true">
                                    <div class="modal-dialog modal-lg col-md-9">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title">Warranty Details</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body card">
                                                <div class="card">
                                                    <div class="container form-container" style="padding: 5%"> 
                                                        <div class="header" style=" margin-bottom: 5px;">
                                                            <div class="title">
                                                                <h1 style="margin: 0; color: crimson; border-bottom: 2px solid crimson;">PHIẾU BẢO HÀNH</h1>
                                                            </div>
                                                        </div>

                                                        <div class="info-section" style="display: flex;margin-top: 3%; justify-content: space-between;">
                                                            <div class="receiver-info" style="width: 48%; margin-right: 2%;">
                                                                <h5 style="margin-top: 0; color: crimson;">THÔNG TIN NGƯỜI TIẾP NHẬN</h5>
                                                                <p style="margin: 0;">Tên nv: {employeeName}</p>
                                                                <p style="margin: 1%; border-bottom: 2px solid #d6d8db;">Số điện thoại liên hệ: {hotline}</p>
                                                                <p style="margin: 0;">Ngày nhận đơn: {receivedDate}</p>
                                                                <p style="margin: 0;">Ngày hẹn trả (dự kiến): {expectedDate}</p>
                                                            </div>

                                                            <div class="customer-info" style="width: 48%;">
                                                                <h5 style="margin-top: 0; color: crimson;">THÔNG TIN KHÁCH HÀNG</h5>
                                                                <p style="margin: 0;">Tên KH: {customerName}</p>
                                                                <p style="margin: 0;">Điện thoại: {customerPhone}</p>
                                                            </div>
                                                        </div>

                                                        <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px; border: 1px solid crimson;">
                                                            <thead style="background-color: crimson; color: white; text-align: center;">
                                                                <tr style="padding: 8px;">
                                                                    <th style="width: 5%; padding: 3px;">STT</th>
                                                                    <th style="width: 10%;">Mã SP</th>
                                                                    <th style="width: 30%;">Tên SP</th>
                                                                    <th style="width: 15%;">Tình trạng SP</th>
                                                                    <th style="width: 20%;">Hạn bảo hành</th>
                                                                    <th style="width: 20%;">Hình thức</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td style="text-align: center; border: 1px solid crimson; padding: 10px;">2</td>
                                                                    <td style="border: 1px solid crimson; padding: 10px;">832SW1</td>
                                                                    <td style="border: 1px solid crimson; padding: 10px;">Laptop Asus TUF Gaming A15</td>
                                                                    <td style="border: 1px solid crimson; padding: 10px;">Nguyên vẹn</td>
                                                                    <td style="text-align: center; border: 1px solid crimson; padding: 10px;">12</td>
                                                                    <td style="border: 1px solid crimson; padding: 10px;">Trong thời hạn</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                        <table style="width: 100%; border-collapse: collapse; margin-bottom: 20px; border: 1px solid crimson;">
                                                            <thead style="background-color: crimson; color: white; text-align: center;">
                                                                <tr>
                                                                    <th style="padding: 10px;">Ảnh SP</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <tr>
                                                                    <td style="border: 1px solid crimson; padding: 10px;">Danh sách ảnh ở đây</td>
                                                                </tr>
                                                            </tbody>
                                                        </table>

                                                        <div class="signature" style="justify-items: between;">
                                                            <div class="customer-signature">
                                                                <p style="color: crimson; margin: 0;">Khách hàng</p>
                                                                <p style="color: crimson; margin: 0;">Ký ghi rõ họ tên</p>
                                                            </div>
                                                            <div class="receiver-signature">
                                                                <p style="color: crimson; margin: 0;">Nhân viên tiếp nhận</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Modal for Viewing Details -->
                            </c:forEach>

                        </div>
                    </div>

                </div>
                <!-- Blank End -->


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

        <!-- End Modal for Viewing Details -->
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybVuL5jB5tb/daSZktj53WPcg6EdTIHOq2TEscKr7k9SZg7E6" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-pib6gN6QOymjq1LAiw3OfTbCktdTzFJZZo6IVZ/kEdfmDnnm/tro2l9f4pI+pbDy" crossorigin="anonymous"></script>
        <script>
            var modalEl = document.getElementById('viewModal1');
            modalEl.addEventListener('hidden.bs.modal', function (event) {
                // Clear input field when modal closes
                var responseInput = modalEl.querySelector('.response-input');
                responseInput.value = '';
            });
        </script>
    </body>
</html>
