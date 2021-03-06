package com.book.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book.dao.BookDAO;
import com.book.vo.BookVO;

//@WebServlet("/BookController")
public class BookController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("I am BookController class.");
		BookDAO dao = BookDAO.getInstance();
		ArrayList<BookVO> list = dao.selectAll(); 
		
		request.setAttribute("blist", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("index.do");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		 doGet(request, response);
	}
}
