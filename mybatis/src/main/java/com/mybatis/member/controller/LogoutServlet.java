package com.mybatis.member.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
		}
		 response.setContentType("text/html; charset=UTF-8");
	     response.getWriter().println("<script>");
	     response.getWriter().println("alert('로그아웃 되었습니다.');");
	     response.getWriter().println("location.href='" + request.getContextPath() + "/index.jsp';");
	     response.getWriter().println("</script>");

			/*
			 * request.getSession().invalidate();
			 * response.sendRedirect(request.getContextPath());
			 */
	}

}
