package com.shop.order.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shop.vo.CartVO;
import com.shop.vo.MemberVO;

public interface OrderMapper {
	List<Map<String, Object>> selectCartList(String userId);
	Map<String, Object> selectCart(@Param("userId") String userId, @Param("prodNo") int prodNo);
	int deleteCart(CartVO cvo);
	int updateCart(CartVO cvo);
	int insertCart(CartVO cvo);
	MemberVO selectMember(String userId);
}