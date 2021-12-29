package com.spring.biz.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardDaoImpl implements BoardDao{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 상품 등록
	@Override
	public void insert(BoardVo vo) {
		
		mybatis.insert("board-mapping.insert",vo);
	}

	// 상품 삭제
	@Override
	public void delete(BoardVo vo) {
		
		mybatis.delete("board-mapping.delete",vo);
	}

	// 상품 수정
	@Override
	public void update(BoardVo vo) {
		
		mybatis.update("board-mapping.update",vo);
	}

	// 상품 상세보기
	@Override
	public BoardVo getBoard(BoardVo vo) {
		
		return mybatis.selectOne("board-mapping.getBoard", vo);
	}

	// 상품 목록
	@Override
	public List<BoardVo> getBoardList(BoardVo vo) {
		
		return mybatis.selectList("board-mapping.getBoardList", vo);
	}

	// 토탈 카운트
	@Override
	public int boardTotalCount(BoardVo vo) {
		
		return mybatis.selectOne("board-mapping.boardTotalCount", vo);
	}

	@Override
	public void Qupdate(BoardVo vo) {
		
		mybatis.update("board-mapping.Qupdate", vo);
	}

}
