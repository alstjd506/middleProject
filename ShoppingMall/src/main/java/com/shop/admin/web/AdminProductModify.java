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

public class AdminProductModify implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1. request(요청정보) 2.저장경로 3.maxsize(파일크기) 4.인코딩(한글처리) 5.중복된이름 리네임정책
		String savePath = req.getServletContext().getRealPath("images");
		int maxSize = 5 * 1024 * 1024;

		MultipartRequest mr = new MultipartRequest(req, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());

		String prodNo = mr.getParameter("prodNo");
		String name = mr.getParameter("name");
		String price = mr.getParameter("price");
		String comment = mr.getParameter("comment");
		String mainimg = mr.getFilesystemName("mainimg");
		String conimg = mr.getFilesystemName("conimg");

		System.out.println(prodNo + name + price + comment + mainimg + conimg);
			
		
		AdminService svc = new AdminServiceImpl();
		ProductVO pvo = new ProductVO();
		pvo.setProdNo(Integer.parseInt(prodNo));
		pvo.setProdName(name);
		pvo.setProdPrice(Integer.parseInt(price));
		pvo.setProdComment(comment);
		pvo.setProdImage(mainimg);
		pvo.setProdCommentImage(conimg);
		if(svc.adminProductModify(pvo)) {
			resp.sendRedirect("admin.do");
		}else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
