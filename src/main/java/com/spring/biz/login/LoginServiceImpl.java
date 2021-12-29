package com.spring.biz.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	LoginDao dao;
	
	// 회원등록
	@Override
	public void insert(LoginVo vo) {
		
		dao.insert(vo);
	}

	// 회원수정
	@Override
	public void update(LoginVo vo) {
		
		dao.update(vo);
	}

	// 회원삭제
	@Override
	public void delete(LoginVo vo) {
		
		dao.delete(vo);
	}

	// 회원 정보 상세 보기
	@Override
	public LoginVo getLogin(LoginVo vo) {
		
		return dao.getLogin(vo);
	}

	// 회원 목록
	@Override
	public List<LoginVo> getLoginList(LoginVo vo) {
		
		return dao.getLoginList(vo);
	}

	// 로그인 검사
	@Override
	public LoginVo LoginCheck(LoginVo vo) {
		
		return dao.LoginCheck(vo);
	}

	// 아이디 중복체크
	@Override
	public LoginVo idCheck(LoginVo vo) {
		
		return dao.idCheck(vo);
	}

}
