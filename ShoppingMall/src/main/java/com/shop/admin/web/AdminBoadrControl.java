package com.shop.admin.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.ReplyVO;

public class AdminBoadrControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String bno = req.getParameter("bodno");
		String reply = req.getParameter("bodre");
		
		System.out.println("게시글번호 : "+bno);
		System.out.println("답글 : "+reply);
		ReplyVO rvo = new ReplyVO();
		
		rvo.setBoardNo(Integer.parseInt(bno));
		rvo.setReplyContent(reply);
		
		AdminService svc = new AdminServiceImpl();
		if(svc.adminBoardReply(rvo)&&svc.adminBoardReplyUp(Integer.parseInt(bno))) {
			resp.sendRedirect("adminBoardList.do");
		}else {
			resp.sendRedirect("adminBoadrControl.do");
		}
		

	}

}
