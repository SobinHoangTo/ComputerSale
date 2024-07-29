<!DOCTYPE html>
<html>
    <head>
        <title>Profile</title>
        <!--logo icon-->
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel="stylesheet" href="cssC/bootstrap.min.css">
        <link rel="stylesheet" href="cssC/magnific-popup.css">
        <link rel="stylesheet" href="cssC/jquery-ui.css">
        <link rel="stylesheet" href="cssC/owl.carousel.min.css">
        <link rel="stylesheet" href="cssC/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

        <link rel="stylesheet" href="cssC/aos.css">

        <link rel="stylesheet" href="cssC/style.css">
        <!--bootstrap link-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <!--bootstrap icon-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
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
        <!--Header-->
        <%@ include file="../HeadFoot/Header.jsp" %>
        <!--end Header-->

        <!-- Start content -->
        <div class="container site-section block-8">
            <div class="card h-100 position-relative" style="background-color: #f8f9fa;">
                <div class="row justify-content-center mb-5">
                    <div class="col-md-7 site-section-heading text-center pt-4">
                        <h1 style="color: #DC143C">Profile</h1>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-md-12 col-lg-5 mb-5 text-center">
                        <div class="image-container">
                            <img id="profileImage" src="Image/Avatar/Customer/${requestScope.img}" alt="${requestScope.img}" class="img-fluid rounded" height="259px" width="259px" style="border: 1px solid #555;">
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
                    <a href="shoppinghistory" class="btn btn-primary btn-sm btn-block">Your Order history</a>
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
                        <form action="profile" method="Post" enctype="multipart/form-data">
                            <input type="hidden" name="action" value="edit">
                            <div class="mb-3 row">
                                <label for="detailImages" class="col-sm-4 col-form-label text-end"><b>Avatar</b></label><br/>
                                <div class="col-sm-8">
                                    <div class="image-container">
                                        <img id="editProfileImage" src="Image/Avatar/Customer/${requestScope.img}" alt="Profile Image" class="img-fluid rounded" height="259px" width="259px" style="border: 1px solid #555;">
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
                        <form action="profile" method="Post">
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

        <%@ include file="../HeadFoot/Footer.jsp" %>
        <!-- Back to Top -->
        <button class="btn btn-lg btn-primary btn-lg-square back-to-top d-none" id="back-to-top" onclick="window.scrollTo({top: 0, left: 0, behavior: 'smooth'});"><i class="bi bi-arrow-up"></i></button>

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
                profileImage.src = 'Image/Avatar/Customer/${requestScope.img}';
                this.style.display = "none";
            });

            document.getElementById("editRemoveImageButton").addEventListener("click", function () {
                const profileImage = document.getElementById("editProfileImage");
                profileImage.src = 'Image/Avatar/Customer/${requestScope.img}';
                document.getElementById("editImageUpload").value = '';
                this.style.display = "none";
            });
        </script>
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
