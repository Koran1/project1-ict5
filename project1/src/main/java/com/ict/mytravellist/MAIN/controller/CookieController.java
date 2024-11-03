package com.ict.cookie.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.ict.cookie.model.Command;
import com.ict.cookie.model.CookieJoinCommand;
import com.ict.cookie.model.CookieLogInCommand;
import com.ict.cookie.model.CookieLogOutCommand;
import com.ict.cookie.model.CookieProFileCommand;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CookieController")
public class CookieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String cmd = request.getParameter("cmd");
		Command comm = null;
		switch (cmd) {
			case "c_login":	comm = new CookieLogInCommand();  break;
			case "c_join":	comm = new CookieJoinCommand();  break;
			case "c_profile":	comm = new CookieProFileCommand();  break;
			case "c_logout":	comm = new CookieLogOutCommand();  break;
		}
		String path = comm.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
		
	}
}
