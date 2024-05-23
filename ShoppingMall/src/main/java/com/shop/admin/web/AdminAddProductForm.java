package com.shop.admin.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.CategoryVO;

public class AdminAddProductForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		String cno = req.getParameter("cno");
		
		
		AdminService svc = new AdminServiceImpl();
		
		//List<CategoryVO> topList = svc.topAdminCategoryList();
		//req.setAttribute("TopCategoryList", topList);
		
		
		List<CategoryVO> list = svc.adminCategoryList(Integer.parseInt(cno));
		Gson gson = new GsonBuilder().create();
		resp.getWriter().print(gson.toJson(list));
		
		

	}

}
