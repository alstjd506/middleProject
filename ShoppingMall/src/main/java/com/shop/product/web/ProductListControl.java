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

public class ProductListControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String path = "product/productList.tiles";

		String categoryCode = req.getParameter("categoryCode");
		ProductService svc = new ProductServiceImpl();

		if (categoryCode.length() == 1) {
			List<ProductVO> categoryList = svc.categoryList(Integer.parseInt(categoryCode));
			req.setAttribute("productList", categoryList);
			
			
		} else if (categoryCode.length() == 2) {
			List<ProductVO> menuCategory = svc.menuCategory(Integer.parseInt(categoryCode));
			req.setAttribute("productList", menuCategory);
		}

		req.getRequestDispatcher(path).forward(req, resp);
	}
}
