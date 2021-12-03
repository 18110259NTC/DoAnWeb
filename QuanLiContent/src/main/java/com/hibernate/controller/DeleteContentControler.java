package com.hibernate.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hibernate.dao.ContentDao;
import com.hibernate.utils.MD5Util;

/**
 * Servlet implementation class DeleteContentControler
 */
public class DeleteContentControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContentDao contentDao;

    public void init() {
    	contentDao = new ContentDao();
    }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteContentControler() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date date = new Date();  
    	MD5Util md = new MD5Util();
    	//lay id content
    	int id = Integer.parseInt(request.getParameter("idDel"));
    	//kiem tra xem xoa thanh cong hay that bai
    	if (contentDao.delete(id)) {
    		 response.sendRedirect(request.getContextPath() + "/content?mgss=1");
    	} else {
    		 response.sendRedirect(request.getContextPath() + "/content?mgss=2");
    	}
	}

}
