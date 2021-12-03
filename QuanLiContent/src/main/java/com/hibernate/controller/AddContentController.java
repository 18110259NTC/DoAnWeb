package com.hibernate.controller;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hibernate.bean.Content;
import com.hibernate.bean.Member;
import com.hibernate.dao.ContentDao;
import com.hibernate.utils.MD5Util;
import com.hibernate.utils.Utf8Util;

/**
 * Servlet implementation class AddContentController
 */
public class AddContentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContentDao contentDao;

    public void init() {
    	contentDao = new ContentDao();
    }
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddContentController() {
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
	    	HttpSession session = request.getSession();   	
	    	Utf8Util.setUtf8AndContentType(request, response);
	    	//lay thong tin usser nhap vao tu giao dien
	    	Member acc = (Member) session.getAttribute("account");
	        String title = request.getParameter("title");
	        String brief = request.getParameter("brief");
	        String content = request.getParameter("content");
	        String createDate = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(date);
	        
	       Content contents = new Content();
	       contents.setTitle(title);
	       contents.setBrief(brief);
	       contents.setContent(content);
	       contents.setCreateDate(createDate);
	       contents.setAuthor_id(acc.getId());
	     //luu vao db
	       contentDao.saveContent(contents);
	       response.sendRedirect(request.getContextPath() + "/add?mgs=1");
	}

}
