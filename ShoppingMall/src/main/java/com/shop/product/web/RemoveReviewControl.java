package com.shop.product.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.product.service.ReviewService;
import com.shop.product.service.ReviewServiceImpl;

public class RemoveReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String reviewNo = req.getParameter("reviewNo");

		ReviewService svc = new ReviewServiceImpl();
		if (svc.removeReview(Integer.parseInt(reviewNo))) {
			resp.getWriter().print("{\"retCode\": \"OK\"}");
		} else {
			resp.getWriter().print("{\"retCode\": \"NG\"}");
		}

	}

}
