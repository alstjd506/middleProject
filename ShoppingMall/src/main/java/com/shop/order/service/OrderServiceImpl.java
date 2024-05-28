package com.shop.order.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.order.mapper.OrderMapper;
import com.shop.vo.CartVO;
import com.shop.vo.MemberVO;

public class OrderServiceImpl implements OrderService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	
	@Override
	public List<Map<String, Object>> cartList(String userId) {
		return mapper.selectCartList(userId);
	}
	
	@Override
	public Map<String, Object> getCart(String userId, int prodNo) {
		return mapper.selectCart(userId, prodNo);
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
	public MemberVO getUser(String userId) {
		return mapper.selectMember(userId);
	}

	@Override
	public boolean checkCart(CartVO cvo) {
		// TODO Auto-generated method stub
		return mapper.checkCart(cvo)==1;
	}

}
