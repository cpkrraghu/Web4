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
			<a class="navbar-brand" href="/RaghuWeb4/pages/home.jsp">IMCS Group</a>
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
				<div class="row" id="firstRow">
					<div class="col-sm-6">
						<form method="post" action="/RaghuWeb4/employee">
							<input type="hidden" name="hidden" value="searchEmp" />
							<div class="col-xs-8">
								<input type="number" id="empNoSea" name="empNoSea"
									class="form-control" placeholder="Enter Employee number" required />
							</div>
							<button class="btn btn-info" type="submit">
								<span class="glyphicon glyphicon-search"></span>Search Employee
							</button>
						</form>
					</div>
					<div class="col-sm-6">
						<button class="btn btn-info" id="add1">Add Employee</button>
					</div>
				</div>
				<br>
				<c:if test="${not empty requestScope.msg}">
					<div class="row" id="message">${requestScope.msg}</div>
					<br>
				</c:if>
				<c:if test="${not empty requestScope.searchEmp}">
					<div class="row" id="thirdRow">
						<form method="post" id="formDelUpd" action="/RaghuWeb4/employee">
							<input type="hidden" name="hidden" id="action" /> <input
								type="hidden" name="empNoDel"
								value="${requestScope.searchEmp.empNo}" /> <input type="hidden"
								name="pageType" value="${requestScope.pageType}" />
							<table class="table">
								<c:choose>
									<c:when test="${requestScope.pageType eq 'department'}">
										<input type="hidden" name="deptNo"
											value="${requestScope.searchEmp.deptNo}" />
										<tr>
											<td>Employee ID :</td>
											<td><input class="form-control" type="number"
												value="${requestScope.searchEmp.empNo}" id="empNoUpd"
												 disabled="disabled" />
												<input type="hidden" name="empNoUpd" value="${requestScope.searchEmp.empNo}" />
												</td>
										</tr>
										<tr>
											<td>Department No :</td>
											<td>
											
											<select name="deptNoUpd" id="deptNoUpd"
												class="form-control" required>
													<c:choose>
														<c:when test="${1 eq requestScope.searchEmp.deptNo}">
															<option value="1" selected="selected">Sales</option>
														</c:when>
														<c:otherwise>
															<option value="1">Sales</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${2 eq requestScope.searchEmp.deptNo}">
															<option value="2" selected="selected">Marketing</option>
														</c:when>
														<c:otherwise>
															<option value="2">Marketing</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${3 eq requestScope.searchEmp.deptNo}">
															<option value="3" selected="selected">HR</option>
														</c:when>
														<c:otherwise>
															<option value="3">HR</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${4 eq requestScope.searchEmp.deptNo}">
															<option value="4" selected="selected">IT</option>
														</c:when>
														<c:otherwise>
															<option value="4">IT</option>
														</c:otherwise>
													</c:choose>

											</select>
											</td>
										</tr>
										<tr>
											<td>Date of Birth :</td>
											<td><input class="form-control" type="date"
												value="${requestScope.searchEmp.dob}" id="dobUpd"
												name="dobUpd" required /></td>
										</tr>
										<tr>
											<td>Date of Joining :</td>
											<td><input class="form-control" type="date"
												value="${requestScope.searchEmp.doj}" id="dojUpd"
												name="dojUpd" required /></td>
										</tr>
										<tr>
											<td>Salary :</td>
											<td><input class="form-control" type="number"
												value="${requestScope.searchEmp.salary}" id="salaryUpd"
												name="salaryUpd" required /></td>
										</tr>
										<tr>
											<td>Salary Grade :</td>
											<td><input class="form-control" type="number"
												value="${requestScope.searchEmp.salGrade}" id="salGradeUpd"
												name="salGradeUpd" required /></td>
										</tr>
										<tr>
											<td></td>
											<td>
												<button class="btn btn-success" id="updateBtn">Save</button>
											</td>
										</tr>
									</c:when>
									<c:otherwise>
									<input type="hidden" name="deptNo"
											value="${requestScope.searchEmp.deptNo}" />
										<tr>
											<td>Employee ID :</td>
											<td><input class="form-control" type="number"
												value="${requestScope.searchEmp.empNo}" id="empNoUpd"
												name="empNoUpd" disabled="disabled" required />
												<input type="hidden" name="empNoUpd" value="${requestScope.searchEmp.empNo}" /></td>
										</tr>
										<tr>
											<td>Department No :</td>
											<td><select name="deptNoUpd" id="deptNoUpd"
												class="form-control" disabled="disabled" required>
													<c:choose>
														<c:when test="${1 eq requestScope.searchEmp.deptNo}">
															<option value="1" selected="selected">Sales</option>
														</c:when>
														<c:otherwise>
															<option value="1">Sales</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${2 eq requestScope.searchEmp.deptNo}">
															<option value="2" selected="selected">Marketing</option>
														</c:when>
														<c:otherwise>
															<option value="2">Marketing</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${3 eq requestScope.searchEmp.deptNo}">
															<option value="3" selected="selected">HR</option>
														</c:when>
														<c:otherwise>
															<option value="3">HR</option>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${4 eq requestScope.searchEmp.deptNo}">
															<option value="4" selected="selected">IT</option>
														</c:when>
														<c:otherwise>
															<option value="4">IT</option>
														</c:otherwise>
													</c:choose>

											</select></td>
										</tr>
										<tr>
											<td>Date of Birth :</td>
											<td><input class="form-control" type="date"
												value="${requestScope.searchEmp.dob}" id="dobUpd"
												name="dobUpd" disabled="disabled" required /></td>
										</tr>
										<tr>
											<td>Date of Joining :</td>
											<td><input class="form-control" type="date"
												value="${requestScope.searchEmp.doj}" id="dojUpd"
												name="dojUpd" disabled="disabled" required /></td>
										</tr>
										<tr>
											<td>Salary :</td>
											<td><input class="form-control" type="number"
												value="${requestScope.searchEmp.salary}" id="salaryUpd"
												name="salaryUpd" disabled="disabled" required /></td>
										</tr>
										<tr>
											<td>Salary Grade :</td>
											<td><input class="form-control" type="number"
												value="${requestScope.searchEmp.salGrade}" id="salGradeUpd"
												name="salGradeUpd" disabled="disabled" required /></td>
										</tr>
										<tr>
											<td><input type="radio" id="enableUpd">Edit
												</button></td>
											<td>

												<button class="btn btn-success" id="updateBtn"
													disabled="disabled">Save</button>
												<button class="btn btn-success" id="deleteBtn">Delete</button>
												<a class="btn btn-success" href='/RaghuWeb4/pages/home.jsp'>Cancel</a>
											</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</form>
					</div>
					<br>
				</c:if>
				<c:if test="${not empty requestScope.empAddUpdated}">
					<div class="row" id="display">
						<table class="table">
							<tr>
								<td>Employee ID :</td>
								<td>${requestScope.empAddUpdated.empNo}</td>
							</tr>
							<tr>
								<td>Department No :</td>
								<td>${requestScope.empAddUpdated.deptNo}</td>
							</tr>
							<tr>
								<td>Date of Birth :</td>
								<td>${requestScope.empAddUpdated.dob}</td>
							</tr>
							<tr>
								<td>Date of Joining :</td>
								<td>${requestScope.empAddUpdated.doj}</td>
							</tr>
							<tr>
								<td>Salary :</td>
								<td>$${requestScope.empAddUpdated.salary}</td>
							</tr>
							<tr>
								<td>Salary Grade :</td>
								<td>${requestScope.empAddUpdated.salGrade}</td>
							</tr>
							<tr>
								<td></td>
							</tr>
						</table>
					</div>
					<br>
				</c:if>
				<div class="row">
					<div id="addEmp" class="panel panel-info padding-top-20"
						style="display: none">
						<div class="panel-heading">Add Employee</div>
						<div class="panel-body">
							<form method="post" id="addEmpForm" action="/RaghuWeb4/employee">
								<input type="hidden" name="hidden" value="addEmp" />
								<div class="row" style="padding-top: 10px">
									<label for="deptNo" class="col-md-4 control-label">Department
										Number : </label>
									<div class="col-md-8">
										<select name="deptNo" id="deptNo" class="form-control">
											<option value="4" selected="selected">Select a
												department</option>
											<option value="1">Sales</option>
											<option value="2">Marketing</option>
											<option value="3">HR</option>
											<option value="4">IT</option>
										</select>
									</div>
								</div>
								<div class="row" style="padding-top: 10px">
									<label for="dob" class="col-md-4 control-label">Date of
										Birth : </label>
									<div class="col-md-8">
										<input type="date" id="dob" name="dob" class="form-control"
											placeholder="Date of Birth" required />
									</div>
								</div>
								<div class="row" style="padding-top: 10px">
									<label for="doj" class="col-md-4 control-label">Date of
										Joining : </label>
									<div class="col-md-8">
										<input type="date" id="doj" name="doj" class="form-control"
											placeholder="Date of Joining" required />
									</div>
								</div>
								<div class="row" style="padding-top: 10px">
									<label for="salary" class="col-md-4 control-label">Salary
										: </label>
									<div class="col-md-8 ">
										<input type="number" id="salary" name="salary"
											class="form-control" placeholder="Enter Salary" required />
									</div>
								</div>
								<div class="row" style="padding-top: 10px">
									<label for="salGrade" class="col-md-4 control-label">Salary
										Grade : </label>
									<div class="col-md-8">
										<select name="salGrade" id="salGrade" class="form-control">
											<option value="1">$10k-$20k</option>
											<option value="2">$20k-$40k</option>
											<option value="3">$40k-$70k</option>
											<option value="4">$70k-$100k</option>
										</select>
									</div>
								</div>

								<div class="row" style="padding-top: 10px">
									<div class="col-md-offset-4 col-md-8">
										<div class="col-md-4">
											<button class="btn btn-success" type="submit" id="addEmpBtn">Add
												Employee</button>
										</div>
										<div class="col-md-4">
											<button class="btn btn-danger" id="cancelAdd">Cancel</button>
										</div>
										<div class="col-md-4">
											<button class="btn btn-warning" type="reset">Reset</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>

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