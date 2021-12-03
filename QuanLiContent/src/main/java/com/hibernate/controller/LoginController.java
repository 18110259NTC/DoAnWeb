package com.hibernate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hibernate.bean.Content;
import com.hibernate.bean.Member;
import com.hibernate.dao.ContentDao;
import com.hibernate.dao.UserDao;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	private ContentDao contentDao;


	public void init() {
		userDao = new UserDao();
		contentDao = new ContentDao();
	}

		
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher fd = request.getRequestDispatcher("/login.jsp");
		fd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			authenticate(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		//
		if (userDao.validate(email, password) != null) {
			HttpSession session = request.getSession();
			Member user = userDao.validate(email, password);
			session.setAttribute("account", user);
			if(null ==user.getFirstName()) {
				RequestDispatcher fd = request.getRequestDispatcher("/editProfile.jsp");
				fd.forward(request, response);
				return;
			} else {

				    // tao Cookie lay thong tin cua nguoi dung de nho lai
				      Cookie coEmail = new Cookie("coEmail", email);
				      Cookie coPass = new Cookie("coPass", password);
				      //kiem tra xem user co cheked remember
				      if (request.getParameter("remember") != null) {
				    	  coEmail.setMaxAge(60 * 60 * 24);
				    	  coPass.setMaxAge(60 * 60 * 24);
				      } else {
				    	  coEmail.setMaxAge(0);
				    	  coPass.setMaxAge(0);
				      }
				      //luu thong tin  vao cookie
				      response.addCookie(coEmail);
				      response.addCookie(coPass);
				      //lay tat ca content co trong db de hien thi tren giao dien
				      ArrayList<Content> list = contentDao.getAll();				
						request.setAttribute("listContent", list);
				      RequestDispatcher dis = request.getRequestDispatcher("/viewContent.jsp");
				      dis.forward(request, response);
				}
			
		} else {
			int mgs = 2;
			response.sendRedirect(request.getContextPath() + "/login?mgs=" + mgs);
		}
	}
}
