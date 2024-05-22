package com.shop.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.member.web.AdminControl;
import com.shop.member.web.MyPageControl;
import com.shop.product.web.CategoryControl;
import com.shop.product.web.MainControl;


public class FrontControl extends HttpServlet {
	Map<String, Control> map;
	// 생성자
	public FrontControl() {
		map = new HashMap<>();
	}
	// init
	@Override
	public void init(ServletConfig config) throws ServletException {
		//메인 홈화면
		map.put("/main.do", new MainControl());
		map.put("/category.do", new CategoryControl());
		
		//관리자 화면
		map.put("/admin.do", new AdminControl());
		
		//마이페이지 화면
		map.put("/myPage.do", new MyPageControl());
		// 박성준 인뎀 ㅝ
	}

	// service
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // 요청정보의 한글처리

		String uri = req.getRequestURI();
		String context = req.getContextPath();
		System.out.println("uri: " + uri + ", context: " + context);
		String path = uri.substring(context.length());
		System.out.println("path: " + path);

		Control control = map.get(path);
		control.exec(req, resp);

	}

	// destroy.
	@Override
	public void destroy() {

	}
}
