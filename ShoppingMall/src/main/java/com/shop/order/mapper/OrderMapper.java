package com.shop.order.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.CartVO;
import com.shop.vo.MemberVO;
import com.shop.vo.OrderDetailVO;
import com.shop.vo.OrderVO;
import com.shop.vo.ProductVO;

public interface OrderMapper {
	// 장바구니 관련
	List<Map<String, Object>> selectCartList(String userId);
	int deleteCart(CartVO cvo);
	int updateCart(CartVO cvo);
	int insertCart(CartVO cvo);
	
	// 주문 관련
	Map<String, Object> selectCart(@Param("userId") String userId, @Param("prodNo") int prodNo);
	ProductVO selectProduct(int prodNo);
	MemberVO selectMember(String userId);

	int insertOrder(OrderVO ovo);
	int selectOrderNo();
	int insertOrderDetail(OrderDetailVO dvo);

	int checkCart(CartVO cvo);

	
}