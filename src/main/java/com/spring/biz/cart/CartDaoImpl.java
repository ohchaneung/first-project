package com.spring.biz.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CartDaoImpl implements CartDao{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 장바구니 추가
	@Override
	public void insert(CartVo vo) {
		
		mybatis.insert("cart-mapping.insert", vo);
	}

	// 장바구니 삭제
	@Override
	public void delete(CartVo vo) {
		
		mybatis.delete("cart-mapping.delete", vo);
	}

	// 장바구니 수정
	@Override
	public void update(CartVo vo) {
		
		mybatis.update("cart-mapping.update", vo);
	}

	// 장바구니 목록보기
	@Override
	public List<CartVo> getCartList(CartVo vo) {
		
		return mybatis.selectList("cart-mapping.getCartList", vo);
	}

}
