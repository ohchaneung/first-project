package com.spring.biz.cart;

import java.util.List;

public interface CartDao {

	public void insert(CartVo vo); // 장바구니 추가
	public void delete(CartVo vo); // 장바구니 삭제
	public void update(CartVo vo); // 장바구니 수정
	public List<CartVo> getCartList(CartVo vo); // 장바구니 목록보기
	
}
