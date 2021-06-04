package com.book.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.book.member.dao.MemberDAO;
import com.book.member.vo.MemberVO;

public class MemberUpdateController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		String phonenum = request.getParameter("phonenum");
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(email);
		System.out.println(gender);
		System.out.println(phonenum);
		MemberVO mvo = new MemberVO();
		mvo.setId(id);
		mvo.setPwd(pwd);
		mvo.setEmail(email);
		mvo.setGender(gender);
		mvo.setPhonenum(phonenum);
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.updateMember(mvo);
		response.sendRedirect("MembersSelectAllController");
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
