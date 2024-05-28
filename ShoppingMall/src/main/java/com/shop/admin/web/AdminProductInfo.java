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
import com.shop.vo.ProductVO;
import com.shop.vo.ReviewVO;

public class AdminProductInfo implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String prodNo = req.getParameter("prodNo");
		
		AdminService svc = new AdminServiceImpl();
		
		ProductVO pvo = svc.adminProductInfo(Integer.parseInt(prodNo));
		
		List<String> rlist = new ArrayList<>();
		rlist.add("상품번호");
		rlist.add("별점");
		rlist.add("리뷰");
		rlist.add("작성자");
		rlist.add("리뷰 등록일");
		
		List<ReviewVO> rvo = svc.adminReviewList(Integer.parseInt(prodNo));
		
		int star = svc.adminReviewStar(Integer.parseInt(prodNo));
		
		req.setAttribute("star", star);
		req.setAttribute("reviewList", rvo);
		req.setAttribute("reviewTitle", rlist);
		req.setAttribute("product", pvo);
		
		String path = "admin/adminProductInfo.tiles";
		req.getRequestDispatcher(path).forward(req, resp);

	}

}
