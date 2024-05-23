package com.shop.order.mapper;

import java.util.List;
import java.util.Map;

import com.shop.vo.CartVO;

public interface OrderMapper {
	List<Map<String, Object>> selectCartList(String userId);
	int deleteCart(CartVO cvo);
}