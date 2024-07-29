<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot password</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <!-- Bootstrap Icons CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="cssE/style.css" rel="stylesheet">
        <!-- Viewport -->
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
    </head>
    <body>
        <div class="container-fluid bg-light">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-white rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-center mb-3">
                            <a href="<%=request.getContextPath()%>/home" >
                                <img title="Back to Home" src="<%=request.getContextPath()%>/Image/laptop-icon.png" alt="Logo" class="img-fluid rounded" style="max-height: 100px;">
                            </a>
                            <h3>Confirm code</h3>
                        </div>
                        <c:if test="${param.message!=null}">
                            <div class="form-group">
                                <div class="alert alert-warning" role="alert">
                                    ${param.message}
                                </div>
                            </div>
                        </c:if>
                            <c:if test="${requestScope.message!=null}">
                            <div class="form-group">
                                <div class="alert alert-warning" role="alert">
                                    ${requestScope.message}
                                </div>
                            </div>
                        </c:if>
                        <form action="<%=request.getContextPath()%>/verifycode" method="post">
                            <div class="form-floating mb-4">
                                <input type="text" name="code" class="form-control" id="confirmcode" placeholder="Confirmation code" required>
                                <label for="confirmcode">Confirm code</label>
                            </div>

                            <button type="submit" class="btn btn-primary py-3 w-100 mb-4">Confirm</button>
                        </form>

                        <p class="text-center mb-0"><a href="<%=request.getContextPath()%>/login">Back to Login</a></p>

                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
