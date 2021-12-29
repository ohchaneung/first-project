package com.spring.biz.login;

import java.util.List;

public interface LoginService {

	public void insert(LoginVo vo); // 회원가입
	public void update(LoginVo vo); // 회원수정
	public void delete(LoginVo vo); // 회원삭제
	public LoginVo getLogin(LoginVo vo); // 회원상세정보
	public List<LoginVo> getLoginList(LoginVo vo); // 회원목록
	
	public LoginVo LoginCheck(LoginVo vo); // 로그인 확인
	public LoginVo idCheck(LoginVo vo); // 아이디 중복체크
}
