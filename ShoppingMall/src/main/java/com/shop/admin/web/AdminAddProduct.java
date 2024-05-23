package com.shop.admin.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.service.AdminService;
import com.shop.admin.service.AdminServiceImpl;
import com.shop.common.Control;
import com.shop.vo.CategoryVO;

public class AdminAddProduct implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminService svc = new AdminServiceImpl();

		List<CategoryVO> list = svc.topAdminCategoryList();

		String path = "admin/adminAddProduct.tiles";
		req.setAttribute("topCategory", list);

		req.getRequestDispatcher(path).forward(req, resp);

	}

}
