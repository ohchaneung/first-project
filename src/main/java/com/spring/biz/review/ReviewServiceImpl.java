package com.spring.biz.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewDao dao;
	
	// 리뷰 삭제
	@Override
	public void delete(ReviewVo vo) {
		
		dao.delete(vo);
	}

	// 상품별 리뷰 등록
	@Override
	public void insert(ReviewVo vo) {
		
		dao.insert(vo);
	}

	// 리뷰 수정
	@Override
	public void update(ReviewVo vo) {
		
		dao.update(vo);
	}

	// 상품별 리뷰 목록
	@Override
	public List<ReviewVo> getReviewList(ReviewVo vo) {
		
		return dao.getReviewList(vo);
	}

	// ref 최댓값 불러오기
	@Override
	public int refMax(ReviewVo vo) {
		
		return dao.refMax(vo);
	}

	// 답글시 re_step 수정
	@Override
	public void rs_update(ReviewVo vo) {
		
		dao.rs_update(vo);
	}

}
