package com.raghu.web4.servlets;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.imcs.raghu.bonus.pojo.Department;
import com.imcs.raghu.bonus.pojo.Employee;
import com.imcs.raghu.bonus.service.EmployeeService;
import com.imcs.raghu.bonus.service.EmployeeServiceImpl;
import com.raghu.web4.util.DepartmentUtil;

@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {
	final static Logger logger=Logger.getLogger(EmployeeServlet.class);
	EmployeeService es=new EmployeeServiceImpl();
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hidden=request.getParameter("hidden").toUpperCase();
		switch(hidden){
		case "ADDEMP":
			addEmployee(request,response);
			break;
		case "UPDATEEMP":
			updateEmployee(request,response);
			break;
		case "SEARCHEMPDEPT":
			getEmployee(request,response,"department");
			break;
		case "SEARCHEMP":
			getEmployee(request,response,"employee");
			break;
		case "SEARCHDEPT":
			getDepartment(request,response);
			break;
		case "GETALLEMPS":
			getAllEmployees(request,response);
			break;
		case "DELETEEMP":
			deleteEmployee(request,response,"employee");
			break;
		case "DELETEEMPDEPT":
			deleteEmployee(request,response,"department");
			break;
		}
	}
	private void getDepartment(HttpServletRequest request, HttpServletResponse response) {
		logger.info("in get department method");
		String deptNo=request.getParameter("deptNoSea");
		Department dep=DepartmentUtil.getDepartment(deptNo);
		if(null!=dep){
			request.setAttribute("dept",dep);
		}
		else{
			request.setAttribute("deptMsg","The department you searched for doesn't exist.");
		}
		RequestDispatcher rd=request.getRequestDispatcher("/pages/department.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	private void getAllEmployees(HttpServletRequest request, HttpServletResponse response) {
		logger.info("in get all employees method");
		int deptNo=Integer.parseInt(request.getParameter("deptNo"));
		List<Employee> empList=new ArrayList<>();
		empList=es.getEmployees(deptNo);
		if(empList.size()>0){
			request.setAttribute("dept",DepartmentUtil.getDepartment(""+deptNo));
			request.setAttribute("empList",empList);
		}else{
			request.setAttribute("dept",DepartmentUtil.getDepartment(""+deptNo));
			request.setAttribute("deptMsg", "No employees in the database for Department "+deptNo+" (or) there was an error fetching.");
		}
		RequestDispatcher rd=request.getRequestDispatcher("/pages/department.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	private void deleteEmployee(HttpServletRequest request, HttpServletResponse response,String type) {
		logger.info("in delete emp method ");
		int empNo=Integer.parseInt(request.getParameter("empNoDel"));
		int deptNo=Integer.parseInt(request.getParameter("deptNo"));
		boolean isDeleted=es.deleteEmployee(empNo);
		RequestDispatcher rd=null;
		System.out.println("deleted" +isDeleted);
		if(type.equals("employee")){
			if(isDeleted)
				request.setAttribute("msg", "Employee "+empNo+" deleted Successfully");
			else
				request.setAttribute("msg", "Problem in deleting Employee "+empNo+" try again later.");
			rd=request.getRequestDispatcher("/pages/employee.jsp");
		}else{
			if(isDeleted)
				request.setAttribute("deptMsg", "Employee "+empNo+" deleted Successfully");
			else
				request.setAttribute("deptMsg", "Problem in deleting Employee "+empNo+" try again later.");
			List<Employee> empList=new ArrayList<>();
			empList=es.getEmployees(deptNo);
			if(empList.size()>0){
				request.setAttribute("dept",DepartmentUtil.getDepartment(""+deptNo));
				request.setAttribute("empList",empList);
			}else{
				request.setAttribute("dept",DepartmentUtil.getDepartment(""+deptNo));
				request.setAttribute("deptMsg", "No employees in the database for Department "+deptNo+" (or) there was an error fetching.");
			}
			rd=request.getRequestDispatcher("/pages/department.jsp");
		}
			
		
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			logger.error(e.getMessage());
		}
	}
	private void getEmployee(HttpServletRequest request, HttpServletResponse response,String type) {
		logger.info("in search emp method");
		int empNo=Integer.parseInt(request.getParameter("empNoSea"));
		Employee emp=es.getEmployee(empNo);
		if(null!=emp){
			request.setAttribute("pageType", type);
			request.setAttribute("searchEmp",emp);
		}else
			request.setAttribute("msg", "Problem in fetching Employee "+empNo+" try again.");
		RequestDispatcher rd=request.getRequestDispatcher("/pages/employee.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	
	private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
		logger.info("in update emp method");
		String pageType=request.getParameter("pageType");
		int empNo=Integer.parseInt(request.getParameter("empNoUpd"));
		int deptNoUpd=Integer.parseInt(request.getParameter("deptNoUpd"));
		int deptNo=Integer.parseInt(request.getParameter("deptNo"));
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-mm-dd");
		Date doj=new Date();
		Date dob=new Date();
		try {
			doj=sd.parse(request.getParameter("dojUpd"));
			dob=sd.parse(request.getParameter("dobUpd"));
		} catch (ParseException e) {
			logger.info(e.getMessage());
		}
		
		float salary=Float.parseFloat(request.getParameter("salaryUpd"));
		int salGrade=Integer.parseInt(request.getParameter("salGradeUpd"));
		Employee emp=new Employee(empNo,deptNoUpd,doj,dob,salary,salGrade);
		RequestDispatcher rd=null;
		boolean isUpdated=es.updateEmployee(emp);
		if(pageType.equals("employee")){
			if(isUpdated){
				request.setAttribute("msg", "Employee "+empNo+" updated Successfully");
				request.setAttribute("empAddUpdated", emp);
			}else
				request.setAttribute("msg", "Problem in updating Employee "+empNo+" try again.");
			rd=request.getRequestDispatcher("/pages/employee.jsp");
		}else{
			if(isUpdated)
				request.setAttribute("deptMsg", "Employee "+empNo+" updated Successfully");
			else
				request.setAttribute("deptMsg", "Problem in updating Employee "+empNo+" try again later.");
			List<Employee> empList=new ArrayList<>();
			empList=es.getEmployees(deptNo);
			if(empList.size()>0){
				request.setAttribute("dept",DepartmentUtil.getDepartment(""+deptNo));
				request.setAttribute("empList",empList);
			}else{
				request.setAttribute("dept",DepartmentUtil.getDepartment(""+deptNo));
				request.setAttribute("deptMsg", "No employees in the database for Department "+deptNo+" (or) there was an error fetching.");
			}
			rd=request.getRequestDispatcher("/pages/department.jsp");
		}
		
		
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
		logger.info("in add emp method");
		int deptNo=Integer.parseInt(request.getParameter("deptNo"));
		SimpleDateFormat sd=new SimpleDateFormat("yyyy-mm-dd");
		Date doj=new Date();
		Date dob=new Date();
		try {
			doj=sd.parse(request.getParameter("doj"));
			dob=sd.parse(request.getParameter("dob"));
		} catch (ParseException e) {
			logger.info(e.getMessage());
		}
		
		float salary=Float.parseFloat(request.getParameter("salary"));
		int salGrade=Integer.parseInt(request.getParameter("salGrade"));
		Employee emp=new Employee(0,deptNo,doj,dob,salary,salGrade);
		int newId=es.addEmployee(emp);
		
		if(newId>0){
			request.setAttribute("msg", "Employee "+newId +" added Successfully");
			emp.setEmpNo(newId);
			request.setAttribute("empAddUpdated", emp);
		}else
			request.setAttribute("msg", "Problem in adding Employee try again.");
		RequestDispatcher rd=request.getRequestDispatcher("/pages/employee.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			
			logger.error(e.getMessage());
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
