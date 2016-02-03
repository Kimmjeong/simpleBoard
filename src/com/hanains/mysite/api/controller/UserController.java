package com.hanains.mysite.api.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.hanains.mysite.dao.UserDao;

@WebServlet("/api/user/checkemail")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserController() {
        super();
    }

	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDao dao=new UserDao();
		String email=request.getParameter("email");
		
		System.out.println(email);
		
		boolean isEmail=dao.getUser(email);
		
		System.out.println(isEmail);
			
			JSONObject jsonObject=new JSONObject();
			
			jsonObject.put("result", "success");
			jsonObject.put("message", null);
			jsonObject.put("data", !isEmail);
			
			response.setContentType("application/x-json; charset=UTF-8");
			
			 PrintWriter out = response.getWriter();
			  out.print(jsonObject);
			  out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
