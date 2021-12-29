package com.spring.biz.review;

import java.util.List;

public interface ReviewDao {

	public void delete(ReviewVo vo); // 리뷰 삭제
	public void insert(ReviewVo vo); // 상품별 리뷰 작성
	public void update(ReviewVo vo); // 리뷰 수정
	public List<ReviewVo> getReviewList(ReviewVo vo); // 상품별 리뷰 목록
	
	public int refMax(ReviewVo vo); // ref 최댓값 불러오기
	public void rs_update(ReviewVo vo); // 답글시 re_step 수정
}
