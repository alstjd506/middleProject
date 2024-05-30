package com.shop.admin.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;

public class AdminOrderInfo implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String ono = req.getParameter("ono");
		String uid = req.getParameter("uid");
		
		System.out.println(ono);
		System.out.println(uid);
		AdminService svc = new AdminServiceImpl();	
		
		List<ProductVO> pvo = svc.adminOrderDetail(Integer.parseInt(ono));
		OrderVO ovo = svc.adminOrderInfo(uid, Integer.parseInt(ono));
		System.out.println(pvo);
		System.out.println(ovo);
		req.setAttribute("uid", pvo);
		req.setAttribute("order", ovo);
		String path = "admin/adminorderInfo.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
