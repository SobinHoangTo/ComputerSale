<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta charset="UTF-8">
        <title>Manage Products</title>
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
        <div class="container-fluid  bg-white position-relative d-flex p-0">
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
                <div class="container-fluid pt-4 px-4">
                    <div class="row bg-light rounded justify-content-center mx-0">
                        <div class="container p-2">
                            <!-- Title -->
                            <h1 class="text-dark mt-3 mb-2 display-3">Manage Products</h1>
                            <!-- Search Bar and Add Product Button -->
                            <div class="row">
                                <!-- Search Bar -->
                                <div class="container col-md-5 mb-3" style="width: 45%;">
                                    <form action="manageproducts" method="Post" class="d-flex" role="search">
                                        <input type="hidden" name="action" value="search">
                                        <div class="input-group">
                                            <input type="text" name="search" value="${keyword}" class="form-control" placeholder="Search product..." aria-label="Search product"
                                                   aria-describedby="search-icon">
                                            <button class="btn btn-outline-success" type="submit" id="search-icon"><i class="bi bi-search"></i></button>
                                        </div>
                                    </form>
                                </div>
                                <!-- Category Search -->
                                <div class="container col-md-4 mb-3" style="width: 25%;">
                                    <form action="manageproducts" method="post" role="search">
                                        <input type="hidden" name="action" value="categoryfilter">
                                        <div class="input-group">
                                            <select name="productcate" id="productcate" class="form-select me-2">
                                                <option value="0" ${(empty requestScope.currentCategoryId || requestScope.currentCategoryId==0)?'':'selected'}">All Category</option>
                                                <c:forEach items="${requestScope.listCategory}" var="cp">
                                                    <option value="${cp.getId()}" ${cp.getId() == requestScope.currentCategoryId?"selected":""}>${cp.getName()}</option>
                                                </c:forEach>
                                            </select>
                                            <button class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i></button>
                                        </div>
                                    </form>
                                </div>

                                <!-- Add Product Button -->
                                <div class="container col-md-4 mb-3" style="width: 25%;">
                                    <a href="addproduct" class="btn btn-primary w-100">
                                        Add Product
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- Add Product Modal -->
                        <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content bg-light">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="addProductModalLabel" style="color: red;">Add Product</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <!-- Modal Body -->
                                    <div class="modal-body">
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
                                                <label for="RepresentImage" class="form-label">Represent Image <span class="text-danger"> (*)</span></label><br/>
                                                <div class="image-container mb-2">
                                                    <img src="<%=request.getContextPath()%>/Image/emty_image.jpg" id="addRepresentImage" class="img-fluid" style="width: 200px; border: 1px solid #555;">
                                                    <button type="button" id="addRemoveImageButton" class="remove-image-button" style="display: none;" 
                                                            onclick="removeImage('addRepresentImage', 'addRemoveImageButton', 'addImageUpload', '<%=request.getContextPath()%>/Image/emty_image.jpg')">&times;</button>
                                                </div>
                                                <input type="file" class="form-control" id="addImageUpload" name="representImage"
                                                       accept="image/*" onchange="previewImage(this, 'addRepresentImage', 'addRemoveImageButton')" required>
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
                                                <input type="text" class="form-control format-number" id="price" name="price" placeholder="Enter Price > 0" required>
                                            </div>
                                            <!-- Quantity -->
                                            <div class="mb-3">
                                                <label for="quantity" class="form-label">Quantity <span class="text-danger">(*)</span></label>
                                                <input type="text" class="form-control" id="quantity" name="quantity" placeholder="Enter Quantity > 0" required>
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
                        </div>

                        <!-- Product Table -->
                        <div class="container p-4">
                            <c:if test="${not empty alertMessage}">
                                <div class="alert alert-${alertType} alert-dismissible fade show" role="alert">
                                    ${alertMessage}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped">
                                    <thead class="table-light">
                                        <tr class="text-nowrap">
                                            <th>Name</th>
                                            <th>Represent Image</th> 
                                            <th>Created By</th>
                                            <th>Created On</th>
                                            <th>Modified By</th>
                                            <th>Modified On</th>
                                            <th class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${empty listProduct}">
                                            <tr>
                                                <td colspan="18" class="text-center">No product available</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach items="${requestScope.listProduct}" var="product">
                                            <tr class="text-nowrap">
                                                <td>${product.name}</td>
                                                <td class="text-center"> <!-- Ảnh đại diên cho sản phẩm -->
                                                    <img class="img-fluid rounded-2" src="<%=request.getContextPath()%>/Image/Products/${product.representImage}" alt="${product.name}" style="max-width: 150px;">
                                                </td> 
                                                <td class="text-end">${product.created_by}</td>
                                                <td class="text-end">${product.created_on}</td>
                                                <td class="text-end">${product.modified_by}</td>
                                                <td class="text-end">${product.modified_on}</td>
                                                <td>
                                                    <div class="text-center">
                                                        <!--Button Display-->
                                                        <c:if test="${product.getStatus() == 0}">
                                                            <div class="btn-group" role="group" aria-label="Product Actions">
                                                                <form action="manageproducts" method="post">
                                                                    <input type="hidden" name="action" value="display">
                                                                    <input type="hidden" name="id" value="${product.id}">
                                                                    <!-- Display Status Button -->
                                                                    <button type="submit" class="btn btn-outline-danger btn-sm" title="Display" data-bs-toggle="modal">
                                                                        <i class="bi bi-toggle-off"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </c:if>

                                                        <!--Button Hidden-->
                                                        <c:if test="${product.getStatus() != 0}">
                                                            <div class="btn-group" role="group" aria-label="Product Actions">
                                                                <form action="manageproducts" method="post">
                                                                    <input type="hidden" name="action" value="hidden">
                                                                    <input type="hidden" name="id" value="${product.id}">
                                                                    <!-- Display Status Button -->
                                                                    <button type="submit" class="btn btn-outline-success btn-sm" title="Hidden" data-bs-toggle="modal">
                                                                        <i class="bi bi-toggle-on"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </c:if>

                                                        <!--Button Serial Numbers-->   
                                                        <div class="btn-group" role="group" aria-label="Product Actions">
                                                            <a href="manageserialnumber?productID=${product.id}" class="btn btn-primary btn-sm">
                                                                <i class="bi bi-upc-scan"></i>
                                                            </a>
                                                        </div>

                                                        <!--Button Edit-->
                                                        <div class="btn-group" role="group" aria-label="Product Actions">
                                                            <button type="button" class="btn btn-light btn-sm" title="Edit" data-bs-toggle="modal"
                                                                    data-bs-target="#editProductModal${product.id}">
                                                                <i class="bi bi-pencil-square"></i> 
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <!-- Edit Product Modal --> 
                                                    <div class="modal fade" id="editProductModal${product.id}" tabindex="-1" aria-labelledby="editProductModalLabel${product.id}" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content bg-light">
                                                                <!-- Modal Header -->
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="editProductModalLabel${product.id}" style="color: red;"><strong>Edit Product</strong></h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>
                                                                <!-- Modal Body -->
                                                                <div class="modal-body">
                                                                    <!-- Form to edit product details -->
                                                                    <form action="manageproducts" method="Post" enctype="multipart/form-data">
                                                                        <input type="hidden" name="action" value="edit">
                                                                        <input type="hidden" name="id" value="${product.id}">
                                                                        <!-- Name -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="name" class="form-label">Name<span class="text-danger"> (*)</span></label>
                                                                            <input type="text" class="form-control" id="name" name="name" value="${product.getName()}" required>
                                                                        </div>
                                                                        <!-- Ảnh đại diện sản phẩm -->
                                                                        <div class="mb-3">
                                                                            <label for="representImage" class="form-label">Represent Image<span class="text-danger"> (*)</span></label><br/><br/>
                                                                            <img id="previewEdit${product.id}" src="Image/Products/${product.getRepresentImage()}" alt="${product.getName()}" style="width: 30%"/>
                                                                            <button type="button" id="removeImageEdit${product.id}" onclick="removeSelectedImageEdit(${product.id})" style="display: none;">Remove Image</button>
                                                                            <input type="hidden" name="existingImage" value="${product.getRepresentImage()}">
                                                                            <input type="file" class="form-control" id="editRepresentImage${product.id}" name="representImage" accept="image/*" data-existing-image="${product.getRepresentImage()}" onchange="validateFileType('editRepresentImage${product.id}', 'previewEdit${product.id}', 'removeImageEdit${product.id}')">
                                                                        </div>
                                                                        <!-- Detail Images -->
                                                                        <div class="mb-3">
                                                                            <label for="listImage" class="form-label">List Image<span class="text-danger"> (*)</span></label><br/><br/>
                                                                            <c:forEach items="${listImage}" var="image">
                                                                                <c:if test="${image.product_id == product.id}">
                                                                                    <img class="img-fluid" src="<%=request.getContextPath()%>/Image/Products/ImgList/${image.img}" alt="detailImages" style="max-width: 150px;">
                                                                                </c:if>
                                                                            </c:forEach>
                                                                            <br/><input type="file" class="form-control" name="detailImages" id="detailImages" multiple>
                                                                        </div>
                                                                        <!-- CPU -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="CPU" class="form-label">CPU<span class="text-danger"> (*)</span></label>
                                                                            <input type="text" class="form-control" id="CPU" name="CPU" value="${product.getCPU()}" required>
                                                                        </div>
                                                                        <!-- GPU -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="GPU" class="form-label">GPU<span class="text-danger"> (*)</span></label>
                                                                            <input type="text" class="form-control" id="GPU" name="GPU" value="${product.getGPU()}" required>
                                                                        </div>
                                                                        <!-- RAM -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="RAM" class="form-label">RAM<span class="text-danger"> (*)</span></label>
                                                                            <input type="text" class="form-control" id="RAM" name="RAM" value="${product.getRAM()}" required>
                                                                        </div>
                                                                        <!-- ROM -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="ROM" class="form-label">ROM<span class="text-danger"> (*)</span></label>
                                                                            <input type="text" class="form-control" id="ROM" name="ROM" value="${product.getROM()}" required>
                                                                        </div>
                                                                        <!-- Monitor -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="monitor" class="form-label">Monitor<span class="text-danger"> (*)</span></label>
                                                                            <input type="text" class="form-control" id="monitor" name="monitor" value="${product.getMonitor()}" required>
                                                                        </div>
                                                                        <!-- OS -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="OS" class="form-label">OS<span class="text-danger"> (*)</span></label>
                                                                            <input type="text" class="form-control" id="OS" name="OS" value="${product.getOS()}" required>
                                                                        </div>
                                                                        <!-- Price -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="price" class="form-label">Price<span class="text-danger"> (*)</span></label>
                                                                            <input type="number" class="form-control" id="price-edit" name="price" value="${product.getPrice()}" required>
                                                                        </div>
                                                                        <!-- Quantity -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="quantity" class="form-label">Quantity<span class="text-danger"> (*)</span></label>
                                                                            <input type="number" class="form-control" id="quantity" name="quantity" value="${product.getQuantity()}" required>
                                                                        </div>
                                                                        <!-- Description -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="description" class="form-label">Description<span class="text-danger"> (*)</span></label>
                                                                            <textarea class="form-control" id="description" name="description" rows="3" required>${product.getDescription()}</textarea>
                                                                        </div>
                                                                        <!-- Brand -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="brand" class="form-label">Brand<span class="text-danger"> (*)</span></label>
                                                                            <select class="form-control" id="brand" name="brand" required>
                                                                                <c:forEach items="${requestScope.listBrand}" var="brand">
                                                                                    <option value="${brand.getId()}"
                                                                                            <c:if test="${brand.getId() == product.getBrand_id()}">
                                                                                                selected="selected"
                                                                                            </c:if>
                                                                                            >${product.getName()}
                                                                                    </option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <!-- Category -->
                                                                        <div class="form-group mb-3">
                                                                            <label for="category" class="form-label">Category<span class="text-danger"> (*)</span></label>
                                                                            <select class="form-control" id="category" name="category" required>
                                                                                <c:forEach items="${requestScope.listCategory}" var="c">
                                                                                    <option value="${c.getId()}" ${c.getId() == product.getCategory_id()?"selected":""}>${c.getName()}</option>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!--pagination-->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-end">
                                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/manageproducts?pageNumber=1">Previous</a></li>
                                    <c:if test="${param.pageNumber==1}">
                                    <li class="page-item disabled">
                                        <a class="page-link" href="<%=request.getContextPath()%>/manageproducts?pageNumber=${(param.pageNumber-1)<1?requestScope.numberOfPage:(param.pageNumber-1)}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${requestScope.numberOfPage<=5}">
                                    <c:forEach begin="1" end="${requestScope.numberOfPage}" var="i">
                                        <li class="page-item ${i==param.pageNumber?"active":""}">
                                            <a class="page-link" href="<%=request.getContextPath()%>/manageproducts?pageNumber=${i}">${i}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${requestScope.numberOfPage>5}">
                                    <c:choose>
                                        <c:when test="${param.pageNumber-3<=0}">
                                            <c:forEach begin="1" end="5" var="i">
                                                <li class="page-item ${i==param.pageNumber?"active":""}">
                                                    <a class="page-link" href="<%=request.getContextPath()%>/manageproducts?pageNumber=${i}">${i}</a>
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
                                                    <a class="page-link" href="<%=request.getContextPath()%>/manageproducts?pageNumber=${i}">${i}</a>
                                                </li>
                                            </c:forEach>

                                        </c:when>
                                        <c:otherwise>
                                            <li>
                                                <a class="page-link" href="#">...</a>
                                            </li>
                                            <c:forEach begin="${param.pageNumber-2}" end="${param.pageNumber+2}" var="i">
                                                <li class="page-item ${i==param.pageNumber?"active":""}">
                                                    <a class="page-link" href="<%=request.getContextPath()%>/manageproducts?pageNumber=${i}">${i}</a>
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
                                       href="<%=request.getContextPath()%>/manageproducts?pageNumber=${(param.pageNumber+1)>requestScope.numberOfPage?1:(param.pageNumber+1)}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </li>
                                <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/manageproducts?pageNumber=${numberOfPage}">End</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <%@include file="../HeadFoot/EmployeeFooter.jsp" %>
            </div>
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
                                                                                        let priceInput = document.getElementById('price');
                                                                                        let quantityInput = document.getElementById('quantity');
                                                                                        let priceValue = priceInput.value.replace(/\./g, '');
                                                                                        let quantityValue = quantityInput.value.replace(/\./g, '');

                                                                                        // Đặt lại giá trị không có dấu chấm vào input trước khi submit
                                                                                        priceInput.value = priceValue;
                                                                                        quantityInput.value = quantityValue;
                                                                                    }

                                                                                    // Gắn sự kiện cho form và input
                                                                                    let form = document.getElementById('add-form');
                                                                                    form.addEventListener('submit', handleSubmit);

                                                                                    let priceInput = document.getElementById('price');
                                                                                    priceInput.addEventListener('input', function () {
                                                                                        formatNumber(priceInput);
                                                                                    });

                                                                                    let quantityInput = document.getElementById('quantity');
                                                                                    quantityInput.addEventListener('input', function () {
                                                                                        formatNumber(quantityInput);
                                                                                    });
                                                                                });
                                                                                function previewImage(input, imgElementId, removeButtonId) {
                                                                                    const file = input.files[0];
                                                                                    if (file) {
                                                                                        const reader = new FileReader();
                                                                                        reader.onload = function (e) {
                                                                                            document.getElementById(imgElementId).src = e.target.result;
                                                                                            document.getElementById(imgElementId).style.display = 'block';
                                                                                            document.getElementById(removeButtonId).style.display = 'inline';
                                                                                        };
                                                                                        reader.readAsDataURL(file);
                                                                                    }
                                                                                }

                                                                                function removeImage(imgElementId, removeButtonId, inputFileId, originalSrc) {
                                                                                    document.getElementById(imgElementId).src = originalSrc;
                                                                                    document.getElementById(imgElementId).style.display = 'block';
                                                                                    document.getElementById(removeButtonId).style.display = 'none';
                                                                                    document.getElementById(inputFileId).value = '';
                                                                                }
        </script>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>
