package com.shop.admin.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.MemberVO;

public class AdminMemberList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminService svc = new AdminServiceImpl();
		
		List<MemberVO> list = svc.adminMemberList();
		
		List<String> olist = new ArrayList<>();
		olist.add("회원아이디");
		olist.add("회원비밀번호");
		olist.add("회원명");
		olist.add("연락처");
		olist.add("주소");
		olist.add("상세주소");
		olist.forEach(adas -> System.out.println(adas));
		req.setAttribute("memberTitle", olist);
		req.setAttribute("memberList", list);
		String path = "admin/adminMain.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
