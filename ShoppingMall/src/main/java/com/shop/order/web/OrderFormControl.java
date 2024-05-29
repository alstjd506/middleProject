package com.shop.order.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.shop.common.Control;
import com.shop.order.service.OrderService;
import com.shop.order.service.OrderServiceImpl;
import com.shop.vo.OrderDetailVO;
import com.shop.vo.OrderVO;

public class OrderFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 회원아이디, 우편번호, 주소, 상세주소, 상품번호, 수량, 총금액
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		String userPost = req.getParameter("userPost");
		String userAddr = req.getParameter("userAddr");
		String userDetailAddr = req.getParameter("userDetailAddr");
		String prodNo = req.getParameter("prodNo");
		String prodCnt = req.getParameter("prodCnt");
		String orderPrice = req.getParameter("orderPrice");

		// 주문 테이블 데이터 추가
		OrderVO ovo = new OrderVO();
		ovo.setUserId(userId);
		ovo.setOrderPost(Integer.parseInt(userPost));
		ovo.setOrderAddr(userAddr);
		ovo.setOrderDetailAddr(userDetailAddr);
		ovo.setOrderPrice(Integer.parseInt(orderPrice));
		
		OrderService svc = new OrderServiceImpl();
		
		if(svc.addOrder(ovo)) {
			// 주문상세 테이블 데이터 추가
			int orderNo = svc.getOrderNo();
			String[] prodNoList = prodNo.split(",");
			String[] prodCntList = prodCnt.split(",");
					
			for(int i = 0; i < prodNoList.length; i++) {
				OrderDetailVO dvo = new OrderDetailVO();
				dvo.setOrderNo(orderNo);
				dvo.setProdNo(Integer.parseInt(prodNoList[i]));
				dvo.setOrderCnt(Integer.parseInt(prodCntList[i]));
				
				svc.addOrderDetail(dvo);
			}
			
			req.setAttribute("prodNo", prodNo);
			resp.sendRedirect("orderSuccess.do");
		} else {
			// 주문 실패
			System.out.println("주문 실패");
			resp.sendRedirect("orderFailed.do");
		}
		
	}

}
