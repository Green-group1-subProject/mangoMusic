package com.mango.board.model;

import java.sql.Timestamp;

public class BoardVO {
	private int bno;
	private int mno;	
	private String btitle;
	private String content;
	private int bcount;
	private Timestamp bdate;
	
	//댓글
	private int cNo; 
    private int m_mNo;
    private String cContent ;
    private String delFlag; 
    private int step; 
    private int m_bNo;
    private Timestamp cDate;
    private int recmdCount;
    
	public BoardVO(int bno, int mno, String btitle, String content, int bcount, Timestamp bdate, int cNo, int m_mNo,
			String cContent, String delFlag, int step, int m_bNo, Timestamp cDate, int recmdCount) {
		super();
		this.bno = bno;
		this.mno = mno;
		this.btitle = btitle;
		this.content = content;
		this.bcount = bcount;
		this.bdate = bdate;
		this.cNo = cNo;
		this.m_mNo = m_mNo;
		this.cContent = cContent;
		this.delFlag = delFlag;
		this.step = step;
		this.m_bNo = m_bNo;
		this.cDate = cDate;
		this.recmdCount = recmdCount;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public Timestamp getBdate() {
		return bdate;
	}

	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public int getM_mNo() {
		return m_mNo;
	}

	public void setM_mNo(int m_mNo) {
		this.m_mNo = m_mNo;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getM_bNo() {
		return m_bNo;
	}

	public void setM_bNo(int m_bNo) {
		this.m_bNo = m_bNo;
	}

	public Timestamp getcDate() {
		return cDate;
	}

	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}

	public int getRecmdCount() {
		return recmdCount;
	}

	public void setRecmdCount(int recmdCount) {
		this.recmdCount = recmdCount;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", mno=" + mno + ", btitle=" + btitle + ", content=" + content + ", bcount="
				+ bcount + ", bdate=" + bdate + ", cNo=" + cNo + ", m_mNo=" + m_mNo + ", cContent=" + cContent
				+ ", delFlag=" + delFlag + ", step=" + step + ", m_bNo=" + m_bNo + ", cDate=" + cDate + ", recmdCount="
				+ recmdCount + "]";
	}

	public BoardVO() {
		super();
	}
    
	
	
	
	
}
