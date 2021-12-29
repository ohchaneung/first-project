package com.spring.biz.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.spring.biz.board.BoardService;
import com.spring.biz.board.BoardVo;
import com.spring.biz.review.ReviewService;
import com.spring.biz.review.ReviewVo;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@Autowired
	ReviewService reviewService;

	private String boardPath = "";
	
	// 상품등록 화면으로
	@RequestMapping("/board_insertm.do")
	public String insert() {
		
		return "/board/insert.jsp";
	}

	// 상품등록
	@RequestMapping("/board_insert.do")
	public String board_insert(BoardVo vo, HttpServletRequest request) throws Exception {
		
		boardPath = request.getSession().getServletContext().getRealPath("/board/files/");
		
		System.out.println(boardPath);
		
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("HHmmss");

		String time1 = dayTime.format(time);
		String onlyFilename = "";
		String extension = "";

		MultipartFile uploadFile = vo.getUpdateFile();
		String fileName = uploadFile.getOriginalFilename();
		File f = new File(boardPath + fileName);

		if (!uploadFile.isEmpty()) {
			if (f.exists()) {
		
				onlyFilename = fileName.substring(0, fileName.indexOf("."));

				extension = fileName.substring(fileName.indexOf("."));

				fileName = onlyFilename + "_" + time1 + extension;
				uploadFile.transferTo(new File(boardPath + fileName));

			} else {
				uploadFile.transferTo(new File(boardPath + fileName));
			}

		}

		vo.setImg(fileName);
		service.insert(vo);

		return "redirect:board_getBoardList.do";
	}

	// 상품목록
	@RequestMapping("board_getBoardList.do")
	public String board_getBoardList(BoardVo vo, Model model) throws Exception {
		
		int pageSize = 6;
		int pageListSize = 6;
		
		model.addAttribute("boardTotalCount", service.boardTotalCount(vo));
		
		if (vo.getStartIdx() == 0) {
			vo.setStartIdx(1);
			
		}else {
			vo.setStartIdx(vo.getStartIdx());	
		}
		
		int  tc = service.boardTotalCount(vo);
		int totalPage= (int) Math.ceil(tc/6.0);
		int nowPage = (vo.getStartIdx() / 6 ) + 1 ;
		
		int endPage = (totalPage - 1) * 6 + 1 ;
		
		int listStratPage =  (nowPage-1)/ pageListSize * pageListSize + 1 ;
		int listEndPage = listStratPage + pageListSize -1 ;
	  	
		model.addAttribute("listStratPage",listStratPage );
		model.addAttribute("listEndPage",listEndPage );
		model.addAttribute("pageSize",pageSize );
		model.addAttribute("pageListSize",pageListSize );
		
		model.addAttribute("totalPage",totalPage );
		model.addAttribute("nowPage",nowPage );
		model.addAttribute("endPage", endPage);
		
		model.addAttribute("ch1", vo.getCh1());
		
		if (vo.getCh2() != null) {
			String ch2 = vo.getCh2();
			String Kch2 = java.net.URLEncoder.encode(ch2,"utf-8");
			model.addAttribute("ch2", Kch2);
		} else {
			model.addAttribute("ch2", vo.getCh2());
		}
		
		model.addAttribute("startIdx",vo.getStartIdx() );
		
		model.addAttribute("li", service.getBoardList(vo));
		return "/board/getBoardList.jsp";
	}
	
	// 상품 상세보기 + 상품별 리뷰 목록
	@RequestMapping("board_getBoard.do")
	public String board_getBoard(BoardVo vo, ReviewVo vo2, Model model, HttpServletRequest request) {
		
		int pno = vo.getPno();
		vo2.setPno(pno);
		
		model.addAttribute("getReviewList", reviewService.getReviewList(vo2));
		model.addAttribute("getBoard", service.getBoard(vo));
		return "/board/getBoard.jsp";
	}
	
	// 상품 삭제
	@RequestMapping("board_delete.do")
	public void board_delete(BoardVo vo, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boardPath = request.getSession().getServletContext().getRealPath("/board/files/");
		
		System.out.println(boardPath);
		
		BoardVo str=service.getBoard(vo);
		String fileName=str.getImg();
        String delFile = boardPath + fileName ;
		File f=new File(delFile);
		f.delete();
		
		service.delete(vo);
		
		PrintWriter out = response.getWriter();
		out.println("success");
	}
	
	// 상품수정
	@RequestMapping("/board_update.do")
	public String board_update(BoardVo vo, HttpServletRequest request) throws Exception {

		boardPath = request.getSession().getServletContext().getRealPath("/board/files/");
		
		//System.out.println(boardPath);
		
		MultipartFile uploadFile = vo.getUpdateFile();
		String fileName = uploadFile.getOriginalFilename();
		
		if (fileName == "") {
			BoardVo vo2 = service.getBoard(vo);
			String oldImg = vo2.getImg();
			vo.setImg(oldImg);
			service.update(vo);
			
		} else {
			BoardVo vo2 = service.getBoard(vo);
			String oldImg = vo2.getImg();
	        String delFileName = boardPath + oldImg ;
			File delFile = new File(delFileName);
			delFile.delete();
			
			long time = System.currentTimeMillis();
			SimpleDateFormat dayTime = new SimpleDateFormat("HHmmss");

			String time1 = dayTime.format(time);
			String onlyFilename = "";
			String extension = "";
			
			File f = new File(boardPath + fileName);
			
			if (f.exists()) {
				
				onlyFilename = fileName.substring(0, fileName.indexOf("."));

				extension = fileName.substring(fileName.indexOf("."));

				fileName = onlyFilename + "_" + time1 + extension;
				uploadFile.transferTo(new File(boardPath + fileName));

			} else {
				uploadFile.transferTo(new File(boardPath + fileName));
			}
			
			vo.setImg(fileName);
			service.update(vo);
		}

		return "redirect:board_getBoardList.do";
	}
}