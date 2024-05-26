package com.shop.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.product.service.ProductService;
import com.shop.product.service.ProductServiceImpl;
import com.shop.vo.ProductVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shop.common.Control;
import com.shop.common.SearchVO;

public class SearchControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    resp.setContentType("application/json;charset=utf-8");

//		String page = req.getParameter("page");
        String keyword = req.getParameter("keyword");
//        String filter = req.getParameter("filter");

//		page = page == null ? "1" : page;
        SearchVO search = new SearchVO();
//		search.setPage(Integer.parseInt(page));
        search.setKeyword(keyword);
//        search.setFilter(filter);

        ProductService svc = new ProductServiceImpl();
        List<ProductVO> searchResult = svc.searchProduct(search);

        Gson gson = new GsonBuilder().create();
        String json = gson.toJson(searchResult);
        resp.getWriter().print(json);
		
	}

}
