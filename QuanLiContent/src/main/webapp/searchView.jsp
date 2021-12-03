<%@page import="com.hibernate.bean.Content"%>
<%@page import="java.util.List"%>
<%@page import="com.hibernate.bean.Member"%>
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
	<%
		Member acc = (Member) session.getAttribute("account");
		if (acc != null) {
	%>
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
					<li><a class="dropdown-item" href="<%=request.getContextPath()%>/edit"><i
							class="fas fa-user"></i> User profile</a></li>
					<li>
						<hr class="dropdown-divider" />
					</li>
					<li><a class="dropdown-item"
						href="<%=request.getContextPath()%>/logout"><i
							class="fas fa-sign-out-alt"></i> Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<form class="mt-3 mb-2" method="post" action="<%=request.getContextPath()%>/search">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Search for..." aria-label="Search for..."
								aria-describedby="btnNavbarSearch" name="search" />
							<button class="btn btn-primary" id="btnNavbarSearch"
								type="submit">
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
	<!-- 	<div id="loading" style="display: block">
			<main>
				<div  class="container-fluid px-4">
					<h1 class="mt-4">Loading.....</h1>
				</div>
			</main>
		</div> -->
		<div id="layoutSidenav_content">
			<main>
				
				<div class="container-fluid px-4" id="content"  >
					<h1 class="mt-4">Result for '<%=request.getAttribute("word")%>'</h1>
					<hr class="my-3">
					<div class="card mb-4">
							<%
							if (request.getParameter("mgss") != null) {
							int message = Integer.parseInt(request.getParameter("mgss"));
							if (message == 3) {
								%>			
						<div class="alert alert-success" role="alert">
 							 Update sucess!!!
						</div>
						<%			
							} else if (message == 1) {
								%>
								<div class="alert alert-success" role="alert">
 								 Delete sucess!!!
								</div>
								<%
							} else if (message == 2){
							%>
							<div class="alert alert-danger" role="alert">
								 Delete fail!!!
							</div>
							<%
							}}
						%>
						<div class="card-header">
							<h5 class=" text-left mb-1 fw-light fs-5">View Content List</h5>
						</div>
						<div class="card-body">
							<table class="table table-striped" id="datatablesSimple">
								<thead>
									<tr>
										<th scope="col">#</th>
										<th scope="col">Tilte</th>
										<th scope="col">Brief</th>
										<th scope="col">Created Date</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
												List<Content> arrContent = (List<Content>) request.getAttribute("listContent");
											if (arrContent != null) {
												for (Content content : arrContent) {
											%>
											<tr>
												<td><%=content.getId()%></td>
												<td><%=content.getTitle()%></td>
												<td><%=content.getBrief()%></td>
												<td><%=content.getCreateDate()%></td>
												<td>

													<button type="button" class="btn btn-primary"
														data-bs-toggle="modal"
														data-bs-target="#exampleModal<%=content.getId()%>">
														Sửa</button> 
													<button type="button" class="btn btn-danger"
														data-bs-toggle="modal"
														data-bs-target="#exampleModalDel<%=content.getId()%>">
														Xóa</button>
														 <!--Dele-->
													<div class="modal fade" id="exampleModalDel<%=content.getId()%>"
														tabindex="-1" aria-labelledby="exampleModalLabel"
														aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="exampleModalLabel">Bạn
																		chắc chắn muốn xóa ?</h5>
																	<button type="button" class="btn-close"
																		data-bs-dismiss="modal" aria-label="Close"></button>
																</div>

																<div class="modal-body">
																	Title :
																	<%=content.getTitle()%>
																	<form action="<%=request.getContextPath()%>/deleteContent"	method="post">
																		<input type="hidden" name="id" value="<%=content.getId()%>">
																		<div class="modal-footer" style="margin-top: 20px">
																			<button style="width: 100px" type="button"
																				class="btn btn-secondary" data-bs-dismiss="modal">
																				Đóng</button>
																			<button style="width: 100px" type="submit"
																				class="btn btn-danger" name="deletenguoidung">
																				Xóa</button>

																		</div>

																	</form>

																</div>

															</div>
														</div>
													</div> <!--Dele-->

												</td>
											</tr>
											 <!-- Modal Add-->
											<div class="modal fade" id="exampleModalAdd" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Thêm
																mới</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<form method="post"
																action="<%=request.getContextPath()%>/add">
																<div class="mb-3">
																	<label for="category-film" class="col-form-label">Họ
																		tên:</label> <input type="text" class="form-control"
																		id="category-film" name="hoTen">
																</div>
																<div class="mb-3">
																	<label for="category-film" class="col-form-label">Giới
																		tính:</label> <input type="text" class="form-control"
																		id="category-film" name="gioiTinh">
																</div>
																<div class="mb-3">
																	<label for="category-film" class="col-form-label">Số
																		điện thoại:</label> <input type="text" class="form-control"
																		id="category-film" name="sdt">
																</div>
																<div class="mb-3">
																	<label for="category-film" class="col-form-label">Ngày
																		sinh:</label> <input type="date" class="form-control"
																		id="category-film" name="ngaySinh">
																</div>
																<div class="mb-3">
																	<label for="category-film" class="col-form-label">Mã:</label>
																	<input type="text" class="form-control"
																		id="category-film" name="ma" required>
																</div>

																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Close</button>
																	<input type="submit" class="btn btn-primary"
																		value="Save">
																	</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
											<!-- Modal Add--> 
											<!-- Modal Update-->
											 <div class="modal fade"
												id="exampleModal<%=content.getId()%>" tabindex="-1"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">Cập
																nhập</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<form method="post"
																action="<%=request.getContextPath()%>/updateContent">
																<div class="mb-3">
																	<input type="hidden" class="form-control"
																		id="category-film" name="idContent"
																		value="<%=content.getId()%>">
																</div>
																<div class="mb-3">
																	<input type="hidden" class="form-control"
																		id="category-film" name="content"
																		value="<%=content.getContent()%>">
																</div>
																<div class="mb-3">
																	<input type="hidden" class="form-control"
																		id="category-film" name="authorId"
																		value="<%=content.getAuthor_id()%>">
																</div>
																<div class="mb-3">
																	<label for="category-film" class="col-form-label">Title:</label> <input type="text" class="form-control"
																		id="category-film" name="title"
																		value="<%=content.getTitle()%>" required>
																</div>
																<div class="mb-3">
																	<label for="category-film" class="col-form-label">Brief:</label> <input type="text" class="form-control"
																		id="category-film" name="brief"
																		value="<%=content.getBrief()%>" required>
																</div>
																<div class="mb-3">
																	<label for="category-film" class="col-form-label">Create date:</label> 
																	<input type="text" class="form-control"
																		id="category-film" name="createDate"
																		value="<%=content.getCreateDate()%>" readonly>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Close</button>
																	<input type="submit" class="btn btn-primary"
																		value="Save">
																	</button>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
											<!-- Modal Update--> 
											<%
												}
											}
											%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
		
		</div>
		
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/resources/js/datatables-simple-demo.js"></script>
	

	<%

	}
	%>

</body>

</html>