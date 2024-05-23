package com.shop.order.service;

import java.util.List;
import java.util.Map;

import com.shop.vo.CartVO;

public interface OrderService {
	List<Map<String, Object>> cartList(String userId);
	boolean removeCart(CartVO cvo);
}
