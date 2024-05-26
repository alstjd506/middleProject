package com.shop.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.admin.web.AadminReplyModi;
import com.shop.admin.web.AdminAddProduct;
import com.shop.admin.web.AdminAddProductControl;
import com.shop.admin.web.AdminAddProductForm;
import com.shop.admin.web.AdminBoadrControl;
import com.shop.admin.web.AdminBoardInfo;
import com.shop.admin.web.AdminBoardList;
import com.shop.admin.web.AdminCancleAgree;
import com.shop.admin.web.AdminCancleList;
import com.shop.admin.web.AdminChartControl;
import com.shop.admin.web.AdminControl;
import com.shop.admin.web.AdminMemberList;
import com.shop.admin.web.AdminOrderList;
import com.shop.admin.web.AdminProductInfo;
import com.shop.admin.web.AdminProductList;
import com.shop.admin.web.AdminReturnAgree;
import com.shop.admin.web.AdminReturnList;
import com.shop.member.web.FindIdForm;
import com.shop.member.web.FindPwForm;
import com.shop.member.web.JoinForm;
import com.shop.member.web.LoginControl;
import com.shop.member.web.LoginForm;
import com.shop.member.web.LogoutControl;
import com.shop.member.web.MyPageControl;
import com.shop.order.web.AddCartControl;
import com.shop.order.web.CartControl;
import com.shop.order.web.CartListControl;
import com.shop.order.web.EditCartControl;
import com.shop.order.web.OrderControl;
import com.shop.order.web.RemoveCartControl;
import com.shop.product.web.AddReviewControl;
import com.shop.product.web.CategoryControl;
import com.shop.product.web.MainControl;
import com.shop.product.web.ProductInfoControl;
import com.shop.product.web.MenuCategoryControl;
import com.shop.product.web.ProductListControl;
import com.shop.product.web.SearchControl;
import com.shop.product.web.SearchFormControl;


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
		map.put("/menuCategory.do", new MenuCategoryControl());
		map.put("/productList.do", new ProductListControl());
		
		//검색 화면
		map.put("search.do", new SearchControl());
		map.put("searchForm.do", new SearchFormControl());

		map.put("/admin.do", new AdminControl()); // 관리자 메인화면 o
		map.put("/memberList.do", new AdminMemberList()); // 관리자 회원목록조회 o
		map.put("/adminProductList.do", new AdminProductList()); // 관리자 상품목록조회 o
		map.put("/adminProductInfo.do", new AdminProductInfo()); // 관리자 상풍상세조회 x
		map.put("/adminBoardList.do",new AdminBoardList()); // 관리자 Q&A 목록조회 o
		map.put("/adminBoardInfo.do", new AdminBoardInfo()); // 관리자 Q&A 상세조회 o
		map.put("/adminBoadrControl.do", new AdminBoadrControl()); // 관리자 Q&A 답글남기기 기능 o
		map.put("/adminReplyModi.do", new AadminReplyModi()); // 관리자 Q&A 답글 수정기능 o
		map.put("/adminOrderList.do", new AdminOrderList()); // 관리자 주문현황 조회 o
		map.put("/adminCancleList.do", new AdminCancleList()); // 관리자 취소현황 조회 o
		map.put("/adminCancleAgree.do", new AdminCancleAgree()); // 관리자 취소승인 o
		map.put("/adminReturnList.do", new AdminReturnList()); // 관리자 반품현황 조회 o  
		map.put("/adminReturnAgree.do", new AdminReturnAgree()); // 관리자 반품승인 o
		map.put("/adminAddProductForm.do", new AdminAddProductForm()); // 관리자 하위카테고리불러오기 o
		map.put("/adminAddProduct.do", new AdminAddProduct()); // 관리자 상품등록 페이지 o
		map.put("/adminAddProductControl.do", new AdminAddProductControl());// 관리자 상품등록기능 o
		map.put("/adminChartControl.do", new AdminChartControl()); // 관리자 매출차트 x
	
		//마이페이지 화면
		map.put("/myPage.do", new MyPageControl());

		//상품 상세 화면
		map.put("/productInfo.do", new ProductInfoControl());
		//상품 리뷰
		map.put("/addReview.do", new AddReviewControl());

		
		
		// 주문 화면
		map.put("/order.do", new OrderControl());

	

		//로그인화면
		map.put("/login.do", new LoginForm()); //로그인화면
		map.put("/loginControl.do", new LoginControl()); 
		map.put("/logout.do", new LogoutControl()); //로그아웃
		map.put("/findid.do", new FindIdForm()); //아이디찾기
		map.put("/findpw.do", new FindPwForm()); //비밀번호찾기
		//회원가입
		map.put("/join.do", new JoinForm()); //회원가입


		// 주문 화면
		map.put("/order.do", new OrderControl());
		
		// 장바구니 화면
		map.put("/cart.do", new CartControl());
		map.put("/cartList.do", new CartListControl()); // 장바구니 목록
		map.put("/removeCart.do", new RemoveCartControl()); // 장바구니 삭제
		map.put("/editCart.do", new EditCartControl()); // 장바구니 수량 수정
		map.put("/addCart.do", new AddCartControl()); // 장바구니 추가
		
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
