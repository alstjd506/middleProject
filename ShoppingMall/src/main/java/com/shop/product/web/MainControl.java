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

import com.shop.vo.ProductVO;

public class MainControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");

		String path = "main/main.tiles";

		ProductService svc = new ProductServiceImpl();

		List<ProductVO> poplist = svc.productList();
		req.setAttribute("productList", poplist);

		List<ProductVO> newlist = svc.productNewList();
		req.setAttribute("productNewList", newlist);

		List<ProductVO> mdlist = svc.productMdList();
		req.setAttribute("productMdList", mdlist);

		List<ProductVO> cheaplist = svc.productCheapList();
		req.setAttribute("productCheapList", cheaplist);

		req.getRequestDispatcher(path).forward(req, resp);

	}

}
