package com.hibernate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hibernate.bean.Content;
import com.hibernate.dao.ContentDao;
import com.hibernate.dao.UserDao;

/**
 * Servlet implementation class viewContent
 */
public class ViewCotentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContentDao contentDao;

	public void init() {
		contentDao = new ContentDao();
	}
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewCotentController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ArrayList<Content> list = contentDao.getAll();
		request.setAttribute("listContent", list);
		RequestDispatcher fd = request.getRequestDispatcher("/viewContent.jsp");
		fd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}