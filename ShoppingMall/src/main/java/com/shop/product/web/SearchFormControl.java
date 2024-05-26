package com.shop.product.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;

public class SearchFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
//		String keyword = req.getParameter("keyword");
//		String filter = req.getParameter("filter");
//
//		SearchVO search = new SearchVO();
//		search.setKeyword(keyword);
//		search.setFilter(filter);
//
//		ProductService svc = new ProductServiceImpl();
//		List<ProductVO> searchResult = svc.searchProduct(search);
//		req.setAttribute("searchResult", searchResult);

		String path = "product/searchResult.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
