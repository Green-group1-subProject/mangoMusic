package com.myPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.db.ConnectionPoolMgr;

public class MyPageDAO {
	ConnectionPoolMgr pool=null;
	
	public MyPageDAO(){
		pool=new ConnectionPoolMgr();
	}
	
	public List<MyPageVO> selectAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<MyPageVO> list=new ArrayList<MyPageVO>();
		try {
			con=pool.getConnection();
			
			String sql="select * from mango_member"
					+ " order by no desc";
			
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int mNo=rs.getInt("mNo");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String membership=rs.getString("membership");
				String tel=rs.getString("tel");
				Timestamp regdate=rs.getTimestamp("regdate");
				int playCount=rs.getInt("playcount");
				
				MyPageVO vo=new MyPageVO(mNo, id, pwd, name, email, membership, tel, regdate, playCount);
				list.add(vo);
			}
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public MyPageVO selectByNo(int mno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=pool.getConnection();
			
			String sql="select * from mango_member"
					+ "	where mno=?"
					+ " order by no desc";
			ps=con.prepareStatement(sql);
			ps.setInt(1, mno);
			
			MyPageVO vo=null;
			rs=ps.executeQuery();
			if(rs.next()) {
				int mNo=rs.getInt("mNo");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String membership=rs.getString("membership");
				String tel=rs.getString("tel");
				Timestamp regdate=rs.getTimestamp("regdate");
				int playCount=rs.getInt("playcount");
				
				vo=new MyPageVO(mNo, id, pwd, name, email, membership, tel, regdate, playCount);
			}
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertMem(MyPageVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			
			String sql="insert into mango_member(mNo, id, pwd, name, email, tel)\r\n"
					+ " values(mango_member_seq.nextval, ?, ?, ?, ?, ?)";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getTel());
			
			int cnt=ps.executeUpdate();
			
			//디버깅
		/*	if(cnt>0) {
				System.out.println("DAO 등록 성공");
			}else {
				System.out.println("DAO 등록 실패");
			} 	*/
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int updateMem(MyPageVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			
			String sql="update mango_member "
					+ " set id=?, pwd=?, name=?, email=?, tel=?"
					+ " where mno=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPwd());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getEmail());
			ps.setString(5, vo.getTel());
			ps.setInt(6, vo.getmNo());
			
			int cnt=ps.executeUpdate();
			
			//디버깅
			/*	if(cnt>0) {
				System.out.println("DAO 수정 성공");
			}else {
				System.out.println("DAO 수정 실패");
			} 	*/
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	public int deleteMem(int mno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();
			
			String sql="delete from mango_member "
					+ " where mno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, mno);
			
			int cnt=ps.executeUpdate();
			
			//디버깅
			/*	if(cnt>0) {
				System.out.println("DAO 삭제 성공");
			}else {
				System.out.println("DAO 삭제 실패");
			} 	*/
			
			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	
}
