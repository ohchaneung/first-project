package com.spring.biz.controller;

import java.io.PrintWriter;
import java.security.MessageDigest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.biz.login.LoginService;
import com.spring.biz.login.LoginVo;

@Controller
public class LoginController {

	@Autowired
	LoginService service;
	
	// 암호화 메소드
	public static String testSHA256(String pwd) {
		try{

			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] hash = digest.digest(pwd.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);
				if(hex.length() == 1) hexString.append('0');
				hexString.append(hex);
			}

			//출력
			return hexString.toString();
			
		} catch(Exception ex){
			throw new RuntimeException(ex);
		}
	}
	
	// 로그인 화면으로 이동
	@RequestMapping("/login.do")
	public String login() {
		
		return "/login/login.jsp";
	}
	
	// 회원가입 화면으로 이동
	@RequestMapping("/login_insertm.do")
	public String insert() {
		
		return "/login/insert.jsp";
	}
	
	// 회원가입
	@RequestMapping("/login_insert.do")
	public void login_insert(LoginVo vo, HttpServletResponse response) throws Exception {
		
		String pwd2 = testSHA256(vo.getPwd1());
		vo.setPwd2(pwd2);
		vo.setRole("Guest");
		service.insert(vo);
		
		PrintWriter out = response.getWriter();
		out.println("success");
	}

	// 아이디 중복체크
	@RequestMapping("/login_idCheck.do")
	public void idCheck(LoginVo vo, HttpServletResponse response) throws Exception {
		
		vo = service.idCheck(vo);
		int flag = 0;
		PrintWriter out = response.getWriter();
		
		if (vo != null) {
			flag = 1;
			out.println(flag);
		} else {
			flag = 2;
			out.println(flag);
		}
	}
	
	// 로그인 기능
	@RequestMapping("/login_LoginCheck.do")
	public void LoginCheck(LoginVo vo, HttpServletResponse response, HttpSession  session) throws Exception {
		
		String pwd2 = testSHA256(vo.getPwd1());
		vo.setPwd2(pwd2);
		vo = service.LoginCheck(vo);
		int flag = 0;
		PrintWriter out = response.getWriter();
		
		if (vo != null) {
			session.setAttribute("member_custno", vo.getCustno());
			session.setAttribute("member_id", vo.getId());
			session.setAttribute("member_name", vo.getName());
			session.setAttribute("member_role", vo.getRole());
			flag = 1;
			out.println(flag);
		} else {
			flag = 2;
			out.println(flag);
		}
	}
	
	// 회원목록
	@RequestMapping("/login_getLoginList.do")
	public String getLoginList(LoginVo vo, Model model) {
		
		model.addAttribute("li", service.getLoginList(vo));
		return "/login/getLoginList.jsp";
	}
	
	// 로그아웃 기능
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		
		request.getSession().invalidate();
		request.getSession(true);
		return "/index.jsp";
	}
	
	// 회원삭제
	@RequestMapping("/login_delete.do")
	public void login_delete(LoginVo vo, HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.getSession().invalidate();
		request.getSession(true);
		service.delete(vo);
		
		PrintWriter out = response.getWriter();
		out.println("success");
	}
	
	// 회원상세정보
	@RequestMapping("/login_getLogin.do")
	public String login_getLogin(LoginVo vo, Model model) {

		model.addAttribute("getLogin", service.getLogin(vo));
		return "/login/getLogin.jsp";
	}
	
	// 회원수정
	@RequestMapping("/login_update.do")
	public void login_update(LoginVo vo, HttpServletResponse response, HttpSession  session, HttpServletRequest request) throws Exception {

		String pwd2 = testSHA256(vo.getPwd1());
		vo.setPwd2(pwd2);
		service.update(vo);
		
		session.setAttribute("member_name", vo.getName());
		PrintWriter out = response.getWriter();
		out.println("success");
	}
}
