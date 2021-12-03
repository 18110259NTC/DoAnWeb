package com.hibernate.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hibernate.bean.Content;
import com.hibernate.dao.ContentDao;
import com.hibernate.utils.MD5Util;

/**
 * Servlet implementation class searchController
 */
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ContentDao contentDao;

	public void init() {
		contentDao = new ContentDao();
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MD5Util md = new MD5Util();
		//lay string ma user muon search
		String str = request.getParameter("search");
		//ket qua db tra ve
		List<Content> list = (List<Content>) contentDao.search(str);
		request.setAttribute("word", str);
		request.setAttribute("listContent", list);
		RequestDispatcher fd = request.getRequestDispatcher("/searchView.jsp");
		fd.forward(request, response);
	}

}

