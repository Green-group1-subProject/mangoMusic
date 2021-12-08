package com.mangoMusic.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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

			String sql = "select * from mango_member where id =?";
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
	
	//동한추가
	public List<MemberVO> selectAll() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<MemberVO> list=new ArrayList<MemberVO>();
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
				Timestamp outdate=rs.getTimestamp("outdate");

				MemberVO vo=new MemberVO(mNo, id, pwd, name, email, membership, tel, regdate, playCount, outdate);
				list.add(vo);
			}

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public MemberVO selectByNo(int mno) throws SQLException{
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

			MemberVO vo=null;
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
				Timestamp outdate=rs.getTimestamp("outdate");

				vo=new MemberVO(mNo, id, pwd, name, email, membership, tel, regdate, playCount, outdate);
			}

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int checkId(String id) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		int result=0;
		try {
			//1,2
			con=pool.getConnection();
			
			//3
			String sql="select count(*) from mango_member"
					+ " where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);
			
			//4
			rs=ps.executeQuery();
			if(rs.next()) {
				int count=rs.getInt(1);
				if(count > 0) {  //이미 존재-사용불가
					result=MemberService.EXIST_ID;
				}else {  //존재하지 않음-사용가능
					result=MemberService.NON_EXIST_ID;
				}
			}
			
			System.out.println("아이디 중복확인 결과 result="+result
					+", 매개변수 userid="+id);
			return result;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public int insertMem(MemberVO vo) throws SQLException{
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

	public int updateMem(MemberVO vo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();

			String sql="update mango_member "
					+ " set pwd=?, email=?, tel=?"
					+ " where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getPwd());
			ps.setString(2, vo.getEmail());
			ps.setString(3, vo.getTel());
			ps.setString(4, vo.getId());

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

	public int deleteMem(String id) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();

			String sql="update mango_member "
					+ " set outdate=sysdate"
					+ " where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, id);

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
	
	public int getMembership(MemberVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		try {
			con=pool.getConnection();

			String sql="update mango_member "
					+ " set membership=? "
					+ " where id=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getMembership());
			ps.setString(2, vo.getId());

			int cnt=ps.executeUpdate();

			//디버깅
			/*	if(cnt>0) {
					System.out.println("멤버십 겟 성공");
				}else {
					System.out.println("멤버십 겟 실패");
				} 	*/

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}
	
	

}
