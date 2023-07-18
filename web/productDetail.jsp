<%-- 
    Document   : productDetail
    Created on : Mar 16, 2023, 4:08:07 AM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
    </head>
    <body>
        <%@ include file="/includes/start.jsp" %>
        <%@ include file="/includes/navbar.jsp" %>
        <c:set var="o" value="${requestScope.PD}"/>
        <div class="container mt-17">
            <div class="row border-bt pb-5">
                <div class="col-6 product-img">
                    <img src="${detail.image}" alt="alt"/>
                </div>
                <div class="col-6">
                    <div class="py-3 sub-link d-flex">
                        <a href="/Eplant" class="px-2">Home</a>
                        >
                        <a href="shop" class="px-2">Shop</a>
                        >
                        <a href="category?cid=${cid}" class="px-2">${category.cname}</a>
                        >
                        <p class="px-2">${detail.name}</p>
                    </div>
                    <div class="product-content">
                        <div class="border-bt pb-3">
                            <h3 class="text-capitalize mt-4">${detail.name}</h3>
                            <span class="fw-bold">$ ${detail.price}.00</span>
                        </div>
                        <div class="py-4 border-bt pd-text">
                            <p>${detail.description}</p>
                            <div class="product-input mt-4">
<!--                                <a href="process-product-detail?num=-1&id=${detail.productID}&cid=${detail.cid}">
                                    <button class="btn btn-pd h-100">-</button>
                                </a>
                                <input name="quantity" type="number" id="typeNumber" class="form-control" value="1" />
                                <a href="process-product-detail?num=1&id=${detail.productID}&cid=${detail.cid}">
                                    <button class="btn btn-pd h-100">+</button>
                                </a>
                                    <p>${t.quantity}</p>-->
                                <div class="add-btn mx-0">
                                    <a href="add-to-cart?id=${detail.productID}&num=1&name=pd" class="text-decoration-none text-dark btn-hover">
                                        <button class="btn m-2 text-dark button">
                                            <i class="fa fa-shopping-cart"></i> Add to Cart
                                        </button>
                                    </a>
                                </div>
                            </div>
                            <div class="buyn-btn mt-3">
                                <a href="buy-now?id=${detail.productID}&num=1" class="text-decoration-none text-dark btn-hover">
                                    <button class="btn m-2 text-dark button">
                                        <i class="fa fa-shopping-cart"></i> Buy Now
                                    </button>
                                </a>
                            </div>
                        </div>
                        <div class="py-3">
                            <div class="d-flex  text-items">
                                <span>SKU: </span>
                                <p class="mx-2">${cid}</p>
                            </div>   
                            <div class="d-flex  text-items">    
                                <span>Categories: </span>
                                <p class="mx-2">${category.cname}</p>
                            </div> 
                            <div class="d-flex  text-items">
                                <span>Tags: </span>
                                <p class="mx-2">Leuleu, Hihi</p>
                            </div>
                            <div class="d-flex  text-items">
                                <span>Share: </span>
                                <p class="mx-2">Leuleu</p>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="py-5">
                <div class="title text-center align-items-center feature-title">
                    <h2 class="position-relative">Related Products</h2>
                </div>
                <div class="collection-list row">
                    <c:forEach items="${list}" var="p">
                        <div class="col-md-6 col-lg-3 col-xl-3 p-4">
                            <div class="transition">
                                <a href="productDetail?pid=${p.productID}&cid=${p.cid}" class="a-fix">
                                    <div class="collection-img position-relative">
                                        <img
                                            src="${p.image}"
                                            class="w-100"
                                            />
                                    </div>
                                    <div class="text-center">
                                        <p class="text-capitalize my-1">${p.name}</p>
                                        <span class="fw-bold">$ ${p.price}</span>
                                        <div>
                                            <a href="add-to-cart?id=${p.productID}&num=1" class="text-decoration-none text-dark btn-hover">
                                                <button class="btn m-2 text-dark button">
                                                    <i class="fa fa-shopping-cart"></i> Add to Cart
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <%@ include file="/includes/footer.jsp" %>
        
    </body>
    <script src="assets/js/jquery-3.6.0.js"></script>
        <!-- isotope js -->
        <script src="https://unpkg.com/isotope-layout@3/dist/isotope.pkgd.js"></script>
        <!-- bootstrap js -->
        <script src="assets/bootstrap-5.0.2-dist/js/bootstrap.min.js"></script>
        <!-- custom js -->
        <script src="assets/js/script.js"></script>
</html>