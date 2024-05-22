package com.shop.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;
import com.shop.product.service.ProductService;
import com.shop.product.service.ProductServiceImpl;
import com.shop.vo.ProductVO;

public class ProductInfoControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = "product/productInfo.tiles";
		
		String prodNo = req.getParameter("prodNo");
		ProductService svc = new ProductServiceImpl();
		List<ProductVO> productInfo = svc.productInfo(Integer.parseInt(prodNo));
		
		req.setAttribute("productInfo",productInfo);
		req.getRequestDispatcher(path).forward(req, resp);
		
		
		
	}
}
