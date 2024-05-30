package com.shop.order.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.order.mapper.OrderMapper;
import com.shop.vo.CartVO;
import com.shop.vo.MemberVO;
import com.shop.vo.OrderDetailVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;

public class OrderServiceImpl implements OrderService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	
	@Override
	public List<Map<String, Object>> cartList(String userId) {
		return mapper.selectCartList(userId);
	}
	
	@Override
	public boolean removeCart(CartVO cvo) {
		return mapper.deleteCart(cvo) == 1;
	}

	@Override
	public boolean editCart(CartVO cvo) {
		return mapper.updateCart(cvo) == 1;
	}

	@Override
	public boolean addCart(CartVO cvo) {
		return mapper.insertCart(cvo) == 1;
	}

	@Override
	public Map<String, Object> getCart(String userId, int prodNo) {
		return mapper.selectCart(userId, prodNo);
	}
	
	@Override
	public ProductVO getProduct(int prodNo) {
		return mapper.selectProduct(prodNo);
	}
	
	@Override
	public MemberVO getUser(String userId) {
		return mapper.selectMember(userId);
	}

	@Override

	public boolean addOrder(OrderVO ovo) {
		return mapper.insertOrder(ovo) == 1;
	}

	@Override
	public int getOrderNo() {
		return mapper.selectOrderNo();
	}

	@Override
	public boolean addOrderDetail(OrderDetailVO dvo) {
		return mapper.insertOrderDetail(dvo) == 1;
	}
	
	@Override
	public boolean checkCart(CartVO cvo) {
		return mapper.checkCart(cvo) == 1;
	}

}
