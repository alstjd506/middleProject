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
import com.shop.admin.web.AdminBarChart;
import com.shop.admin.web.AdminBoadrControl;
import com.shop.admin.web.AdminBoardInfo;
import com.shop.admin.web.AdminBoardList;
import com.shop.admin.web.AdminCancleAgree;
import com.shop.admin.web.AdminCancleList;
import com.shop.admin.web.AdminChartControl;
import com.shop.admin.web.AdminControl;
import com.shop.admin.web.AdminMemberList;
import com.shop.admin.web.AdminOrderInfo;
import com.shop.admin.web.AdminOrderList;
import com.shop.admin.web.AdminOrderStatusControl;
import com.shop.admin.web.AdminPieChart;
import com.shop.admin.web.AdminProductInfo;
import com.shop.admin.web.AdminProductList;
import com.shop.admin.web.AdminProductModify;
import com.shop.admin.web.AdminProductModifyForm;
import com.shop.admin.web.AdminProductRemove;
import com.shop.admin.web.AdminReturnAgree;
import com.shop.admin.web.AdminReturnList;

import com.shop.admin.web.AdminReviewList;
import com.shop.admin.web.AdminTimeChart;
import com.shop.board.web.AddBoardControl;
import com.shop.board.web.BoardControl;
import com.shop.board.web.BoardFailedControl;
import com.shop.board.web.BoardSuccessControl;
import com.shop.member.web.DeleteUserControl;

import com.shop.member.web.DeleteUserForm;
import com.shop.member.web.FindIdControl;
import com.shop.member.web.FindIdForm;
import com.shop.member.web.FindIdResultForm;
import com.shop.member.web.FindPwControl;
import com.shop.member.web.FindPwForm;
import com.shop.member.web.FindPwResultForm;
import com.shop.member.web.JoinControl;
import com.shop.member.web.JoinForm;
import com.shop.member.web.LoginControl;
import com.shop.member.web.LoginForm;
import com.shop.member.web.LogoutControl;
import com.shop.member.web.ModifyUserControl;
import com.shop.member.web.ModifyUserForm;
import com.shop.member.web.MyPageCancleOrder;
import com.shop.member.web.MyPageConfOder;
import com.shop.member.web.MyPageControl;
import com.shop.member.web.MyPageOrderControl;
import com.shop.member.web.MyPageOrderDetail;
import com.shop.member.web.MyPagePastControl;
import com.shop.member.web.MyPageReturnControl;
import com.shop.member.web.MyPageReturnfOder;
import com.shop.member.web.myPageBoardControl;
import com.shop.member.web.myPageBoardInfo;
import com.shop.member.web.myPageBoardUpdate;
import com.shop.member.web.myPageReviewControl;
import com.shop.order.web.AddCartControl;
import com.shop.order.web.CartControl;
import com.shop.order.web.CartListControl;
import com.shop.order.web.EditCartControl;
import com.shop.order.web.OrderControl;
import com.shop.order.web.OrderDirectControl;
import com.shop.order.web.OrderFailedControl;
import com.shop.order.web.OrderFormControl;
import com.shop.order.web.OrderInfoControl;
import com.shop.order.web.OrderListControl;
import com.shop.order.web.OrderSuccessControl;
import com.shop.order.web.RemoveCartControl;
import com.shop.order.web.checkCartControl;
import com.shop.product.web.AddReviewControl;
import com.shop.product.web.CategoryControl;
import com.shop.product.web.FilterProductList;
import com.shop.product.web.MainControl;
import com.shop.product.web.ProductInfoControl;
import com.shop.product.web.MenuCategoryControl;
import com.shop.product.web.ModifyReviewControl;
import com.shop.product.web.ProductListControl;

import com.shop.product.web.SearchControl;
import com.shop.product.web.SearchFormControl;


