package com.spring.biz.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.review.ReviewService;
import com.spring.biz.review.ReviewVo;

@Controller
public class ReviewController {

	@Autowired
	ReviewService service;
	
	// 리뷰 작성
	@RequestMapping("/review_insert.do")
	public String review_insert(ReviewVo vo) {
		
		List<ReviewVo> li = service.getReviewList(vo);
		
		if(li.isEmpty()) {
			vo.setRef(0);
			vo.setRe_step(0);
			vo.setRe_level(0);
			
		} else {
			int refMax = service.refMax(vo);
			
			vo.setRef(refMax+1);
			vo.setRe_step(0);
			vo.setRe_level(0);
		}
		
		service.insert(vo);
		return "redirect:board_getBoard.do?pno=" + vo.getPno();
	}
	
	// 답글 작성
	@RequestMapping("/review_reinsert.do")
	public String review_reinsert(ReviewVo vo) {
		
		service.rs_update(vo);
		
		int re_step = vo.getRe_step();
		int re_nextStep =  re_step + 1;
		
		int re_level = vo.getRe_level();
		int re_nextLevel = re_level + 1;
		
		vo.setRe_step(re_nextStep);
		vo.setRe_level(re_nextLevel);
		
		service.insert(vo);
		return "redirect:board_getBoard.do?pno=" + vo.getPno();
	}
	
	// 리뷰 삭제
	@RequestMapping("/review_delete.do")
	public String review_delete(ReviewVo vo) {
		
		service.delete(vo);
		return "redirect:board_getBoard.do?pno=" + vo.getPno();
	}
	
	// 리뷰 수정
	@RequestMapping("/review_update.do")
	public String review_update(ReviewVo vo) {
		
		service.update(vo);
		return "redirect:board_getBoard.do?pno=" + vo.getPno();
	}
}
