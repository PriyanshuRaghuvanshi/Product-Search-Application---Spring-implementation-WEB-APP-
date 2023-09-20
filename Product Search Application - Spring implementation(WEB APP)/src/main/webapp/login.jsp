<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<!-- Bootstrap CSS -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- Font Awesome CSS -->
<link
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<style>
/* Custom CSS */
body {
	background-color: #f1f1f1;
}

.login-box {
	background-color: #fff;
	border-radius: 20px;
	box-shadow: 0px 0px 10px #ccc;
	padding: 40px;
}

.btn-custom {
	background-color: #4CAF50;
	border-color: #4CAF50;
	color: #fff;
	border-radius: 20px;
	padding: 10px 30px;
	font-size: 18px;
	font-weight: bold;
}

.btn-custom:hover {
	background-color: #fff;
	color: #4CAF50;
	border: 2px solid #4CAF50;
}

.form-control:focus {
	box-shadow: none;
}

.error {
	color: red;
	font-weight: bold;
	margin-top: 5px;
}
.error-msg {
  color: red;
  font-size: 14px;
  margin-top: 5px;
}

</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row justify-content-center align-items-center">
			<div class="col-md-4">
				<div class="login-box">
					<h3 class="text-center mb-4">Login</h3>
					<form action="login" method="post" onsubmit="return validateForm()">
						<div class="form-group">
							<label for="uname">Username:</label> <input type="text"
								name="uname" id="uname" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="pass">Password:</label> <input type="password"
								name="pass" id="pass" class="form-control" required>
								  <span class="error-msg" id="pass-error"></span>
							<div id="pass-error" class="error"></div>
						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-custom">Login</button>
						</div>
						<p class="text-center mb-0">
							New user? <a href="Register.jsp">Register Here</a>
						</p>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validateForm() {
			var uname = document.getElementById("uname").value;
			var pass = document.getElementById("pass").value;

			if (uname.length < 4) {
				document.getElementById("pass-error").innerHTML = "Username is Wrong";
				return false;
			}

			var regex = /^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,}$/;
			if (!regex.test(pass)) {
				document.getElementById("pass-error").innerHTML = "Password is Wrong";
				return false;
			} else {
				document.getElementById("pass-error").innerHTML = "";
			}

			return true;
		}
	</script>
</body>
</html>
