<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>CMS</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />

<link href="<%=request.getContextPath()%>/resources/css/styles.css"
	rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
        crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="<%=request.getContextPath()%>/content">CMS</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->

		<!-- Navbar-->
		<ul
			class="navbar-nav d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item"
						href="<%=request.getContextPath()%>/edit"><i
							class="fas fa-user"></i> User profile</a></li>
					<li>
						<hr class="dropdown-divider" />
					</li>
					<li><a class="dropdown-item" href="#!"><i
							class="fas fa-sign-out-alt"></i> Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<form class="mt-3 mb-2">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Search for..." aria-label="Search for..."
								aria-describedby="btnNavbarSearch" />
							<button class="btn btn-primary" id="btnNavbarSearch"
								type="button">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>
					<div class="nav">
						<hr class="my-2">
						<a class="nav-link" href="<%=request.getContextPath()%>/content">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> View contents
						</a>
						<hr class="my-2">
						<a class="nav-link" href="<%=request.getContextPath()%>/add">
							<div class="sb-nav-link-icon">
								<i class="far fa-edit"></i>
							</div> Form contents
						</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<%
							if (request.getParameter("mgs") != null) {
							int message = Integer.parseInt(request.getParameter("mgs"));
							if (message == 1) {
								%>			
						<div class="alert alert-success" role="alert">
 							 Submit sucess!!!
						</div>
						<%			
							}
							}
						%>
					<h1 class="mt-4">Add Content</h1>
					<hr class="my-3">
					<div class="card mb-4">

						<div class="card-header">
							<h5 class=" text-left mb-1 fw-light fs-5">Content From
								Elements</h5>
						</div>
						<div class="card-body">
							<form method="post"
								action="<%=request.getContextPath()%>/addContent">
								<div class="form-group mb-2">
									<label for="exampleFormControlInput1">Title</label> <input
										type="text" class="form-control" name="title" minlength="10" maxlength="200" required>
								</div>
								<div class="form-group mb-2">
									<label for="exampleFormControlTextarea1">Brief</label>
									<textarea class="form-control" name="brief" rows="3"minlength="30" maxlength="150"></textarea>
								</div>
								<div class="form-group mb-2">
									<label for="exampleFormControlTextarea1">Content</label>
									<textarea class="form-control" name="content" rows="5"minlength="50" maxlength="1000"></textarea>
								</div>
								<button type="submit" class="btn btn-light">Submit
									button</button>
								<button type="reset" class="btn btn-light">Reset button</button>
							</form>
						</div>
					</div>
				</div>
			</main>

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>

</html>