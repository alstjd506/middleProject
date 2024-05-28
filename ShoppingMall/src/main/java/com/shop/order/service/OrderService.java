package com.shop.order.service;

import java.util.List;
import java.util.Map;

import com.shop.vo.CartVO;
import com.shop.vo.MemberVO;

public interface OrderService {
	List<Map<String, Object>> cartList(String userId);
	Map<String, Object> getCart(String userId, int prodNo);
	boolean removeCart(CartVO cvo);
	boolean editCart(CartVO cvo);
	boolean addCart(CartVO cvo);
	MemberVO getUser(String userId);
	boolean checkCart(CartVO cvo);
}
