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
import com.shop.vo.BoardVO;

public class AdminBoardList implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		AdminService svc = new AdminServiceImpl();
		List<BoardVO> list =svc.adminBoardList();
		List<String> olist = new ArrayList<>();
		olist.add("Q&N제목");
		olist.add("회원아이디");
		olist.add("등록일");
		req.setAttribute("boardTitle", olist);
		req.setAttribute("boardList", list);
		String path = "admin/adminMain.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
