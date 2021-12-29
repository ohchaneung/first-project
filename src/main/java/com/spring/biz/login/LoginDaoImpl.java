package com.spring.biz.login;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원가입
	@Override
	public void insert(LoginVo vo) {
		
		mybatis.insert("login-mapping.insert",vo);
	}

	// 회원수정
	@Override
	public void update(LoginVo vo) {
		
		mybatis.update("login-mapping.update",vo);
	}

	// 회원삭제
	@Override
	public void delete(LoginVo vo) {
		
		mybatis.delete("login-mapping.delete",vo);
	}

	// 회원 정보 상세 보기
	@Override
	public LoginVo getLogin(LoginVo vo) {
		
		return mybatis.selectOne("login-mapping.getLogin",vo);
	}

	// 회원 목록
	@Override
	public List<LoginVo> getLoginList(LoginVo vo) {
		
		return mybatis.selectList("login-mapping.getLoginList", vo);
	}

	// 로그인 검사
	@Override
	public LoginVo LoginCheck(LoginVo vo) {
		
		return mybatis.selectOne("login-mapping.LoginCheck", vo);
	}

	// 아이디 중복체크
	@Override
	public LoginVo idCheck(LoginVo vo) {
		
		return mybatis.selectOne("login-mapping.idCheck", vo);
	}

}
