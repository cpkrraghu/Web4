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
	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8">
				<br>
				<div class="row">
					<form method="post" action="/RaghuWeb4/employee">
						<input type="hidden" name="hidden" value="searchDept" />
						<div class="col-sm-6">

							<input type="number" id="deptNoSea" name="deptNoSea"
								class="form-control" placeholder="Enter Department Number"
								required />



						</div>
						<div class="col-sm-6">
							<button class="btn btn-info" type="submit">
								<span class="glyphicon glyphicon-search"></span>Search
								Department
							</button>
						</div>
					</form>
				</div>
				<br>

				<c:if test="${not empty requestScope.deptMsg}">
					<div class="row" id="deptMessage">${requestScope.deptMsg}</div>
					<br>
				</c:if>
				<c:if test="${not empty requestScope.dept}">
					<div class="row" id="displayDept">
						<form method="post" action="/RaghuWeb4/employee">
							<input type="hidden" name="hidden" value="getallemps" /> <input
								type="hidden" name="deptNo" value="${requestScope.dept.deptNo}" />
							<table class="table">
								<tr>
									<td>Department ID :</td>
									<td>${requestScope.dept.deptNo}</td>
								</tr>
								<tr>
									<td>Department Name :</td>
									<td>${requestScope.dept.deptName}</td>
								</tr>
								<tr>
									<td><button type="submit" class="btn btn-success">View
											Employees</button></td>
								</tr>
							</table>
						</form>
					</div>
					<br>
				</c:if>
				<c:if test="${not empty requestScope.empList}">
					<form id="departmentUD" method="post" action="/RaghuWeb4/employee">
						<input type="hidden" name="empNoDel" id="empNoDel" /> <input
							type="hidden" name="deptNo" id="deptNo" /> <input type="hidden"
							name="empNoSea" id="empNo" /> <input type="hidden" name="hidden"
							id="action" />

						<table class="table">
							<tr>
								<th>Employee No</th>
								<th>Department No</th>
								<th>Date of Birth</th>
								<th>Date of Joining</th>
								<th>Salary</th>
								<th></th>
								<th></th>
							</tr>
							<c:forEach items="${requestScope.empList}" var="emp">
								<tr>

									<td>${emp.empNo}</td>
									<td>${emp.deptNo}</td>
									<td>${emp.dob}</td>
									<td>${emp.doj}</td>
									<td>${emp.salary}</td>
									<td><button class="btn btn-success"
											onclick="updateEmp(${emp.empNo},${emp.deptNo})">Update</button></td>
									<td><button class="btn btn-success"
											onclick="deleteEmp(${emp.empNo},${emp.deptNo})">Delete</button></td>
								</tr>
							</c:forEach>


						</table>
					</form>

				</c:if>
			</div>
			<div class="col-sm-2 sidenav"></div>
		</div>
	</div>
	<footer class="container-fluid text-center">
	<p>Copyright Raghunath.</p>
	</footer>
</body>
<script src="/RaghuWeb4/js/default.js"></script>
</html>