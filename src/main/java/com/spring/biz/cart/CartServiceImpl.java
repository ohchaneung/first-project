package com.spring.biz.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	CartDao dao;
	
	// 장바구니 추가
	@Override
	public void insert(CartVo vo) {
		
		dao.insert(vo);
	}

	// 장바구니 삭제
	@Override
	public void delete(CartVo vo) {
		
		dao.delete(vo);
	}

	// 장바구니 수정
	@Override
	public void update(CartVo vo) {
		
		dao.update(vo);
	}

	// 장바구니 목록보기
	@Override
	public List<CartVo> getCartList(CartVo vo) {
		
		return dao.getCartList(vo);
	}

}
