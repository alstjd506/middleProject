package com.shop.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.common.Control;

public class FindIdForm implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String path = "WEB-INF/login/FindIdForm.tiles";
		path = "login/FindIdForm.tiles";
		req.getRequestDispatcher(path).forward(req, resp);
	}

}
