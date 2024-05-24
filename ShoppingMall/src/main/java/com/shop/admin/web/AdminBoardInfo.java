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
		String path = "admin/adminBoardInfo.tiles";
		String bno = req.getParameter("bno");

		AdminService svc = new AdminServiceImpl();

		BoardVO bvo = svc.adminBoardInfo(Integer.parseInt(bno));
		System.out.println(bvo);
		if (bvo == null) {
			BoardVO bvon = svc.adminBoardInfon(Integer.parseInt(bno));
			req.setAttribute("board", bvon);
		} else {
			req.setAttribute("board", bvo);
		}
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
