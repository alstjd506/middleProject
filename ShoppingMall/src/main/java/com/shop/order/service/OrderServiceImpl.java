package com.shop.order.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.shop.common.DataSource;
import com.shop.order.mapper.OrderMapper;
import com.shop.vo.CartVO;

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

}
