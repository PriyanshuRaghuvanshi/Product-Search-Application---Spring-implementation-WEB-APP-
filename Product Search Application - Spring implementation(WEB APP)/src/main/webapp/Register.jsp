<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">

<title>Register User</title>
<script>
function validateForm() {
  var uname = document.forms["registerForm"]["uname"].value;
  var pass = document.forms["registerForm"]["pass"].value;

  // Validate the username
  if (uname.length < 4) {
    document.getElementById("unameError").innerHTML = "Username should be at least 8 characters long";
    return false;
  } else {
    document.getElementById("unameError").innerHTML = "";
  }

  // Validate the password
  var hasNumber = /\d/.test(pass);
  var hasSpecial = /[~!@#$%^&*()_+`\-={}[\]\\|:;"'<>,.?/]/.test(pass);
  var hasCapital = /[A-Z]/.test(pass);

  if (!hasNumber || !hasSpecial || !hasCapital) {
    document.getElementById("passError").innerHTML = "Password should have at least one numeric value, one special character, and one capital letter";
    return false;
  } else {
    document.getElementById("passError").innerHTML = "";
  }
}
</script>
</head>
<body>
<!-- to prevent access before login and to prevent going back after logout-->
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
%>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-md-6">
			<div class="card mt-5">
				<div class="card-header bg-success text-white">
					<h3 class="text-center">Register User</h3>
				</div>
				<div class="card-body">
					<form name="registerForm" action="Register" method="post" onsubmit="return validateForm()">
						<div class="form-group">
							<label for="uname" class="fw-bold">Username:</label>
							<input type="text" name="uname" id="uname" class="form-control" required>
              <div id="unameError" style="color:red"></div>
						</div>
						<div class="form-group">
							<label for="pass" class="fw-bold">Password:</label>
							<input type="password" name="pass" id="pass" class="form-control" required>
              <div id="passError" style="color:red"></div>
						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-success">Register</button>
						</div>
						<p class="text-center">Already a user? <a href="login.jsp">Login here</a></p>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
