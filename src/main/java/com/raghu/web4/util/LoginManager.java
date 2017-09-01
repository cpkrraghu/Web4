package com.raghu.web4.util;

import java.util.HashMap;
import java.util.Map;

import com.imcs.raghu.bonus.pojo.User;

public class LoginManager {
	private static Map<String,User> users;
	static{
		users=new HashMap<String, User>();
		users.put("name1", new User("name1","password1"));
		users.put("name2", new User("name2","password2"));
		users.put("name3", new User("name3","password3"));
		users.put("name4", new User("name4","password4"));
		users.put("name5", new User("name5","password5"));
	}
	public static User getUser(String userName){
		return users.get(userName);
	}
}
