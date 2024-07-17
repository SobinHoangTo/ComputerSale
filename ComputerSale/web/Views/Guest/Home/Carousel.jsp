<%-- 
    Document   : Carousel
    Created on : May 19, 2024, 9:38:52 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="Image/laptop-icon.png" type="image/x-icon">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carousel</title>
       
    </head>
    <body>
        <div id="carouselExampleCombined"  data-bs-ride="carousel">
            <div class="site-blocks-cover" style="background-image: url(Image/Products/laptops-2048px-5607.png)">
                <!--<img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" class="img-fluid w-75" alt="...">-->
                <div class="container">
                    <div class="row align-items-start align-items-md-center justify-content-end">
                        <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
                            <h1 class="mb-2">Finding Your Perfect Laptop</h1>
                            <div class="intro-text text-center text-md-left">
                                <p class="mb-4">Buy your best laptop</p>
                                <p>
                                    <a href="productslist" class="btn btn-sm btn-primary">Shop Now</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-section site-section-sm site-blocks-1">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"  data-aos-delay="">
                            <div class="icon mr-4 align-self-start">
                                <span class="bi bi-truck" style="color: #DC143C;"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Free Shipping</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"  data-aos-delay="100">
                            <div class="icon mr-4 align-self-start">
                                <span class="bi bi-arrow-repeat" style="color: #DC143C;"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Free Returns</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4"  data-aos-delay="200">
                            <div class="icon mr-4 align-self-start">
                                <span class="bi bi-question-circle" style="color: #DC143C;"></span>
                            </div>
                            <div class="text">
                                <h2 class="text-uppercase">Customer Support</h2>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at iaculis quam. Integer accumsan tincidunt fringilla.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--            <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleCombined" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleCombined" data-bs-slide-to="1" aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleCombined" data-bs-slide-to="2" aria-label="Slide 3"></button>
                        </div>
                        <div class="carousel-inner">
                            Bắt đầu ảnh thứ nhất
                            <div class="carousel-item active"> Để ý class active 
                                Source ảnh thứ nhất
                                <div class="d-flex justify-content-center">
                                    <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" class="img-fluid w-75" alt="...">
                                </div>
                                Nội dung ảnh thứ nhất
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>First slide label</h5>
                                    <p>Some representative placeholder content for the first slide.</p>
                                </div>
                            </div>
                            Kết thúc ảnh thứ nhất
                            
                            
                            
                            Bắt đầu ảnh thứ 2
                            <div class="carousel-item">
                                Source ảnh thứ 2
                                <div class="d-flex justify-content-center">
                                    <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" class="img-fluid w-75" alt="...">
                                </div>
                                Nội dung ảnh thứ 2
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>Second slide label</h5>
                                    <p>Some representative placeholder content for the second slide.</p>
                                </div>
                            </div>
                            Kết thúc ảnh thứ 2
                            
                            
                            Bắt đầu ảnh thứ 3
                            <div class="carousel-item">
                                Source ảnh thứ 2
                                <div class="d-flex justify-content-center">
                                    <img src="<%=request.getContextPath()%>/Image/Products/laptops-2048px-5607.png" class="img-fluid w-75" alt="...">
                                </div>
                                Nội dung ảnh thứ 2
                                <div class="carousel-caption d-none d-md-block">
                                    <h5>Third slide label</h5>
                                    <p>Some representative placeholder content for the third slide.</p>
                                </div>
                            </div>
                            Kết thúc ảnh thứ 3
                            
                            
                            
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCombined" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCombined" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>-->
        </div>


    </body>
</html>
