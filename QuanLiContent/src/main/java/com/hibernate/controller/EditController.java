package com.hibernate.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hibernate.bean.Member;
import com.hibernate.dao.UserDao;

/**
 * Servlet implementation class editController
 */
public class EditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private UserDao userDao;

	    public void init() {
	        userDao = new UserDao();
	    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher fd = request.getRequestDispatcher("/editProfile.jsp");
		fd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 Date date = new Date(); 
		 // lay thong tin user nhap vao tu giao dien
		int id =  Integer.parseInt(request.getParameter("id"));
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String description = request.getParameter("description");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String createDate = request.getParameter("datecreate");
        Date updateTime = date;
        Member user = new Member();
        user.setId(id);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setDescription(description);
        user.setPassword(password);
        user.setCreateDate(createDate);
        user.setUserName(username);
        user.setUpdateTime(updateTime);
        //cap nhat  vao db
        boolean check = userDao.updateUser(user);
        if(check) {
        	int mgs = 1;
        	response.sendRedirect(request.getContextPath()+"/content?mgs="+mgs);
        } 
        
	}
}