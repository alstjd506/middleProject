package com.shop.product.web;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.common.SearchVO;

import com.shop.product.service.ProductService;
import com.shop.product.service.ProductServiceImpl;
import com.shop.product.service.ReviewService;
import com.shop.product.service.ReviewServiceImpl;
import com.shop.vo.ProductVO;

public class MainControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");

		String path = "main/main.tiles";
		
	

		ProductService svc = new ProductServiceImpl();
		ReviewService rvc = new ReviewServiceImpl();
		
		List<ProductVO> poplist = svc.productList();
		List<ProductVO> newlist = svc.productNewList();
		List<ProductVO> mdlist = svc.productMdList();
		List<ProductVO> cheaplist = svc.productCheapList();
		
		for(ProductVO product : poplist) {
			Double avgScore = rvc.avgScore(product.getProdNo());
			product.setProdScore(avgScore);
		}
		for(ProductVO product : newlist) {
			Double avgScore = rvc.avgScore(product.getProdNo());
			product.setProdScore(avgScore);
		}
		for(ProductVO product : mdlist) {
			Double avgScore = rvc.avgScore(product.getProdNo());
			product.setProdScore(avgScore);
		}
		for(ProductVO product : cheaplist) {
			Double avgScore = rvc.avgScore(product.getProdNo());
			product.setProdScore(avgScore);
		}
		
		req.setAttribute("productList", poplist);
		req.setAttribute("productNewList", newlist);
		req.setAttribute("productMdList", mdlist);
		req.setAttribute("productCheapList", cheaplist);

		req.getRequestDispatcher(path).forward(req, resp);

	}

}
