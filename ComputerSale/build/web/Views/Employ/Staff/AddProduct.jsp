<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta charset="UTF-8">
        <title>Add Products</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
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
        <div class="container-fluid  bg-white position-relative d-flex p-0">
            <%@include file="../HeadFoot/EmployeeSidebar.jsp" %>
            <div class="content">
                <%@include file="../HeadFoot/EmployeeNav.jsp" %>
                <div class="container-fluid pt-4 px-4">
                    <div class="row p-4 bg-light rounded justify-content-center mx-0">
                        <h1 class="text-dark mt-3 mb-2 display-3">Add Products</h1>
                        <div class="container p-4">
                            <!-- Form to add new product -->
                            <form id="add-form" action="manageproducts" method="Post" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="add">
                                <!-- Name -->
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name <span class="text-danger">(*)</span></label>
                                    <input type="text" class="form-control" id="name" name="name" required>
                                </div>
                                <!-- Represent Image -->
                                <div class="mb-3">
                                    Represent Image <span class="text-danger">(*)</span> <br/>
                                    <label for="addRepresentImage" class="form-label">
                                        <p class="border">Add Image</p>
                                    </label>
                                    <input type="file" class="form-control d-none" id="addRepresentImage" name="representImage"
                                           accept="image/*" onchange="validateFileType('addRepresentImage')" required>
                                </div>
                                <!-- Image Preview -->
                                <div class="mb-3 p-2" style="position: relative;">
                                    <img id="preview" src="<%=request.getContextPath()%>/Image/emty_image.jpg" alt="image preview"
                                         style="width: 350px; height: 250px"/>
                                    <button type="button" id="removeImage" style="position: absolute; top: 5px; right: 5px; display: none;"
                                            onclick="removeSelectedImage()">X
                                    </button>
                                </div>
                                <!-- Detail Images -->
                                <div class="mb-3">
                                    <label for="detailImages" class="form-label">Detail Images <span
                                            class="text-danger">(*)</span></label>
                                    <input type="file" class="form-control" id="addDetailImages" name="detailImages"
                                           accept="image/*" onchange="validateFileType('addDetailImages')" required multiple>
                                </div>
                                <!-- CPU -->
                                <div class="mb-3">
                                    <label for="CPU" class="form-label">CPU <span class="text-danger">(*)</span></label>
                                    <input type="text" class="form-control" id="CPU" name="CPU" required>
                                </div>
                                <!-- GPU -->
                                <div class="mb-3">
                                    <label for="GPU" class="form-label">GPU<span class="text-danger">(*)</span></label>
                                    <input type="text" class="form-control" id="GPU" name="GPU" required>
                                </div>
                                <!-- RAM -->
                                <div class="mb-3">
                                    <label for="RAM" class="form-label">RAM <span class="text-danger">(*)</span></label>
                                    <input type="text" class="form-control" id="RAM" name="RAM" required>
                                </div>
                                <!-- ROM -->
                                <div class="mb-3">
                                    <label for="ROM" class="form-label">ROM <span class="text-danger">(*)</span></label>
                                    <input type="text" class="form-control" id="ROM" name="ROM" required>
                                </div>
                                <!-- Monitor -->
                                <div class="mb-3">
                                    <label for="monitor" class="form-label">Monitor <span class="text-danger">(*)</span></label>
                                    <input type="text" class="form-control" id="monitor" name="monitor" required>
                                </div>
                                <!-- OS -->
                                <div class="mb-3">
                                    <label for="OS" class="form-label">OS <span class="text-danger">(*)</span></label>
                                    <input type="text" class="form-control" id="OS" name="OS" required>
                                </div>
                                <!-- Price -->
                                <div class="mb-3">
                                    <label for="price" class="form-label">Price <span class="text-danger">(*)</span></label>
                                    <input type="text" class="form-control format-number" id="price" name="price" required>
                                </div>
                                <!-- Quantity -->
                                <div class="mb-3">
                                    <label for="quantity" class="form-label">Quantity <span class="text-danger">(*)</span></label>
                                    <input type="number" class="form-control" id="quantity" name="quantity" required>
                                </div>
                                <!-- Description -->
                                <div class="mb-3">
                                    <label for="description" class="form-label">Description <span class="text-danger">(*)</span></label>
                                    <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
                                </div>
                                <!-- Brand ID -->
                                <div class="mb-3">
                                    <label for="brand" class="form-label">Brand <span class="text-danger">(*)</span></label>
                                    <select class="form-control" id="brand" name="brand" required>
                                        <c:forEach items="${requestScope.listBrand}" var="i">
                                            <option value="${i.getId()}">${i.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <!-- Category ID -->
                                <div class="mb-3">
                                    <label for="category" class="form-label">Category <span class="text-danger">(*)</span></label>
                                    <select class="form-control" id="category" name="category" required>
                                        <c:forEach items="${requestScope.listCategory}" var="c">
                                            <option value="${c.getId()}">${c.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <!-- Submit Button -->
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Add Product</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
            </div>
            <button class="btn btn-lg btn-primary btn-lg-square back-to-top d-none" id="back-to-top" onclick="window.scrollTo({top: 0, left: 0, behavior: 'smooth'});"><i class="bi bi-arrow-up"></i></button>
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
        <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Định dạng số khi nhập liệu
                    function formatNumber(input) {
                        let value = input.value.replace(/\D/g, '');
                        input.value = value.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
                    }

                    // Xử lý submit form
                    function handleSubmit(event) {
                        // Lấy giá trị từ input và loại bỏ dấu chấm
                        let input = document.getElementById('price');
                        let value = input.value.replace(/\./g, '');

                        // Đặt lại giá trị không có dấu chấm vào input trước khi submit
                        input.value = value;
                    }

                    // Gắn sự kiện cho form và input
                    let form = document.getElementById('add-form');
                    form.addEventListener('submit', handleSubmit);

                    let input = document.getElementById('price');
                    input.addEventListener('input', function () {
                        formatNumber(input);
                    });
                });

                // Hiển thị ảnh xem trước
                document.getElementById("addRepresentImage").addEventListener("change", function (e) {
                    const file = e.target.files[0];
                    if (file) {
                        const reader = new FileReader();
                        reader.onload = function (event) {
                            const preview = document.getElementById("preview");
                            preview.src = event.target.result;
                            preview.style.display = "block";
                            document.getElementById("removeImage").style.display = "block";
                        };
                        reader.readAsDataURL(file);
                    }
                });

                function validateFileType(fileInputId) {
                    const fileInput = document.getElementById(fileInputId);
                    const filePath = fileInput.value;
                    const allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;

                    if (!allowedExtensions.exec(filePath)) {
                        alert('Only accept image files (jpg, jpeg, png, gif).');
                        fileInput.value = '';
                        return false;
                    }
                }

                function removeSelectedImage() {
                    const preview = document.getElementById("preview");
                    const fileInput = document.getElementById("addRepresentImage");
                    preview.src = '<%=request.getContextPath()%>/Image/emty_image.jpg';
                    fileInput.value = '';
                    document.getElementById("removeImage").style.display = "none";
                }
        </script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
