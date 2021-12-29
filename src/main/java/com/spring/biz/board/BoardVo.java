package com.spring.biz.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class BoardVo {

	// 페이지 나누기
	private int rownum;
	private int rnum;
	private int totalCount;
	private  int  startIdx;
	private  int  totalPage;
	private  int  nowPage;
	
	// 검색
	private  String ch1;
	private  String ch2;
	
	private int pno;
	private String pname;
	private int price;
	private int quantity;
	private String grade;
	private MultipartFile updateFile;
	private String img;
	private Date udate;
	
	public String getCh1() {
		return ch1;
	}
	public void setCh1(String ch1) {
		this.ch1 = ch1;
	}
	public String getCh2() {
		return ch2;
	}
	public void setCh2(String ch2) {
		this.ch2 = ch2;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getStartIdx() {
		return startIdx;
	}
	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public MultipartFile getUpdateFile() {
		return updateFile;
	}
	public void setUpdateFile(MultipartFile updateFile) {
		this.updateFile = updateFile;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getUdate() {
		return udate;
	}
	public void setUdate(Date udate) {
		this.udate = udate;
	}
	@Override
	public String toString() {
		return "BoardVo [pno=" + pno + ", pname=" + pname + ", price=" + price + ", quantity=" + quantity + ", grade="
				+ grade + ", updateFile=" + updateFile + ", img=" + img + ", udate=" + udate + "]";
	}
}
