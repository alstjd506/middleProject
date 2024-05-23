package com.shop.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;
import com.shop.vo.MemberVO;

public class LoginControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");

		MemberService svc = new MemberServiceImpl();
		MemberVO mvo = svc.login(id, pw);

		if (mvo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("logId", mvo.getUserId());

			// 관리자, 회원.
			if (mvo.getUserResp().equals("Admin"))
				resp.sendRedirect("admin.do");
			else
				resp.sendRedirect("main.do");

		} else {
			//alert 창도 띄우면서 로그인화면으로 다시가게 하는법을...
			resp.sendRedirect("login.do"); //
		}
	}

}
