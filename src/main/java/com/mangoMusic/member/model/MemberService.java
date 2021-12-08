package com.mangoMusic.member.model;

import java.sql.SQLException;
import java.util.List;

public class MemberService {
	//로그인 처리시 필요한 상수 
	public static final int LOGIN_OK=1; //로그인 성공
	public static final int DISAGREE_PWD=2;//비번 불일치 
	public static final int USERID_NONE=3;//아이디 존재하지 않음
	
	//회원가입 아이디 중복체크
	public static final int NON_EXIST_ID=1;//아이디 존재하지 않음
	public static final int EXIST_ID=2;//아이디 존재
	
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
	
	public List<MemberVO> selectAll() throws SQLException{
		return memberDao.selectAll();
	}
	
	public MemberVO selectByNo(int mno) throws SQLException{
		return memberDao.selectByNo(mno);
	}
	
	public int insertMem(MemberVO vo) throws SQLException{
		return memberDao.insertMem(vo);
	}
	
	public int updateMem(MemberVO vo) throws SQLException{
		return memberDao.updateMem(vo);
	}
	
	public int deleteMem(String id, String pwd) throws SQLException{
		int check=memberDao.loginCheck(id, pwd);
		int result=0;
		if(check==1) {
			result=memberDao.deleteMem(id);
		}
		return result;
	}
	
	public int getMembership(MemberVO vo) throws SQLException {
		return memberDao.getMembership(vo);
	}
	
	public int checkId(String id) throws SQLException {
		return memberDao.checkId(id);
	}

}
