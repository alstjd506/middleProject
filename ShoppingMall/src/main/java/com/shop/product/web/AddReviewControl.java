
package com.shop.product.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shop.common.Control;
import com.shop.product.service.ReviewServiceImpl;
import com.shop.product.service.ReviewService;
import com.shop.vo.ReviewVO;

public class AddReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		
		String prodNo = req.getParameter("prodNo");
			
		String reviewScore = req.getParameter("reviewScore");
		String reviewContent = req.getParameter("reviewContent");
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("logId");
		System.out.println(prodNo);
		System.out.println(reviewScore);
		System.out.println(reviewContent);
		System.out.println(userId);
		
		
		
		ReviewVO rvo = new ReviewVO();
		rvo.setProdNo(Integer.parseInt(prodNo));
		rvo.setReviewScore(Integer.parseInt(reviewScore));
		rvo.setReviewContent(reviewContent);
		rvo.setUserId(userId);
		
		Map<String, Object> result = new HashMap<>();
		
		ReviewService svc = new ReviewServiceImpl();
		if(svc.addReview(rvo)) {
			result.put("retCode", "OK");
			result.put("retVal", rvo);
		}else {
			// {"retCode": "NG"}
			result.put("retCode", "NG");
			result.put("retVal", null);
			
		}

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(result);
		resp.getWriter().print(json);
		
	}

}
