<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Profile</title>
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
                <div class="container site-section block-8">
                    <div class="card h-100 position-relative" style="background-color: #f8f9fa;">
                        <div class="row justify-content-center mb-5">
                            <div class="col-md-7 site-section-heading text-center pt-4">
                                <h1 style="color: #DC143C">Employee Profile</h1>
                            </div>
                        </div>
                        <div class="row align-items-center">
                            <div class="col-md-12 col-lg-5 mb-5 text-center">
                                <div class="image-container">
                                    <img id="profileImage" src="Image/Avatar/Employee/${requestScope.img}" alt="${requestScope.img}" class="img-fluid me-lg-2" height="259px" width="259px" style="border: 1px solid #555;">
                                    <button id="removeImageButton" class="remove-image-button" style="display: none;">&times;</button>
                                </div>
                            </div>
                            <div class="col-md-12 col-lg-7">
                                <div class="row mb-3">
                                    <div class="col-sm-5">
                                        <label><b>Name: </b></label>
                                    </div>
                                    <div class="col-sm-7">
                                        <p>${requestScope.fname} ${requestScope.lname}</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-5">
                                        <label><b>Email: </b></label>
                                    </div>
                                    <div class="col-sm-7">
                                        <p>${requestScope.email}</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-5">
                                        <label><b>Phone number: </b></label>
                                    </div>
                                    <div class="col-sm-7">
                                        <p>${requestScope.phone}</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-5">
                                        <label><b>Address: </b></label>
                                    </div>
                                    <div class="col-sm-7">
                                        <p>${requestScope.address}</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-5">
                                        <label><b>Account created on: </b></label>
                                    </div>
                                    <div class="col-sm-7">
                                        <p>${requestScope.reg_date}</p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <c:if test="${not empty param.mess}">
                                        <div class="alert alert-${param.alertType} col-sm-10" role="mess">
                                            ${param.mess}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-5">
                                        <button class="btn btn-primary btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#editProfileModal${requestScope.id}">Edit</button>
                                    </div>
                                    <div class="col-sm-7">
                                        <button class="btn btn-warning btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#changePasswordModal${requestScope.id}">Change Password</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Edit Profile Modal -->
                <div class="modal fade" id="editProfileModal${requestScope.id}" tabindex="-1" aria-labelledby="editProfileModalLabel${requestScope.id}" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProfileModalLabel${requestScope.id}" style="color: #DC143C;">Edit Profile</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <!-- Modal Body -->
                            <div class="modal-body">
                                <!-- Form to edit profile -->
                                <form action="employeeprofile" method="Post" enctype="multipart/form-data">
                                    <input type="hidden" name="action" value="edit">
                                    <div class="mb-3 row">
                                        <label for="detailImages" class="col-sm-4 col-form-label text-end"><b>Avatar</b><span class="text-danger">(*)</span></label><br/>
                                        <div class="col-sm-8">
                                            <div class="image-container">
                                                <img id="editProfileImage" src="Image/Avatar/Employee/${requestScope.img}" alt="${requestScope.img}" class="img-fluid rounded" style="max-height: 259px; border: 2px solid #555;">
                                                <button type="button" id="editRemoveImageButton" class="remove-image-button" style="display: none;">&times;</button>
                                            </div>
                                            <input type="hidden" name="existingImg" value="${requestScope.img}">
                                            <input type="file" class="form-control" name="img" id="editImageUpload" accept="image/*" onchange="previewImage(this, 'editProfileImage', 'editRemoveImageButton')">
                                        </div>
                                    </div>

                                    <div class="mb-3 row">
                                        <label class="col-sm-4 col-form-label text-end"><b>First Name</b></label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="text" name="fname" value="${requestScope.fname}">
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-4 col-form-label text-end"><b>Last Name</b></label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="text" name="lname" value="${requestScope.lname}">
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-4 col-form-label text-end"><b>Email</b></label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="email" name="email" value="${requestScope.email}" disabled>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-4 col-form-label text-end"><b>Phone number</b></label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="text" name="phone" value="${requestScope.phone}">
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-4 col-form-label text-end"><b>Address</b></label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="text" name="address" value="${requestScope.address}">
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button class="btn btn-primary" type="submit">Save Changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Change Password Modal -->
                <div class="modal fade" id="changePasswordModal${requestScope.id}" tabindex="-1" aria-labelledby="changePasswordModalLabel${requestScope.id}" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h5 class="modal-title" id="changePasswordModalLabel${requestScope.id}" style="color: #DC143C;">Change Password</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <!-- Modal Body -->
                            <div class="modal-body">
                                <!-- Form to change password -->
                                <form action="employeeprofile" method="Post">
                                    <input type="hidden" name="action" value="changepassword">
                                    <div class="mb-3 row">
                                        <label class="col-sm-4 col-form-label text-end"><b>Old Password</b></label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="password" name="old_password" placeholder="Old password" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-4 col-form-label text-end"><b>New Password</b></label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="password" name="new_password" placeholder="New Password" required>
                                        </div>
                                    </div>
                                    <div class="mb-3 row">
                                        <label class="col-sm-4 col-form-label text-end"><b>Confirm Password</b></label>
                                        <div class="col-sm-8">
                                            <input class="form-control" type="password" name="confirm_password" placeholder="Confirm Password" required>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-warning">Change Password</button>
                                    </div>
                                </form>
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
        <script>
                                                function previewImage(input, imageId, buttonId) {
                                                    const file = input.files[0];
                                                    if (file) {
                                                        const reader = new FileReader();
                                                        reader.onload = function (event) {
                                                            const image = document.getElementById(imageId);
                                                            const button = document.getElementById(buttonId);
                                                            image.src = event.target.result;
                                                            image.style.display = "block";
                                                            button.style.display = "block";
                                                        };
                                                        reader.readAsDataURL(file);
                                                    }
                                                }

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

                                                document.getElementById("removeImageButton").addEventListener("click", function () {
                                                    const profileImage = document.getElementById("profileImage");
                                                    profileImage.src = 'Image/Avatar/Employee/${requestScope.img}';
                                                    this.style.display = "none";
                                                });

                                                document.getElementById("editRemoveImageButton").addEventListener("click", function () {
                                                    const profileImage = document.getElementById("editProfileImage");
                                                    profileImage.src = 'Image/Avatar/Employee/${requestScope.img}';
                                                    document.getElementById("editImageUpload").value = '';
                                                    this.style.display = "none";
                                                });
        </script>
    </body>
</html>
