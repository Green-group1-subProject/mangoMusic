package com.mangoMusic.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.mangoMusic.db.ConnectionPoolMgr;

public class MemberDAO {
	private ConnectionPoolMgr pool;

	public MemberDAO() {
		pool = new ConnectionPoolMgr();
	}

	// 로그인 체크 !
	public int loginCheck(String id, String pwd) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int result = 0;
		try {
			con = pool.getConnection();
			String sql = "select pwd from mango_member" + " where id =? and outdate is null";
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();

			if (rs.next()) {
				String dbPwd = rs.getString(1);
				if (pwd.equals(dbPwd)) {
					result = MemberService.LOGIN_OK;
				} else {
					result = MemberService.DISAGREE_PWD;
				}
			} else {
				result = MemberService.USERID_NONE;
			}

			System.out.println("로그인 처리 결과 result=" + result + ", 매개변수 userid=" + id + ", pwd=" + pwd);

			return result;
		} finally {
			pool.dbClose(rs, ps, con);
		}

	}

	public MemberVO selectById(String id)  throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		MemberVO vo = new MemberVO();
		try {
			con = pool.getConnection();
			
			String sql = "select*from mango_member where id =?";
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				
				String pwd = rs.getString("pwd");
				int Mno = rs.getInt("Mno");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				Timestamp regdate = rs.getTimestamp("regdate");
				Timestamp outdate = rs.getTimestamp("outdate");
				String membership = rs.getString("membership");
				int playCount = rs.getInt("playCount");
				
				vo.setPwd(pwd);
				vo.setmNo(Mno);
				vo.setName(name);
				vo.setEmail(email);
				vo.setTel(tel);
				vo.setRegdate(regdate);
				vo.setOutdate(outdate);
				vo.setMembership(membership);
				vo.setPlayCount(playCount);
				
			}
			System.out.println("회원조회 결과 vo="+ vo+", 매개변수 id="+id);
		
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
		
		
		
	}

}
