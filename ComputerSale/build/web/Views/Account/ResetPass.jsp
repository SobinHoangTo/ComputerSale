<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            body {
                background: #f8f9fa; /* Light grey background */
                height: 100vh;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;width: 100vw;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-center mb-3">
                            <a href="<%=request.getContextPath()%>/home" >
                                <img title="Back to Home" src="../../Image/laptop-icon.png" alt="Logo" class="img-fluid rounded" style="max-height: 100px;">
                            </a>
                            <h3>Reset Password</h3>
                        </div>

                        <form action="<%=request.getContextPath()%>/resetpassword" method="post">
                            <div class="mb-3">
                                <label for="password" class="form-label">New Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-4">
                                <label for="confirmpass" class="form-label">Confirm New Password</label>
                                <input type="password" class="form-control" id="confirmpass" name="confirmpass" required>
                            </div>
                            <button type="submit" class="btn btn-primary py-3 w-100 ">Confirm</button>
                        </form>

                        <hr>

                        <div class="text-center">
                            <a href="<%=request.getContextPath()%>/Views/Account/Login.jsp">
                                <h4>Back to Login</h4>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
