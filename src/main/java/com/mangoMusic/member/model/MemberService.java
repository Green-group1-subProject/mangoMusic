package com.mangoMusic.member.model;

import java.sql.SQLException;

public class MemberService {
	//로그인 처리시 필요한 상수 
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2;//비번 불일치 
	public static final int USERID_NONE=3;//아이디 존재하지 않음
	
	private MemberDAO memberDao;
	
	public MemberService() {
		memberDao = new MemberDAO();
	}
	
	public int loginCheck(String id,String pwd ) throws SQLException {
		return memberDao.loginCheck(id, pwd);
	}
	
	public MemberVO selectById(String id)  throws SQLException {
		return memberDao.selectById(id);
	}
	
}
