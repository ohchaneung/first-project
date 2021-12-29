package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDao dao;
	
	// 상품 등록
	@Override
	public void insert(BoardVo vo) {
		
		dao.insert(vo);
	}

	// 상품 삭제
	@Override
	public void delete(BoardVo vo) {
		
		dao.delete(vo);
	}

	// 상품 수정
	@Override
	public void update(BoardVo vo) {
		
		dao.update(vo);
	}

	// 상품 상세보기
	@Override
	public BoardVo getBoard(BoardVo vo) {
		
		return dao.getBoard(vo);
	}

	// 상품 목록
	@Override
	public List<BoardVo> getBoardList(BoardVo vo) {
		
		return dao.getBoardList(vo);
	}

	// 토탈 카운트
	@Override
	public int boardTotalCount(BoardVo vo) {
		
		return dao.boardTotalCount(vo);
	}

	@Override
	public void Qupdate(BoardVo vo) {
		
		dao.Qupdate(vo);
	}

}
