package com.shop.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.Control;
import com.shop.member.service.MemberService;
import com.shop.member.service.MemberServiceImpl;
import com.shop.vo.MemberVO;

public class DeleteUserControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		req.setCharacterEncoding("utf-8");
//		HttpSession session = req.getSession();
//		String logId = (String) session.getAttribute("logId");
//		String password = req.getParameter("pw");
//
//		MemberService svc = new MemberServiceImpl();
//		MemberVO mvo = svc.login(logId, password);
//
//		if (mvo != null && mvo.getUserPw().equals(password)) {
//		    // 사용자가 인증되고 비밀번호가 일치하면 삭제 진행
//		    boolean success = svc.DeleteUser(logId);
//		    if (success) {
//		        // 사용자가 성공적으로 삭제되면 성공 메시지를 표시
//		        req.setAttribute("message", "사용자가 성공적으로 삭제되었습니다.");
//		        req.getRequestDispatcher("successPage.jsp").forward(req, resp);
//		        resp.sendRedirect("main.do");
//		    } else {
//		        // 사용자 삭제에 실패한 경우 에러 메시지를 표시
//		        req.setAttribute("error", "사용자 삭제에 실패했습니다.");
//		        req.getRequestDispatcher("login/DeleteUserForm.tiles").forward(req, resp);
//		    }
//		} else {
//		    req.setAttribute("error", "비밀번호가 일치하지 않습니다.");
//		    req.getRequestDispatcher("login/DeleteUserForm.tiles").forward(req, resp);
//		}	
		
		req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        String logId = (String) session.getAttribute("logId");
        String password = req.getParameter("pw");
        System.out.println(logId);
        System.out.println(password);
        
        MemberService svc = new MemberServiceImpl();
        MemberVO mvo = svc.login(logId, password);

        if (mvo != null && mvo.getUserPw().equals(password)) {
            boolean result = svc.DeleteUser(logId);

            if (result) {
            	System.out.println("성공");
                session.invalidate();
                req.setAttribute("message", "OK");
                resp.sendRedirect("main.do");
        
        } else {
        	System.out.println("실패");
            req.setAttribute("error", "비밀번호가 일치하지 않습니다.");
            req.getRequestDispatcher("Deleteuser.do");
        }
        }
//        /login/DelteUserForm.tiles
	}//end

}