import com.shop.product.web.RemoveReviewControl;
import com.shop.product.web.ReviewControl;
import com.shop.product.web.TotalCountControl;
import com.shop.product.web.updateProductAvgScore;


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
		
		//js 별찍기
		map.put("/updateProductAvgScore.do", new updateProductAvgScore());
		
		//검색 화면
		map.put("/search.do", new SearchControl());
		map.put("/searchForm.do",new SearchFormControl());

		//마이페이지 주문관련화면
		map.put("/myPage.do", new MyPageControl());
		map.put("/myPageOrder.do", new MyPageOrderControl());
		map.put("/myPagePastOrder.do", new MyPagePastControl());
		map.put("/myPageReturn.do", new MyPageReturnControl());
		map.put("/myPageOrderDetail.do", new MyPageOrderDetail());
		map.put("/myPageReturn.do", new MyPageReturnControl());
		
		//마이페이지 주문처리
		map.put("/myPageCancleOrder.do", new MyPageCancleOrder());
		map.put("/myPageConfOrder.do", new MyPageConfOder());
		map.put("/myPageReturnOrder.do", new MyPageReturnfOder());
		
		//마이페이지 Q&A
		map.put("/myPageBoard.do", new myPageBoardControl());
		map.put("/myPageBoardInfo.do", new myPageBoardInfo());
		map.put("/myPageBoardUpdate.do", new myPageBoardUpdate());
		
		//마이페이지 리뷰
		map.put("/myPageReview.do", new myPageReviewControl());
		
		
		//상품 상세 화면
		map.put("/productInfo.do", new ProductInfoControl());	
		
		//상품 리뷰
		map.put("/reviewList.do", new ReviewControl());
		map.put("/removeReview.do", new RemoveReviewControl());
		map.put("/addReview.do", new AddReviewControl());
		map.put("/modifyReview.do", new ModifyReviewControl());
		map.put("/getTotalCnt.do", new TotalCountControl());
		map.put("/filterProductList.do", new FilterProductList());
		
		//관리자 화면
		map.put("/admin.do", new AdminControl()); // 관리자 메인화면 o
		map.put("/memberList.do", new AdminMemberList()); // 관리자 회원목록조회 o
		map.put("/adminProductList.do", new AdminProductList()); // 관리자 상품목록조회 o
		map.put("/adminProductInfo.do", new AdminProductInfo()); // 관리자 상품상세조회 o
		map.put("/adminProductModifyForm.do", new AdminProductModifyForm()); // 관리자 상품 수정화면 o
		map.put("/adminProductModify.do", new AdminProductModify()); // 관리자 상품 수정기능 o
		map.put("/adminProductRemove.do", new AdminProductRemove()); // 관리자 상품 삭제기능 o
		map.put("/adminBoardList.do",new AdminBoardList()); // 관리자 Q&A 목록조회 o
		map.put("/adminBoardInfo.do", new AdminBoardInfo()); // 관리자 Q&A 상세조회 o
		map.put("/adminBoadrControl.do", new AdminBoadrControl()); // 관리자 Q&A 답글남기기 기능 o
		map.put("/adminReplyModi.do", new AadminReplyModi()); // 관리자 Q&A 답글 수정기능 o
		map.put("/adminOrderList.do", new AdminOrderList()); // 관리자 주문현황 조회 o
		map.put("/adminOrderStatus.do", new AdminOrderStatusControl()); // 관리자 주문상태 변경 o
		map.put("/adminCancleList.do", new AdminCancleList()); // 관리자 취소현황 조회 o
		map.put("/adminCancleAgree.do", new AdminCancleAgree()); // 관리자 취소승인 o
		map.put("/adminReturnList.do", new AdminReturnList()); // 관리자 반품현황 조회 o  
		map.put("/adminReturnAgree.do", new AdminReturnAgree()); // 관리자 반품승인 o
		map.put("/adminOrderInfo.do", new AdminOrderInfo()); // 관리자 주문상세보기 o
		map.put("/adminAddProductForm.do", new AdminAddProductForm()); // 관리자 하위카테고리불러오기 o
		map.put("/adminAddProduct.do", new AdminAddProduct()); // 관리자 상품등록 페이지 o
		map.put("/adminAddProductControl.do", new AdminAddProductControl());// 관리자 상품등록기능 o
		map.put("/adminChartControl.do", new AdminChartControl( )); // 관리자 매출차트화면 x
		map.put("/adminBarChart.do", new AdminBarChart()); // 관리자 바형식차트 o
		map.put("/adminPieChart.do", new AdminPieChart()); // 관리자 파이형식차트 o
		map.put("/adminTimeChart.do", new AdminTimeChart()); // 관리자 시간대별차트 o
		
		
		//로그인화면
		map.put("/login.do", new LoginForm()); //로그인화면
		map.put("/loginControl.do", new LoginControl()); 
		map.put("/logout.do", new LogoutControl()); //로그아웃
		//아이디찾기
		map.put("/findid.do", new FindIdForm()); //아이디찾기
		map.put("/findIdControl.do", new FindIdControl());
		map.put("/findidresult.do", new FindIdResultForm()); //아이디찾기 결과창
		//비밀번호찾기
		map.put("/findpw.do", new FindPwForm()); //비밀번호찾기
		map.put("/findPwControl.do", new FindPwControl());
		map.put("/findpwresult.do", new FindPwResultForm()); //비밀번호찾기 결과창
		//회원가입
		map.put("/join.do", new JoinForm()); //회원가입
		map.put("/joinControl.do",new JoinControl());
		//회원정보수정
		map.put("/modifyuser.do", new ModifyUserForm()); //회원정보수정
		map.put("/ModifyUserControl.do", new ModifyUserControl());
		//회원탈퇴
		map.put("/Deleteuser.do", new DeleteUserForm());
		map.put("/DeleteUserControl.do", new DeleteUserControl());
		
		
		// 주문 화면
		map.put("/order.do", new OrderControl());
		map.put("/orderList.do", new OrderListControl()); // 장바구니 주문상품 목록
		map.put("/orderDirect.do", new OrderDirectControl()); // 바로구매 주문상품
		map.put("/orderInfo.do", new OrderInfoControl()); // 주문자 정보
		map.put("/orderForm.do", new OrderFormControl()); // 주문 처리
		map.put("/orderSuccess.do", new OrderSuccessControl()); // 주문 성공 페이지
		map.put("/orderFailed.do", new OrderFailedControl()); // 주문 실패 페이지
		
		// 장바구니 화면
		map.put("/cart.do", new CartControl());
		map.put("/cartList.do", new CartListControl()); // 장바구니 목록
		map.put("/removeCart.do", new RemoveCartControl()); // 장바구니 삭제
		map.put("/editCart.do", new EditCartControl()); // 장바구니 수량 수정
		map.put("/addCart.do", new AddCartControl()); // 장바구니 추가
		map.put("/checkCart.do", new checkCartControl()); //물품등록 중복체크
		
		// Q&A
		map.put("/board.do", new BoardControl()); // Q&A 작성페이지
		map.put("/addBoard.do", new AddBoardControl()); // Q&A 추가
		map.put("/boardSuccess.do", new BoardSuccessControl()); // 작성 성공 페이지
		map.put("/boardFailed.do", new BoardFailedControl()); // 작성 실패 페이지
		
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
