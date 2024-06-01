package com.shop.product.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.product.service.ReviewService;
import com.shop.product.service.ReviewServiceImpl;
import com.shop.vo.ReviewVO;

public class ModifyReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String reviewNo = req.getParameter("reviewNo");
		String reviewContent = req.getParameter("reviewCon");
		String reviewLike = req.getParameter("reviewLike");
		System.out.println(reviewLike);
		ReviewVO rvo = new ReviewVO();
		rvo.setReviewNo(Integer.parseInt(reviewNo));
		rvo.setReviewContent(reviewContent);
		rvo.setReviewScore(Integer.parseInt(reviewLike));
		
		ReviewService svc = new ReviewServiceImpl();
		if(svc.modifyReview(rvo)) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		}else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}
	}

}
