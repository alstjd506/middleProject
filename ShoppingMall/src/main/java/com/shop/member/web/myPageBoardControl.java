package com.shop.member.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;
import com.shop.vo.BoardVO;

public class myPageBoardControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path ="member/myPageBoardList.tiles";
		
		HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId");
        
        MemberService svc = new MemberServiceImpl();
        
        List<BoardVO> boardList = svc.boardList(userId);
        req.setAttribute("boardList", boardList);
        req.getRequestDispatcher(path).forward(req, resp);
        
	}

}
