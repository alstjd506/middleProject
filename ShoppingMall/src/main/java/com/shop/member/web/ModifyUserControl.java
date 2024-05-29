package com.shop.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;
import com.shop.vo.MemberVO;

public class ModifyUserControl implements Control{

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String post = req.getParameter("post");
		String addr = req.getParameter("addr");
		String detailaddr = req.getParameter("detailaddr");
		
		MemberService svc = new MemberServiceImpl();
		
		MemberVO mvo = new MemberVO();
		
		mvo.setUserId(id);
		mvo.setUserPw(pw);
		mvo.setUserName(name);
		mvo.setUserPhone(phone);
		mvo.setUserPost(Integer.parseInt(post));
		mvo.setUserAddr(addr);
		mvo.setUserDetailAddr(detailaddr);
		System.out.println(mvo);
		
		if(svc.ModifyUser(mvo)) {
			req.setAttribute("message", "회원정보가 수정되었습니다.");
			resp.sendRedirect("main.do");
		}
//		else {
//            req.setAttribute("error", "회원정보가 수정되지 않습니다.");
//            req.getRequestDispatcher("Deleteuser.do").forward(req, resp);
//		}
	}

}


