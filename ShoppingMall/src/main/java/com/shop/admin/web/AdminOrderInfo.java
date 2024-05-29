package com.shop.admin.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.OrderDetailVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;

public class AdminOrderInfo implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String orderNo = req.getParameter("ono");
			
		
		AdminService svc = new AdminServiceImpl();	
		
		List<OrderDetailVO> oist = svc.adminOrderInfo(Integer.parseInt(orderNo));
		OrderVO ovo = svc.adminOrderInfos(Integer.parseInt(orderNo));
		ProductVO pvo = svc.adminProductInfo(ovo.getOrderNo());
		
		req.setAttribute("prod", pvo);
		req.setAttribute("orderdetail", oist);
		req.setAttribute("order", ovo);
		String path = "admin/orderInfo.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
