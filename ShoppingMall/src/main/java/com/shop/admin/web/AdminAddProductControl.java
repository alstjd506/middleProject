package com.shop.admin.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.ProductVO;

public class AdminAddProductControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. request(요청정보) 2.저장경로 3.maxsize(파일크기) 4.인코딩(한글처리) 5.중복된이름 리네임정책
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 5 * 1024 * 1024;

		MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());

		String topTitle = mr.getParameter("item_catemain");
		String categoryCode = mr.getParameter("item_catesub");
		String name = mr.getParameter("item_name");
		String price = mr.getParameter("item_price");
		String comment = mr.getParameter("item_content");
		String Imgae = mr.getParameter("itemMainImg");
		String contentImg = mr.getParameter("temSubImg");
		System.out.println("1"+topTitle +"2"+categoryCode+"3"+name+"4"+price+"5"+comment+"6"+Imgae);
		
		ProductVO pvo = new ProductVO();
		pvo.setCategoryCode(Integer.parseInt(categoryCode));
		pvo.setProdName(name);
		pvo.setProdPrice(Integer.parseInt(price));
		pvo.setProdComment(comment);
		pvo.setProdImage(Imgae);
		
		AdminService svc = new AdminServiceImpl();
		if(svc.adminAddProductControl(pvo)) {
			resp.sendRedirect("adminProductList.do");
		}else {
			resp.sendRedirect("adminAddProduct.do");
		}
	}

}
