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

public class MemberSelectOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberDAO dao = MemberDAO.getInstance();
		MemberVO mvo = new MemberVO();
		mvo = dao.selectMember(id);
		JSONObject obj = new JSONObject();
		obj.put("id", mvo.getId());
		obj.put("pwd", mvo.getPwd());
		obj.put("email", mvo.getEmail());
		obj.put("gender", mvo.getGender());
		obj.put("phonenum", mvo.getPhonenum());
		obj.put("joindate", mvo.getJoindate());
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(obj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
