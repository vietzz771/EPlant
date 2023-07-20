<%-- 
    Document   : collection
    Created on : Mar 16, 2023, 12:42:24 AM
    Author     : Hades
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="collection" class="py-5">
    <div class="container">
        <div class="title text-center">
            <h2 class="position-relative d-inline-block">
                Best Collection
            </h2>
        </div>
        <div class="row g-0">
            <div
                class="d-flex flex-wrap justify-content-center mt-5 filter-button-group"
                >
                <button
                    type="button"
                    class="btn m-2 text-dark active-filter-btn"
                    data-filter=".eu"
                    >
                    All
                </button>
                <button
                    type="button"
                    class="btn m-2 text-dark"
                    data-filter=".best"
                    >
                    Best Sellers
                </button>
                <button
                    type="button"
                    class="btn m-2 text-dark"
                    data-filter=".feat"
                    >
                    Featured
                </button>
                <button
                    type="button"
                    class="btn m-2 text-dark"
                    data-filter=".new"
                    >
                    New Arrival
                </button>
            </div>
            <!-- items -->
            <div class="collection-list mt-4 row gx-0 gy-3">
                <c:forEach items="${list}" var="p" >
                    <div class="col-md-6 col-lg-4 col-xl-3 p-2 ${p.filter} ">
                        <div class="transition">
                            <a href="productDetail?pid=${p.productID}&cid=${p.cid}" class="a-fix">
                                <div class="collection-img position-relative">
                                    <img
                                        src="${p.image}"
                                        class="w-100"
                                        />
                                </div>
                                <div class="text-center">
                                    <div class="rating mt-3">
                                        <span class="text-primary"
                                              ><i class="fas fa-star"></i
                                            ></span>
                                        <span class="text-primary"
                                              ><i class="fas fa-star"></i
                                            ></span>
                                        <span class="text-primary"
                                              ><i class="fas fa-star"></i
                                            ></span>
                                        <span class="text-primary"
                                              ><i class="fas fa-star"></i
                                            ></span>
                                        <span class="text-primary"
                                              ><i class="fas fa-star"></i
                                            ></span>
                                    </div>
                                    <p class="text-capitalize my-1">${p.name}</p>
                                    <span class="fw-bold">$ ${p.price}.00</span>
                                    <div>
                                        <a href="buy-now?id=${p.productID}&num=1" class="text-decoration-none text-dark btn-hover">
                                            <button class="btn m-2 text-dark button">
                                                <i class="fa fa-shopping-cart"></i> Buy now
                                            </button>
                                        </a>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:forEach>
                
            </div>
            <div
                class="d-flex flex-wrap justify-content-center mt-5 btn-more"
                >
                <a href="shop">
                    <button
                        type="button"
                        class="btn m-2 text-dark"
                        data-filter=".eu"
                        >
                        Show more
                    </button>
                </a>
            </div>
        </div>
    </div>
</section>