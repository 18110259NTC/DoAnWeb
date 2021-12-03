<%@page import="com.hibernate.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>CMS</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="<%=request.getContextPath()%>/resources/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
<%
		Member acc = (Member) session.getAttribute("account");
	if (acc != null) {
	%>
    <nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="<%=request.getContextPath()%>/content">CMS</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
       
        <!-- Navbar-->
        <ul class="navbar-nav d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/edit"><i class="fas fa-user"></i>   User profile</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/logout"><i class="fas fa-sign-out-alt"></i>   Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <form class="mt-3 mb-2">
                        <div class="input-group">
                            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                                aria-describedby="btnNavbarSearch" />
                            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                                    class="fas fa-search"></i></button>
                        </div>
                    </form>
                    <div class="nav">
                        <hr class="my-2">
                        <a class="nav-link" href="<%=request.getContextPath()%>/content">
                            <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                            View contents
                        </a>
                        <hr class="my-2">
                        <a class="nav-link" href="<%=request.getContextPath()%>/add">
                            <div class="sb-nav-link-icon"><i class="far fa-edit"></i></div>
                            Form contents
                        </a>
                    </div>
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Edit Profile</h1>
                    <hr class="my-3">
                    <div class="card mb-4">
                        
                        <div class="card-header">
                            <h5 class=" text-left mb-1 fw-light fs-5">Profile From Elements</h5>
                        </div>
                        <div class="card-body">
                            <form method="post" action="<%=request.getContextPath()%>/edit">
                                <div class="form-group mb-2">
                                  <input type="hidden" class="form-control" name="id" value="<%=acc.getId()%>">
                                </div>
                                <div class="form-group mb-2">
                                  <input type="hidden" class="form-control" name="username" value="<%=acc.getUserName()%>">
                                </div>
                                <div class="form-group mb-2">
                                  <input type="hidden" class="form-control" name="password"value="<%=acc.getPassword()%>">
                                </div>
                                <div class="form-group mb-2">
                                  <input type="hidden" class="form-control" name="datecreate"value="<%=acc.getCreateDate()%>">
                                </div>
                                <div class="form-group mb-2">
                                  <input type="hidden" class="form-control" name="id"value="<%=acc.getId()%>">
                                </div>
                                <div class="form-group mb-2">
                                  <label for="exampleFormControlInput1">First name:</label>
                                  <input type="text" class="form-control" name="firstName" placeholder="Enter the first name"value="<%=null!=acc.getFirstName()?acc.getFirstName():""%>"minlength="3" maxlength="30" required>
                                </div>
                                <div class="form-group mb-2">
                                    <label for="exampleFormControlInput1">Last name:</label>
                                    <input type="text" class="form-control" name="lastName" placeholder="Enter the last name" value="<%=null!=acc.getLastName()?acc.getLastName():""%>"minlength="3" maxlength="30" required>
                                  </div>
                                  <div class="form-group mb-2">
                                    <label for="exampleFormControlInput1">Email:</label>
                                    <input type="text" class="form-control" name="email" value="<%=acc.getEmail()%>" readonly>
                                  </div>
                                  <div class="form-group mb-2">
                                    <label for="exampleFormControlInput1">Phone:</label>
                                    <input type="tel" class="form-control" name="phone" placeholder="Enter number phone"value="<%=null!=acc.getPhone()?acc.getPhone():""%>"minlength="9" maxlength="13">
                                  </div>
                                <div class="form-group mb-2">
                                  <label for="exampleFormControlTextarea1">Description</label>
                                  <textarea class="form-control" name="description" rows="3" value="<%=null!=acc.getDescription()?acc.getDescription():""%>" maxlength="200"></textarea>
                                </div>
                                <button type="submit" class="btn btn-light">Submit form</button>
                                <button type="reset" class="btn btn-light">Reset form</button>
                              </form>
                        </div>
                    </div>
                </div>
            </main>
            
        </div>
    </div>
    <%} %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="js/datatables-simple-demo.js"></script>
</body>

</html>