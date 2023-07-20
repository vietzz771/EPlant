<%-- 
    Document   : listOrder
    Created on : Jul 1, 2023, 7:53:28 AM
    Author     : Hades
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/admin.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <title>Orders Detail</title>
    </head>
    <body>
        <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
            <!-- Vertical Navbar -->
            <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg" id="navbarVertical">
                <div class="container-fluid">
                    <!-- Toggler -->
                    <button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Brand -->
                    <div class="align-items-center text-center" style="margin: 0 auto">
                        <a
                            class="navbar-brand d-flex  align-items-center"
                            href="/Eplant/"
                            >
                            <img src="assets/images/logo.png" alt="site icon" />
                            <span class="text-uppercase fw-lighter ms-2 text-success">Eplant</span>
                        </a>
                    </div>
                    <!-- User menu (mobile) -->
                    <div class="navbar-user d-lg-none">
                        <!-- Dropdown -->
                        <div class="dropdown">
                            <!-- Toggle -->
                            <a href="#" id="sidebarAvatar" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <div class="avatar-parent-child">
                                    <img alt="Image Placeholder" src="https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=3&w=256&h=256&q=80" class="avatar avatar- rounded-circle">
                                    <span class="avatar-child avatar-badge bg-success"></span>
                                </div>
                            </a>
                            <!-- Menu -->
                            <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                                <a href="#" class="dropdown-item">Profile</a>
                                <a href="#" class="dropdown-item">Settings</a>
                                <a href="#" class="dropdown-item">Billing</a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">Logout</a>
                            </div>
                        </div>
                    </div>
                    <!-- Collapse -->
                    <div class="collapse navbar-collapse" id="sidebarCollapse">
                        <!-- Navigation -->
                        <c:if test="${sessionScope.account != null}">
                            <h2 class=" text-dark text-center">Hello ${sessionScope.account.user}</h2>
                        </c:if>
                        <ul class="navbar-nav">
                            <c:if test="${sessionScope.account.role == 'admin'}">
                                <li class="nav-item">
                                    <a class="nav-link" href="account">
                                        <i class="bi bi-people"></i> Account Management
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href="product">
                                    <i class="bi bi-shop"></i> Product Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="listOrder">
                                    <i class="bi bi-box"></i> Order Management
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Liststatistic">
                                    <i class="bi bi-bar-chart"></i> Statistic
                                </a>
                            </li>
                        </ul>
                        <!-- User (md) -->
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="profile.jsp">
                                    <i class="bi bi-person-square"></i> Profile
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="logout">
                                    <i class="bi bi-box-arrow-left"></i> Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Main content -->
            <div class="h-screen flex-grow-1 overflow-y-lg-auto">
                <div class="bg-white fw-bold">
                    <div class="container-fluid py-3">
                        <h3>Edit Order</h3>
                    </div>
                </div>
                <main class="py-6 bg-surface-secondary">
                    <div class="bg-white p-0 m-3 mt-1 pb-4 shadow card">
                        <div class="container-fluid">
                            <div class="order-header pt-3">
                                <h4 class="mb-0">Order #${order.order_id} details</h4>
                                <p class="opacity-75">${order.payment_status}</p>
                            </div>
                            <div class="order-body mt-1">
                                <div class="row gx-5">
                                    <div class="col-4">
                                        <div class="d-flex flex-column">
                                            <h5>General</h5>
                                            <div class="my-1">
                                                <p class="opacity-75 fw-bold mb-0">Customer:</p>
                                                <p  class="mb-0 opacity-75"> ${account.user} (#${account.account_id} ${account.full_name})</p>
                                            </div>
                                            <div class="my-1">
                                                <p class="opacity-75 fw-bold mb-0">Date create:</p>
                                                <p  class="mb-0 opacity-75"> ${order.order_date}</p>
                                            </div>
                                            <p class="opacity-75 fw-bold mt-1">Order status:</p> 
                                            <form action="updateStatus" method="post">
                                                <input type="hidden" value="${order.order_id}" name="oid"/>
                                                <input type="hidden" value="${account.account_id}" name="aid"/>
                                                <select class="form-select " name="status" id="status">
                                                    <c:if test="${order.order_status == 'pending'}">
                                                        <option value="pending" selected>Pending</option>
                                                        <option value="shipping">Shipping</option>
                                                        <option value="completed">Completed</option>
                                                        <option value="cancelled">Cancelled</option>
                                                    </c:if>
                                                    <c:if test="${order.order_status == 'shipping'}">
                                                        <option value="pending" >Pending</option>
                                                        <option value="shipping" selected>Shipping</option>
                                                        <option value="completed">Completed</option>
                                                        <option value="cancelled">Cancelled</option>
                                                    </c:if>
                                                    <c:if test="${order.order_status == 'completed'}">
                                                        <option value="pending" >Pending</option>
                                                        <option value="shipping" >Shipping</option>
                                                        <option value="completed" selected>Completed</option>
                                                        <option value="cancelled">Cancelled</option>
                                                    </c:if>
                                                    <c:if test="${order.order_status == 'cancelled'}">
                                                        <option value="pending" >Pending</option>
                                                        <option value="shipping" >Shipping</option>
                                                        <option value="completed" >Completed</option>
                                                        <option value="cancelled" selected>Cancelled</option>
                                                    </c:if>
                                                </select>
                                                <button type="submit" class="btn btn-dark mt-3">Update</button>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-4 ">
                                        <div class="d-flex flex-column">
                                            <h5>Shipping</h5>
                                            <p class="opacity-75 my-1">${account.address}</p>
                                            <div class="d-flex flex-column mt-1">
                                                <p class="opacity-75 mb-0 fw-bold">Email address:</p>
                                                <a class="mb-0 text-decoration-underline" href="mailto:${account.email}?subject=SweetWords&body=OK">${account.email}</a>
                                            </div>
                                            <div class="d-flex flex-column mt-1">
                                                <p class="opacity-75 mb-0 fw-bold">Phone:</p>
                                                <a class="mb-0 text-decoration-underline" href="tel:${account.phone}">${account.phone}</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-4 ">
                                        <div class="d-flex flex-column">
                                            <h5>Order notes</h5>
                                            <c:if test="${order.order_notes == ''}">
                                                <p class="opacity-75 my-1">Nothing</p>
                                            </c:if>
                                            <p class="opacity-75 my-1">${order.order_notes}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white p-0 m-3 mt-1 shadow card">
                        <div class="card shadow border-0">
                            <div class="card-header">
                                <h5 class="mb-0">Items</h5>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover table-nowrap">
                                    <thead class="thead-light">
                                        <tr>
                                            <th scope="col">Image</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${orderDetail}" var="listOD">
                                            <c:forEach items="${product}" var="listP">
                                                <c:if test="${listOD.product_id == listP.productID}">
                                                    <tr>
                                                        <td>
                                                            <img alt="..." src="${listP.image}" class="avatar avatar-sm rounded-circle me-2">
                                                        </td>
                                                        <td class= "align-middle">
                                                            ${listP.name}
                                                        </td>
                                                        <td class= "align-middle">
                                                            $ ${listOD.price}.00
                                                        </td>
                                                        <td class= "align-middle">
                                                            x ${listOD.quantity}
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td>Total: $ ${order.total_price}.00</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div> 
    </body>
</html>
