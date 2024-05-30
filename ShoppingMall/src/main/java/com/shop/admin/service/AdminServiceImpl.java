package com.shop.admin.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.shop.admin.mapper.AdminMapper;
import com.shop.common.DataSource;
import com.shop.vo.BoardVO;
import com.shop.vo.CategoryVO;
import com.shop.vo.ChartVO;
import com.shop.vo.MemberVO;
import com.shop.vo.OrderDetailVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;
import com.shop.vo.ReplyVO;
import com.shop.vo.ReviewVO;

public class AdminServiceImpl implements AdminService {

	SqlSession session = DataSource.getInstance().openSession(true);
	AdminMapper mapper = session.getMapper(AdminMapper.class);

	public List<ProductVO> adminProductList() {
		return mapper.adminProductList();
	}

	@Override
	public List<MemberVO> adminMemberList() {
		return mapper.adminMemberList();
	}

	@Override
	public List<BoardVO> adminBoardList() {
		return mapper.adminBoardList();
	}

	@Override
	public BoardVO adminBoardInfo(int bno) {
		return mapper.adminBoardInfo(bno);
	}

	@Override
	public List<OrderVO> adminOrderList() {
		return mapper.adminOrderList();
	}

	@Override
	public List<OrderVO> adminCancleList() {
		return mapper.adminCancleList();
	}

	@Override
	public boolean adminCancleAgree(int ono) {
		return mapper.adminCancleAgree(ono) == 1;
	}

	@Override
	public List<OrderVO> adminReturnList() {
		return mapper.adminReturnList();
	}

	@Override
	public boolean adminReturnAgree(int rno) {
		return mapper.adminReturnAgree(rno) == 1;
	}

	@Override
	public List<CategoryVO> topAdminCategoryList() {
		return mapper.topAdminCategoryList();
	}

	@Override
	public List<CategoryVO> adminCategoryList(int cno) {
		return mapper.adminCategoryList(cno);
	}

	@Override
	public boolean adminAddProductControl(ProductVO pvo) {
		return mapper.adminAddProductControl(pvo) == 1;
	}

	@Override
	public boolean adminBoardReply(ReplyVO rvo) {
		return mapper.adminBoardReply(rvo) == 1;
	}

	@Override
	public boolean adminBoardReplyUp(int bno) {
		return mapper.adminBoardReplyUp(bno) == 1;
	}

	@Override
	public BoardVO adminBoardInfon(int bno) {
		return mapper.adminBoardInfon(bno);
	}

	@Override
	public boolean adminReplyModi(ReplyVO rvo) {
		return mapper.adminReplyModi(rvo) == 1;
	}

	@Override
	public List<OrderVO> adminUnprocessedOrder() {
		return mapper.adminUnprocessedOrder();
	}

	@Override
	public List<OrderVO> adminUnprocessedCancle() {
		return mapper.adminUnprocessedCancle();
	}

	@Override
	public List<OrderVO> adminUnprocessedReturns() {
		return mapper.adminUnprocessedReturns();
	}

	@Override
	public List<BoardVO> adminUnprocessedReply() {
		return mapper.adminUnprocessedReply();
	}

	@Override
	public int adminProductCnt() {
		return mapper.adminProductCnt();
	}

	@Override
	public boolean adminOrderStatus(int bno) {
		return mapper.adminOrderStatus(bno) == 1;
	}

	@Override
	public int adminPopularProduct() {
		return mapper.adminPopularProduct();
	}

	@Override
	public int adminleastProduct() {
		return mapper.adminleastProduct();
	}

	@Override
	public int adminPopulaReview() {
		return mapper.adminPopulaReview();
	}

	@Override
	public int adminhighStar() {
		return mapper.adminhighStar();
	}

	@Override
	public ProductVO adminProductInfo(int prodNo) {
		return mapper.adminProductInfo(prodNo);
	}

	@Override
	public boolean adminProductModify(ProductVO pvo) {
		return mapper.adminProductModify(pvo) == 1;
	}

	@Override
	public boolean adminProductRemove(int prodNo) {
		return mapper.adminProductRemove(prodNo) == 1;
	}

	@Override
	public List<ReviewVO> adminReviewList(int prodNo) {
		return mapper.adminReviewList(prodNo);
	}

	@Override
	public int adminReviewStar(int prodNo) {
		return mapper.adminReviewStar(prodNo);
	}

	@Override
	public List<ChartVO> adminBarChart() {
		return mapper.adminBarChart();
	}

	@Override
	public List<ProductVO> adminOrderDetail(int ono) {
		return mapper.adminOrderDetail(ono);
	}
	@Override
	public OrderVO adminOrderInfo(String uid, int ono) {
		return mapper.adminOrderInfo(uid, ono);
	}
@Override
	public List<ChartVO> adminPieChart() {
		return mapper.adminPieChart();
	}
}
