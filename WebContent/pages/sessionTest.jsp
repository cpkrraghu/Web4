<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>IMCS Employee Application</title>
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
	<c:if test="${empty sessionScope.user}">
		<c:redirect url="/login.jsp"></c:redirect>
	</c:if>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="/RaghuWeb4/pages/home.jsp">IMCS
				Group</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li>${sessionScope.uName}</li>
			<li><a href="/RaghuWeb4/log?hidden="><span
					class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		</ul>
	</div>

	</nav>
	<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8"></div>
			<div class="col-sm-2 sidenav"></div>
			</div>
	<footer class="container-fluid text-center">
	<p>Copyright Raghunath.</p>
	</footer>

</body>
</html>