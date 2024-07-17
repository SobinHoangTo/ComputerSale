<%-- Document : PaymentHistory Created on : May 16, 2024, 8:14:16 AM Author : Nguyễn Quang Minh --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Tracking</title>
            <!--bootstrap link-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
                crossorigin="anonymous"></script>
            <!--bootstrap icon-->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
            <style>
                
                .mid {
                    text-align: center;
                }
            </style>


        </head>

        <body>
            <!--Header-->
            
                <%@ include file="../HeadFoot/Header.jsp" %>
                
            <!--end Header-->

            <!-- Content -->
            <div class="container-fluid" style="background-color: #FFF0E3;">
                <br>
                <!-- comment -->
                <div class="container">
                    <div style="text-align: center" class="container">
                        <h2 class="display-3 text-light"><b>Tracking</b></h2>
                    </div>
                    <br /><!-- comment -->

                    <div class="card" style="background-color: #d9d9d9;">
                        <!-- Table -->
                        <div class="container">
                            <h3>Reciever details</h3>
                            <p>Adress: Tổ 1, Phường A, Quận B, Thành phố Hà Nội, Việt Nam</p>
                            <p>Phone number: 0123456789</p>

                        </div>


                        <div class="table-responsive p-2">
                            <div class="table-responsive p-3">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Item</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style="max-width: 220px;">
                                                <a href="<%=request.getContextPath()%>/productdetails"
                                                    class="text-decoration-none text-dark">
                                                    <div class="card text-bg-dark">
                                                        <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" class="card-img" alt="...">
                                                        <div class="card-img-overlay">
                                                            <h5 class="card-title">Product Name</h5>
                                                        </div>
                                                    </div>
                                                </a>
                                            </td>
                                            <td>10.000.000đ</td>
                                            <td>2</td>
                                            <td>20.000.000đ</td>

                                        </tr>
                                        <!-- Add more rows if needed -->
                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <!-- End Table -->

                        <div class="container" style="padding-left: 400px; padding-right: 400px; margin: 0;">
                            <div class="row">
                                <div class="col-md-6 text-right">
                                    <p>Thời gian đặt hàng:</p>
                                    <p>Xác nhận đơn hàng:</p>
                                    <p>Chuẩn bị sản phẩm:</p>
                                    <p>Xuất kho:</p>
                                    <p>Chuyển phát:</p>
                                </div>
                                <div class="col-md-6" style="text-align: right;">
                                    <p>15:20 20/5/2024</p>
                                    <p>15:20 20/5/2024</p>
                                    <p>15:20 20/5/2024</p>
                                    <p>15:20 20/5/2024</p>
                                    <p>15:20 20/5/2024</p>
                                </div>
                            </div>



                        </div>

                        <br>
                        <div style="margin-left: 90%;">

                            <a href="# " >
                            <button type="button" class="btn btn-outline-danger">Cancle</button></a>
                        </div>
                        
                    </div>


                    <!-- comment -->
                    <br>
                </div>
            </div>

            <!-- End Content -->
            <!--Footer-->
            
                <%@ include file="../HeadFoot/Footer.jsp" %>
                
            <!--end Footer-->
        </body>

        </html>