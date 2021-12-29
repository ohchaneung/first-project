package com.spring.biz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVo;
import com.spring.biz.cart.CartService;
import com.spring.biz.cart.CartVo;

@Controller
public class CartController {
	
	@Autowired
	CartService service;
	
	@Autowired
	BoardService bservice;
	
	// 장바구니 추가 + 장바구니에 담을 시 상품 갯수 변경
	@RequestMapping("/cart_insert.do")
	public String cart_insert(CartVo vo, BoardVo vo2) {
		
		// 장바구니 추가
		int totalprice = vo.getPrice() * vo.getQuantity();
		vo.setTotalprice(totalprice);
		service.insert(vo);
		
		//장바구니에 담을 시 상품 갯수 변경
		vo2.setPno(vo.getPno());
		BoardVo b = bservice.getBoard(vo2);
		int Q = b.getQuantity() - vo.getQuantity();
		vo2.setQuantity(Q);
		bservice.Qupdate(vo2);
		
		return "redirect:cart_getCartList.do?custno=" + vo.getCustno();
	}
	
	// 장바구니 추가
	@RequestMapping("/cart_getCartList.do")
	public String cart_getCartList(CartVo vo, Model model) {

		model.addAttribute("cartList", service.getCartList(vo));
		return "/cart/getCartList.jsp";
	}
	
	// 장바구니 삭제
	@RequestMapping("/cart_delete.do")
	public String cart_delete(CartVo vo) {

		service.delete(vo);
		
		return "redirect:cart_getCartList.do?custno=" + vo.getCustno();
	}
	
	// 장바구니 수정
	@RequestMapping("/cart_update.do")
	public String cart_update(CartVo vo) {

		int totalprice = vo.getPrice() * vo.getQuantity();
		vo.setTotalprice(totalprice);
		
		service.update(vo);
		
		return "redirect:cart_getCartList.do?custno=" + vo.getCustno();
	}

}
