package com.spring.biz.board;

import java.util.List;

public interface BoardService {

	public void insert(BoardVo vo); // 상품등록
	public void delete(BoardVo vo); // 상품삭제
	public void update(BoardVo vo); // 상품수정
	public BoardVo getBoard(BoardVo vo); // 상품 상세보기
	public List<BoardVo> getBoardList(BoardVo vo); // 상품목록
	
	public int boardTotalCount(BoardVo vo); // 토탈 카운트
	public void Qupdate(BoardVo vo); // 장바구니에 담을 시 갯수 변경
}
