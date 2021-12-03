package com.mangoMusic.soundtrack.model;

public class SoundTrackVO {
	//음악
	private int sNo;
	private int alNo;
	private String title;
	private int arNo;
	private int geNo;
	private String lyrics;
	private int listenCount;
	//장르
	private String geName;
	//앨범
	private String alName;
	private int relDate;
	//아티스트
	private String arName;
	
	public SoundTrackVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SoundTrackVO(int sNo, int alNo, String title, int arNo, int geNo, String lyrics, int listenCount,
			String geName, String alName, int relDate, String arName) {
		super();
		this.sNo = sNo;
		this.alNo = alNo;
		this.title = title;
		this.arNo = arNo;
		this.geNo = geNo;
		this.lyrics = lyrics;
		this.listenCount = listenCount;
		this.geName = geName;
		this.alName = alName;
		this.relDate = relDate;
		this.arName = arName;
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public int getAlNo() {
		return alNo;
	}

	public void setAlNo(int alNo) {
		this.alNo = alNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getArNo() {
		return arNo;
	}

	public void setArNo(int arNo) {
		this.arNo = arNo;
	}

	public int getGeNo() {
		return geNo;
	}

	public void setGeNo(int geNo) {
		this.geNo = geNo;
	}

	public String getLyrics() {
		return lyrics;
	}

	public void setLyrics(String lyrics) {
		this.lyrics = lyrics;
	}

	public int getListenCount() {
		return listenCount;
	}

	public void setListenCount(int listenCount) {
		this.listenCount = listenCount;
	}

	public String getGeName() {
		return geName;
	}

	public void setGeName(String geName) {
		this.geName = geName;
	}

	public String getAlName() {
		return alName;
	}

	public void setAlName(String alName) {
		this.alName = alName;
	}

	public int getRelDate() {
		return relDate;
	}

	public void setRelDate(int relDate) {
		this.relDate = relDate;
	}

	public String getArName() {
		return arName;
	}

	public void setArName(String arName) {
		this.arName = arName;
	}

	@Override
	public String toString() {
		return "SoundTrackVO [sNo=" + sNo + ", alNo=" + alNo + ", title=" + title + ", arNo=" + arNo + ", geNo=" + geNo
				+ ", lyrics=" + lyrics + ", listenCount=" + listenCount + ", geName=" + geName + ", alName=" + alName
				+ ", relDate=" + relDate + ", arName=" + arName + "]";
	}
	
	
}
