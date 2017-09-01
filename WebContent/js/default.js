$(document).ready(function() {
	$("#add1").click(function() {
		$("#addEmp").show();
		$("#message").hide();
		$("#display").hide();
	});
	$("#firstRow").click(function() {
		
		$("#thirdRow").hide();
		$("#display").hide();
		$("#message").hide();
	});
	
	$("#cancelAdd").click(function() {
		$("#addEmp").hide();
	});
	$("#enableUpd").click(function() {
		
		$('#deptNoUpd').removeAttr('disabled');
		$('#dobUpd').removeAttr('disabled');
		$('#dojUpd').removeAttr('disabled');
		$('#salaryUpd').removeAttr('disabled');
		$('#salGradeUpd').removeAttr('disabled');
		$('#updateBtn').removeAttr('disabled');
	});
	$("#deleteBtn").click(function() {
		$("#action").val("deleteEmp");
		$("#formDelUpd").submit();
	});
	$("#updateBtn").click(function() {
		$("#action").val("updateEmp");
		$("#formDelUpd").submit();
	});
	

	
	
	
});
function updateEmp(id,deptNo){
	$("#empNo").val(id);
	$("#action").val("searchEmpDept");
	$("#deptNo").val(deptNo);
	$("#departmentUD").submit();
}
function deleteEmp(id,deptNo){
	$("#empNoDel").val(id);
	$("#action").val("deleteEmpDept");
	$("#deptNo").val(deptNo);
	$("#departmentUD").submit();
}
