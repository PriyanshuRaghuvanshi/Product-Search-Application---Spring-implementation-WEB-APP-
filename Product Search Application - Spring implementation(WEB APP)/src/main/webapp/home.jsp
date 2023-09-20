<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style type="text/css">
.row {
	display: flex;
	justify-content: center;
	align-items: center;
}

.form-control {
	display: block;
	width: 40%;
	height: calc(1.5em + 0.75rem + 2px);
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: 0.25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
</style>
</head>
<body>
	<!-- to prevent access before login and to prevent going back after logout-->
	<%
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "0");
		if (session.getAttribute("username") == null)
			response.sendRedirect("login.jsp");
	%>


	<div id="top-bar"
				style="background-color: #2C74B3; color: #fff; display: flex; justify-content: space-between; align-items: center; padding: 10px;">
				<div>
					<h1 style="font-size: 28px; font-weight: bold; margin: 0;">Search
						Tshirt</h1>
				</div>
				<div style="display: flex; align-items: center; margin-left: auto;">
				<h1 style="font-size: 24px; font-weight: bold; margin-right: 1rem;">Welcome,
						${username}!</h1>
					<form action="Logout" method="post">
						<button type="submit" class="btn btn-outline-danger"
							style="border-radius: 20px; font-size: 16px; padding: 8px 20px;">Logout</button>
					</form>
				</div>
			</div>
		
		
		<div class="row mx-auto" >
			<div class="col-sm-12 col-md-8 offset-md-2 mt-4">
				<form action="Search" method="post">
					<div class="form-group row mb-3">
						<label for="Colour" class="col-sm-2 col-form-label">Colour</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="Colour" name="colour" required>
						</div>
					</div>
					<div class="form-group row mb-3">
						<legend class="col-form-label col-sm-2 pt-0">Size</legend>
						<div class="col-sm-10">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="size" id="S"
									value="S" checked> <label class="form-check-label"
									for="S">S</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="size" id="M"
									value="M"> <label class="form-check-label" for="M">M</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="size" id="L"
									value="L"> <label class="form-check-label" for="L">L</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="size" id="XL"
									value="XL"> <label class="form-check-label" for="XL">XL</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="size"
									id="XXL" value="XXL"> <label class="form-check-label"
									for="XXL">XXL</label>
							</div>
						</div>
					</div>
					<div class="form-group row mb-3">
						<legend class="col-form-label col-sm-2 pt-0">Gender</legend>
						<div class="col-sm-10">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="MaleGender" value="M" checked> <label
									class="form-check-label" for="MaleGender">MALE</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="FemaleGender" value="F"> <label
									class="form-check-label" for="FemaleGender">FEMALE</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									id="UnisexGender" value="U"> <label
									class="form-check-label" for="UnisexGender">UNISEX</label>
							</div>
						</div>
					</div>
					<fieldset class="row mb-3">
						<legend class="col-form-label col-sm-2 pt-0">Output
							Preference</legend>
						<div class="col-sm-10">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="outputPreference" id="1" value="1" checked> <label
									class="form-check-label" for="gridRadios1">Price</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="outputPreference" id="2" value="2"> <label
									class="form-check-label" for="gridRadios2">Rating</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="outputPreference" id="3" value="3"> <label
									class="form-check-label" for="gridRadios2">Price &
									Rating </label>
							</div>
						</div>
					</fieldset>
					<div class="col-12" style=" display: block; margin: 0 auto;">
						<button type="submit"
							class="btn btn-success "
							style=" display: block; margin: 0 auto; font-weight: bold; font-size: 18px;">
							SEARCH</button>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>