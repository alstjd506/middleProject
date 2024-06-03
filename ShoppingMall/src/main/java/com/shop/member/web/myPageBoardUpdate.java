package com.shop.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;
import com.shop.vo.BoardVO;

public class myPageBoardUpdate implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String boardNo = req.getParameter("boardNo");
		String boardTitle = req.getParameter("boardTitle");
		String boardContent = req.getParameter("boardContent");
		
		System.out.println(boardNo);
		System.out.println(boardTitle);
		System.out.println(boardContent);
		
		BoardVO vo = new BoardVO();
		vo.setBoardNo(Integer.parseInt(boardNo));
		vo.setBoardTitle(boardTitle);
		vo.setBoardContent(boardContent);
		
		MemberService svc = new MemberServiceImpl();
	
		
		if (svc.updateBoard(vo)) {
			System.out.println("성공");
			resp.getWriter().print("{\"retCode\": \"OK\"}");
			resp.sendRedirect("myPageBoard.do");
		} else {
			System.out.println("실패");
			resp.getWriter().print("{\"retCode\": \"NG\"}");
			resp.sendRedirect("myPageBoard.do");
		}
		
		
	}

}
