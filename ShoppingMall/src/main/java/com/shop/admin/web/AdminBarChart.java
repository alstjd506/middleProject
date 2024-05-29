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
import com.shop.vo.ChartVO;

public class AdminBarChart implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		AdminService svc = new AdminServiceImpl();
		
		List<ChartVO> cvo = svc.adminBarChart();
		System.out.println(cvo);
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(cvo);
		resp.getWriter().print(json);
	}

}
