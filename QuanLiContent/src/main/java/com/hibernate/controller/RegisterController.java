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
import com.hibernate.utils.MD5Util;
import com.hibernate.utils.Utf8Util;



/**
 * @email Ramesh Fadatare
 */

public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	Utf8Util.setUtf8AndContentType(request, response);
        register(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	RequestDispatcher fd = request.getRequestDispatcher("/register.jsp");
		fd.forward(request, response);
    }

    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		 Date date = new Date();  
    	MD5Util md = new MD5Util();
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String endCodePass = md.getMD5(password);
        String createDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(date);
        Member user = new Member();
        user.setUserName(username);
        user.setEmail(email);
        user.setPassword(endCodePass);
        user.setCreateDate(createDate);
        if(userDao.checkEmailExist(email)) {
        	int mgs = 0;
        	response.sendRedirect(request.getContextPath()+"/register?mgs="+mgs);
        } else {
        	int mgs = 1;
        	 userDao.saveUser(user);
        	 response.sendRedirect(request.getContextPath()+"/login?mgs="+mgs);
        }
       
    }
}

