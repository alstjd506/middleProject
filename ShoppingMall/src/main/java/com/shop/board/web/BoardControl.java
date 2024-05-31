package com.shop.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.Control;

public class BoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = "/board/board.tiles";
		
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		
		req.setAttribute("userId", userId);
				
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
