package com.shop.board.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.board.service.BoardService;
import com.shop.board.service.BoardServiceImpl;
import com.shop.common.Control;
import com.shop.vo.BoardVO;

public class AddBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		
		BoardVO bvo = new BoardVO();
		bvo.setUserId(userId);
		bvo.setBoardTitle(title);
		bvo.setBoardContent(content);
		
		BoardService svc = new BoardServiceImpl();
		
		if(svc.addBoard(bvo)) {
			resp.sendRedirect("boardSuccess.do");
		} else {
			resp.sendRedirect("boardFailed.do");
		}
	}

}
