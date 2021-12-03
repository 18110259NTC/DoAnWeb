<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<!-- Required meta tags -->
<meta charset="UTF-8">
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
  <%
     Cookie[] listCookie = request.getCookies();
     String user = "";
     String pass = "";
     int co = 0;
     if(listCookie != null){
        while(co < listCookie.length){
          if(listCookie[co].getName().equals("coEmail")){
            user = listCookie[co].getValue();
           }
          if(listCookie[co].getName().equals("coPass")){
            pass = listCookie[co].getValue();
           }
          co++;
        }
  
      }
   %>

	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card border-0 shadow rounded-3 my-5">
					<div class="card-body p-4 p-sm-5">
						<h5 class="card-title text-left mb-5 fw-light fs-5">Please
							Sign In</h5>
						<form method="post" action="<%=request.getContextPath()%>/login">
							<div class="form-floating mb-3">
								<input type="email" class="form-control" id="floatingInput"
									placeholder="Email" name="email" minlength="5" maxlength="50" value="<%out.print(user);%>" required>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control"
									id="floatingPassword" placeholder="Password" name="password" minlength="8" maxlength="50" value="<%out.print(pass);%>" required>
							</div>

							<div class="form-check mb-3">
								<input class="form-check-input" type="checkbox" 
									id="rememberPasswordCheck" name="remember" <%= listCookie != null ? "checked=\"checked\"" :" " %> > <label
									class="form-check-label" for="rememberPasswordCheck">
									Remember password </label>
							</div>
							<div class="d-grid text-center">
								<button
									class="btn btn-success btn-login text-uppercase fw-bold w-100"
									type="submit">Sign in</button>
							</div>
							<hr class="my-4">
							<a href="<%=request.getContextPath()%>/register">Click here to Register</a>

						</form>
					</div>
					<%
						if (request.getParameter("mgs") != null) {
						int message = Integer.parseInt(request.getParameter("mgs"));
						if (message == 1) {
					%>

					<div class="alert alert-success" role="alert">Đăng ký thành
						công!</div>
					<%
						} else if (message == 2) {
					%>
					<div class="alert alert-danger" role="alert">Email hoặc mật khẩu không đúng!</div>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>

</html>