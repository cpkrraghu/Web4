<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IMCS Employee Application</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 600px;
	background-color: #f1f1f1;
}

.sidenav {
	padding-top: 20px;
	background-color: #696969;
	height: 100%;
}

footer {
	background-color: #555;
	color: white;
	padding: 15px;
}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">IMCS Group</a>
		</div>
	</div>
	</nav>
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-center">
				<div class="jumbotron" style="width: 50%; margin: 10% auto;">
					<h3>Please Login</h3>
					<span class="help-inline">${requestScope.loginMsg}</span>
					<form action="log" method="post">
						<input type="hidden" name="hidden" value="login" />
						<div class="form-group">
							<input type="text" name="userId" class="form-control"
								placeholder="Enter User ID" required />
						</div>
						<div class="form-group">
							<input type="password" name="pwd" class="form-control"
								placeholder="Enter Password" required />
						</div>
						<button type="submit" class="btn btn-primary form-control">Login</button>
					</form>
				</div>
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>
	<footer class="container-fluid text-center">
	<p>Copyright Raghunath.</p>
	</footer>
</body>
</html>