package com.raghu.web4.util;

import java.util.HashMap;
import java.util.Map;

import com.imcs.raghu.bonus.pojo.Department;

public class DepartmentUtil {
	private static Map<String,Department> deps;
	static{
		deps=new HashMap<String, Department>();
		deps.put("1", new Department(1,"Sales"));
		deps.put("2", new Department(2,"Marketing"));
		deps.put("3", new Department(3,"HR"));
		deps.put("4", new Department(4,"IT"));
		
	}
	public static Department getDepartment(String deptNo){
		return deps.get(deptNo);
	}
}
