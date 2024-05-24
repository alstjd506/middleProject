package com.shop.product.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shop.common.Control;
import com.shop.product.service.ProductService;
import com.shop.product.service.ProductServiceImpl;
import com.shop.vo.ProductVO;

public class MenuCategoryControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("application/json;charset=utf-8");

	    String categoryCode = req.getParameter("categoryCode");
	    if (categoryCode == null || categoryCode.isEmpty()) {
	    	categoryCode = "1";
	    }

	    ProductService svc = new ProductServiceImpl();
	    List<ProductVO> menuCategoryList = svc.menuCategory(Integer.parseInt(categoryCode));
	   
	    Gson gson = new GsonBuilder().create();
	    String json = gson.toJson(menuCategoryList);
	    resp.getWriter().print(json);
	    
	    
	}

}
