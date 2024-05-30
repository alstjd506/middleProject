package com.shop.admin.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;

public class AdminReturnAgree implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rno = req.getParameter("rno");
			
		AdminService svc = new AdminServiceImpl();
		
		if(svc.adminReturnAgree(Integer.parseInt(rno))) {
			resp.getWriter().write("{\"status\":\"success\",\"message\":\"처리완료\"}");
			resp.sendRedirect("adminReturnList.do");
		}else {
			resp.getWriter().write("{\"status\":\"fail\",\"message\":\"처리실패\"}");
			resp.sendRedirect("adminMain.do");
		}

	}

}
