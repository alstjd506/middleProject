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
import com.shop.vo.OrderVO;

public class AdminControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AdminService svc = new AdminServiceImpl();

		List<OrderVO> ovo = svc.adminUnprocessedOrder(); // 미처리주문목록
		List<String> olist = new ArrayList<>();
		olist.add("주문번호");
		olist.add("주문자 ID");
		olist.add("주문상태");
		olist.add("주문자 주소");
		olist.add("주문자 상세주소");
		olist.add("주문일자");
		req.setAttribute("ovo", ovo);
		req.setAttribute("olist", olist);

		List<OrderVO> cvo = svc.adminUnprocessedCancle(); // 미처리취소목록
		List<String> clist = new ArrayList<>();
		clist.add("주문번호");
		clist.add("주문자 ID");
		clist.add("취소일자");
		clist.add("취소상태");
		req.setAttribute("cvo", cvo);
		req.setAttribute("clist", clist);

		List<OrderVO> rvo = svc.adminUnprocessedReturns(); // 미처리반품목록
		List<String> rlist = new ArrayList<>();
		rlist.add("주문번호");
		rlist.add("주문자 ID");
		rlist.add("반품일자");
		rlist.add("반품상태");
		req.setAttribute("rvo", rvo);
		req.setAttribute("rlist", rlist);

		List<BoardVO> bvo = svc.adminUnprocessedReply(); // 미처리Q&A목록
		List<String> blist = new ArrayList<>();
		blist.add("Q&N제목");
		blist.add("회원아이디");
		blist.add("등록일");
		blist.add("답변상태");
		req.setAttribute("bvo", bvo);
		req.setAttribute("blist", blist);
		
		int popProd = svc.adminPopularProduct(); // 인기상품
		req.setAttribute("popProd", popProd);
		
		int leastProd = svc.adminleastProduct(); // 비인기상품
		req.setAttribute("leastProd",leastProd);
		
		int popRevi = svc.adminPopulaReview(); // 리뷰많은 상품
		req.setAttribute("popRevi",popRevi);
		
		int highStar = svc.adminhighStar(); // 별점 높은 상품
		req.setAttribute("highStar",highStar);
		
		String path = "admin/admin.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
