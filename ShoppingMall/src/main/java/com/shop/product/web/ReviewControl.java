package com.shop.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shop.common.Control;
import com.shop.common.SearchVO;
import com.shop.product.service.*;
import com.shop.vo.ReviewVO;

public class ReviewControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		
		String prodNo = req.getParameter("prodNo");
		String rpage = req.getParameter("rpage");
		
		rpage = rpage == null ? "1" : rpage;
		
		SearchVO search = new SearchVO();
		search.setProdNo(Integer.parseInt(prodNo));
		search.setRpage(Integer.parseInt(rpage));
		
		ReviewService svc = new ReviewServiceImpl();
		List<ReviewVO> list = svc.reviewList(search);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		resp.getWriter().print(json);
		
		
		
		
	}

}
