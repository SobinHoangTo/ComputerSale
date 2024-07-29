<%-- 
    Document   : ProductFeedback
    Created on : May 20, 2024, 9:26:20 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="<%=request.getContextPath()%>/Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product feedback</title>
    </head>
    <body>
        <!--Feedback title-->
        <p class="display-5 p-3">
            Review 
            <i class="bi bi-star-fill"></i> <!-- Filled Bootstrap star icon -->
            <i class="bi bi-star-half"></i> <!-- Half Bootstrap star icon -->
            <i class="bi bi-star"></i> <!-- Bootstrap star icon -->
            <i class="bi bi-star"></i> <!-- Bootstrap star icon -->
            <i class="bi bi-star"></i> <!-- Bootstrap star icon -->

        </p>
        <!--End title-->
        <p class="h5 p-3"> All review: 1 </p>
        <!--Thông tin comment-->
        <div class="p-4">
            <div class="card border-secondary">
                <!--User comment-->
                <!--Start Title-->
                <div class="container row h4 p-4" >
                    <p class="col-1"></p>
                    <p class="col-8">DuyHieu</p>
                    <p class="col-3 text-end">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                    </p>
                </div>
                <!--Kết thúc tiêu đề-->


                <div class="container p-3">
                    <p>Vinh messed up the laptop so badly that he decided to throw it in the washing machine. After running it for about 3 hours, he thought it wasn't clean enough, so he grabbed the car's high-pressure water hose and sprayed it for another hour. Now it's pretty clean, but for some reason, the laptop doesn't boot. I think the manufacturer had some problem with it, so I want to have a refund.</p>
                    <!--Ảnh feedback-->
                    <div class="container-fluid ">
                        <!--edit here-->
                        <div class="container mt-5">
                            <div class="row">
                                <div class="col-auto">
                                    <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" alt="alt" width="170" height="107"/>
                                </div>
                                <div class="col-auto">
                                    <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" alt="alt" width="170" height="107"/>
                                </div>
                                <div class="col-auto">
                                    <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" alt="alt" width="170" height="107"/>
                                </div>
                                <div class="col-auto">
                                    <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" alt="alt" width="170" height="107"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Kết thúc ảnh-->
                </div>
            </div>
            <br/>


            <div class="card border-secondary">
                <!--User comment-->
                <!--Start Title-->
                <div class="container row h4 p-4" >
                    <p class="col-1"></p>
                    <p class="col-8">Add comment</p>
                    <p class="col-3 text-end">
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                        <i class="bi bi-star-fill"></i>
                    </p>
                </div>
                <!--Kết thúc tiêu đề-->


                <div class="container row h4 p-3">

                    <div class="container-fluid ">
                        <!--edit here-->
                        <div class="form-group">
                            <label for="username">Add comment</label>
                            <input type="text" class="form-control" 
                                   id="username" placeholder="Add comment"
                                   value="${param.username}" name="username"
                                   required>
                        </div>
                    </div>

                    <div class="container col-10"></div>
                    <div class="container col-2">
                        <button type="button" style="border-radius: 8px">Add comment</button>

                    </div>
                </div>
            </div>
        </div>




        <!--Kết thúc thông tin comment-->
    </body>
</html>