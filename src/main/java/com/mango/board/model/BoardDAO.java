package com.mango.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mangoMusic.db.ConnectionPoolMgr2;


public class BoardDAO {
	private ConnectionPoolMgr2 pool;

	public BoardDAO() {
		pool=new ConnectionPoolMgr2();
	}

	/**
	 * 글등록 메서드
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	public int insertBoard(BoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql= "insert into Mango_board(bNO,mno,btitle,content,bcount,bdate)"
					+ "values(Mango_board_seq.nextval,?,?,?,Mango_board_seq.nextval,sysdate)";
			ps=con.prepareStatement(sql);
			
			/*
			 * ps.setInt(1, vo.getBno()); ps.setInt(2, vo.getMno());
			 */
			ps.setInt(1, vo.getMno());
			ps.setString(2, vo.getBtitle());
			ps.setString(3, vo.getContent());

			//4
			int cnt=ps.executeUpdate();
			System.out.println("글쓰기 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	/**
	 * 글 목록 메서드
	 * @return
	 * @throws SQLException
	 */
	public List<BoardVO> selectAll(String condition, String keyword) 
			throws SQLException {
		/*
		select * from board
		where title like '%안녕%';
		select * from board
		where name like '%길동%';
		select * from board
		where content like '%내용%';
		 */

		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<BoardVO> list=new ArrayList<BoardVO>();
		try {
			//1,2 con
			con=pool.getConnection();

			//3 ps
			String sql="select * from mango_board";
			
			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우				
				sql+= "	where " + condition +" like '%' || ? || '%'";
			}
			sql += " order by bno desc";			
			ps=con.prepareStatement(sql);

			if(keyword!=null && !keyword.isEmpty()) {  //검색의 경우	
				ps.setString(1, keyword);
			}

			//4 exec
			rs=ps.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String btitle = rs.getString("btitle");
				String content = rs.getString("content");
				Timestamp bdate = rs.getTimestamp("bdate");
				int bcount = rs.getInt("bcount");
				int mno = rs.getInt("mno");
				BoardVO vo= new BoardVO();
				
				vo.setBcount(bcount);
				vo.setBno(bno);
				vo.setBtitle(btitle);
				vo.setcContent(content);
				vo.setBdate(bdate);
				vo.setMno(mno);



				list.add(vo);
			}
			System.out.println("글목록 결과 list.size="+list.size()
			+", keyword="+keyword+", condition="+condition);

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	/**
	 * 글 상세보기 메서드-번호로 조회
	 */
	public BoardVO selectByNo(int bno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		BoardVO vo= new BoardVO();

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="select * from mango_board where bno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, bno);

			//4
			rs=ps.executeQuery(); 
			if(rs.next()) 
			{ 
				int mno=rs.getInt("mno"); 
				String btitle=rs.getString("btitle");
				String content=rs.getString("content"); 
				int bcount=rs.getInt("bcount"); 
				Timestamp bdate=rs.getTimestamp("bdate");

				vo.setContent(content);
				vo.setBno(bno); 
				vo.setMno(mno); 
				vo.setBtitle(btitle);
				vo.setBcount(bcount); 
				vo.setBdate(bdate);
			}
			System.out.println("상세보기 결과 vo="+vo+", 매개변수 bno="+bno);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int updateBoard(BoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="update mango_board"
					+ " set  btitle=?, content=?"
					+ " where mno=? ";

			ps=con.prepareStatement(sql);
			ps.setString(1, vo.getBtitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getMno());


			//4
			int cnt=ps.executeUpdate();
			System.out.println("글 수정 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int deleteBoard(BoardVO vo) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			//1,2
			con=pool.getConnection();

			//3
			String sql="DELETE FROM mango_board "
					+ "WHERE bno =?";
			ps=con.prepareCall(sql);
			ps.setInt(1, vo.getBno());

			//4
			int cnt=ps.executeUpdate();
			System.out.println("글 삭제 결과 cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}

	public int updateReadCount(int bno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		try {
			con=pool.getConnection();

			String sql="update mango_board set bCount=bCount+1"					
					+ " where bno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, bno);

			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 bno="+bno);

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}


  public List<BoardVO> selectMainNotice() throws SQLException { 
		/*select no,title
		from
		(
		    select no,title from board order by no desc
		)
		where rownum<=6*/
	  
	  Connection con=null;
	  PreparedStatement ps=null;
	  ResultSet rs=null;
  
  List<BoardVO> list=new ArrayList<BoardVO>(); 
  try { 
	  con=pool.getConnection();
  
	  String sql="select bno,btitle"
				+ "		from"
				+ "		("
				+ "		    select bno,btitle from mango_board order by bno desc"
				+ "		)"
				+ "		where rownum<=6";
		ps=con.prepareStatement(sql);
  
  ps=con.prepareStatement(sql);
  
  rs=ps.executeQuery(); while(rs.next()) { 
	  int bno=rs.getInt(1);
	  String btitle=rs.getString(2);
  
  BoardVO vo = new BoardVO();
  
  vo.setBno(bno); 
  vo.setBtitle(btitle);
  list.add(vo); 
  }
  System.out.println("메인 공지사항 결과 list.size="+list.size());
  return list; 
  }finally { 
	  pool.dbClose(rs, ps, con);
  } 
  }
  }
 
