<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Register</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="style.css">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-left mb-5 fw-light fs-5">Register</h5>
						<form method="post"
							action="<%=request.getContextPath()%>/register"  oninput='confirmpassword.setCustomValidity(confirmpassword.value != password.value ? "Passwords do not match." : "")'>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput"
									placeholder="Username" name="username" minlength="3" maxlength="30" required>
							</div>
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="Email" name="email" minlength="5"  required>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" id="password"
									placeholder="Password" name="password" minlength="8" maxlength="30" required>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control"
									id="confirmpassword" placeholder="Re-Password"
									name="confirmpassword" minlength="8" maxlength="30">
									
							</div>
							<div class="d-grid text-center">
								<button
									class="btn btn-success btn-login text-uppercase fw-bold w-100"
									type="submit">Register</button>
							</div>
							<hr class="my-4">
							<a href="<%=request.getContextPath()%>/login">Click here to Login</a>

						</form>
					</div>
					<%
						if (request.getParameter("mgs") != null) {
						int message = Integer.parseInt(request.getParameter("mgs"));
						if (message == 0) {
					%>

					<div class="alert alert-danger" role="alert">Email đã tồn
						tại!</div>
					<%
						}
					}
					%>
				</div>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</body>

</html>