package com.spring.biz.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReviewDaoImpl implements ReviewDao{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 리뷰 삭제
	@Override
	public void delete(ReviewVo vo) {
		
		mybatis.delete("review-mapping.delete", vo);
	}

	// 상품별 리뷰 등록
	@Override
	public void insert(ReviewVo vo) {
		
		mybatis.insert("review-mapping.insert", vo);
	}

	// 리뷰 수정
	@Override
	public void update(ReviewVo vo) {
		
		mybatis.update("review-mapping.update", vo);
	}

	// 상품별 리뷰 목록
	@Override
	public List<ReviewVo> getReviewList(ReviewVo vo) {
		
		return mybatis.selectList("review-mapping.getReviewList", vo);
	}

	// ref 최댓값 불러오기
	@Override
	public int refMax(ReviewVo vo) {
		
		return mybatis.selectOne("review-mapping.refMax", vo);
	}

	// 답글시 re_step 수정
	@Override
	public void rs_update(ReviewVo vo) {
		
		mybatis.update("review-mapping.rs_update", vo);
	}

}
