package com.shop.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.web.AdminAddProductForm;
import com.shop.admin.web.AdminBoardInfo;
import com.shop.admin.web.AdminBoardList;
import com.shop.admin.web.AdminCancleAgree;
import com.shop.admin.web.AdminControl;
import com.shop.admin.web.AdminMemberList;
import com.shop.admin.web.AdminOrderList;
import com.shop.admin.web.AdminProductList;

import com.shop.admin.web.AdminReturnAgree;
import com.shop.admin.web.AdminReturnList;
import com.shop.admin.web.AdminCancleList;
import com.shop.member.web.FindIdForm;
import com.shop.member.web.FindPwForm;
import com.shop.member.web.JoinForm;
import com.shop.member.web.LoginForm;
import com.shop.member.web.MyPageControl;
import com.shop.order.web.CartControl;
import com.shop.order.web.CartListControl;
import com.shop.order.web.OrderControl;
import com.shop.order.web.RemoveCartControl;
import com.shop.product.web.CategoryControl;
import com.shop.product.web.MainControl;
import com.shop.product.web.ProductInfoControl;
import com.shop.product.web.menuCategory;
import com.shop.product.web.menuTopCategroy;


public class FrontControl extends HttpServlet {
	Map<String, Control> map;

	// 생성자
	public FrontControl() {
		map = new HashMap<>();
	}

	// init
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 메인 홈화면
		map.put("/main.do", new MainControl());
		map.put("/category.do", new CategoryControl());
		map.put("/menuCategory.do", new menuCategory());

		map.put("/menuTopCategory.do", new menuTopCategroy());
		
		
	

		
		//관리자 화면
		map.put("/admin.do", new AdminControl()); // 관리자 메인화면
		map.put("/memberList.do", new AdminMemberList()); // 관리자 회원목록조회
		map.put("/adminProductList.do", new AdminProductList()); // 관리자 상품목록조회
		map.put("/adminBoardList.do",new AdminBoardList()); // 관리자 Q&N목록조회
		map.put("/adminBoardInfo.do", new AdminBoardInfo()); // 관리자 Q&N 상세조회/답글남기기
		map.put("/adminOrderList.do", new AdminOrderList()); // 관리자 주문현황 조회
		map.put("/adminCancleList.do", new AdminCancleList()); // 관리자 취소현황 조회
		map.put("/adminCancleAgree.do", new AdminCancleAgree()); // 관리자 취소승인
		map.put("/adminReturnList.do", new AdminReturnList()); // 관리자 반품현황 조회
		map.put("/adminReturnAgree.do", new AdminReturnAgree()); // 관리자 반품승인
		map.put("/adminAddProductForm.do", new AdminAddProductForm()); // 관리자 상품등록 페이지
		
		
		//마이페이지 화면
		map.put("/myPage.do", new MyPageControl());

		//상품 상세 화면
		map.put("/productInfo.do", new ProductInfoControl());
		

		// 주문 화면
		map.put("/order.do", new OrderControl());

		// 장바구니 화면
		map.put("/cart.do", new CartControl());
		map.put("/cartList.do", new CartListControl());
		map.put("/removeCart.do", new RemoveCartControl());
		
	
		//로그인화면
		map.put("/login.do", new LoginForm());
		map.put("/findid.do", new FindIdForm());
		map.put("/findpw.do", new FindPwForm());
		//회원가입
		map.put("/join.do", new JoinForm());


	




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
