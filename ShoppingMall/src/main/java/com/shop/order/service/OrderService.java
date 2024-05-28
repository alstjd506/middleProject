package com.shop.order.service;

import java.util.List;
import java.util.Map;

import com.shop.vo.CartVO;
import com.shop.vo.MemberVO;
import com.shop.vo.OrderDetailVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;

public interface OrderService {
	// 장바구니 관련
	List<Map<String, Object>> cartList(String userId);
	boolean removeCart(CartVO cvo);
	boolean editCart(CartVO cvo);
	boolean addCart(CartVO cvo);
	
	// 주문 관련
	Map<String, Object> getCart(String userId, int prodNo);
	ProductVO getProduct(int prodNo);
	MemberVO getUser(String userId);
	boolean addOrder(OrderVO ovo);
	int getOrderNo();
	boolean addOrderDetail(OrderDetailVO dvo);
}
