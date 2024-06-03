package com.shop.admin.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.BoardVO;

public class AdminNoticeControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		BoardVO bvo = new BoardVO();
		bvo.setBoardTitle(title);
		bvo.setBoardContent(content);
		System.out.println(title);
		System.out.println(content);
		AdminService svc = new AdminServiceImpl();
		if(svc.adminNotice(bvo)) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		}else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
		
	}

}
