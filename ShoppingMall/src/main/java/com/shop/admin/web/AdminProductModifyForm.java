package com.shop.admin.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.ProductVO;

public class AdminProductModifyForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String prodNo = req.getParameter("prodNo");
			
		AdminService svc = new AdminServiceImpl();
		
		ProductVO pvo = svc.adminProductInfo(Integer.parseInt(prodNo));
			
		req.setAttribute("product", pvo);
		String path = "admin/adminProductModify.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	
	}
	
}
