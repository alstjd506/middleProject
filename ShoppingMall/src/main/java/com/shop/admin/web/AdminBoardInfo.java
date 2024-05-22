package com.shop.admin.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.BoardVO;

public class AdminBoardInfo implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String bno = req.getParameter("bno");
		
		AdminService svc = new AdminServiceImpl();
		
		BoardVO bvo = svc.adminBoardInfo(Integer.parseInt(bno));
		
		req.setAttribute("board", bvo);
		
		String path = "admin/boardInfo.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
