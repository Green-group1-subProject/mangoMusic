package com.mangoMusic.soundtrack.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mangoMusic.db.ConnectionPoolMgr;

public class SoundTrackDAO {
	private ConnectionPoolMgr pool;
	
	public SoundTrackDAO() {
		pool= new ConnectionPoolMgr();
	}
	
	public List<SoundTrackVO> selectArtistTOP() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<SoundTrackVO> list= new ArrayList<SoundTrackVO>();
		
		try {
			con=pool.getConnection();
			String sql="select c.arno arno, d.arname arname\r\n"
					+ "from \r\n"
					+ "(\r\n"
					+ "select a.arno arno, sum(b.listencount) listencount\r\n"
					+ "from artist a join soundtrack b\r\n"
					+ "on a.arno = b.arno\r\n"
					+ "GROUP BY a.arno\r\n"
					+ "order by listencount desc\r\n"
					+ ")c join artist d\r\n"
					+ "on c.arno=d.arno\r\n"
					+ "where rownum<7";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				int arno=rs.getInt(1);
				String arname=rs.getString(2);
				
				SoundTrackVO vo = new SoundTrackVO();
				vo.setArNo(arno);
				vo.setArName(arname);
				
				list.add(vo);
			}
			System.out.println("메인 top6 artist 결과 ="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<SoundTrackVO> genre() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();
			String sql="select * from genre";
			ps=con.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int geNo=rs.getInt("geno");
				String geName=rs.getString("gename");
				
				SoundTrackVO vo = new SoundTrackVO();
				vo.setGeNo(geNo);
				vo.setGeName(geName);
				
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
		
	}
	
	public String selectArName(int arno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String arName=null;
		try {
			con=pool.getConnection();
			String sql="select arname from artist where arno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, arno);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				arName=rs.getString("arname");
				
			}
			System.out.println("arname="+arName);
			return arName;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<SoundTrackVO> selectArTOP(int arno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();
			
			String sql="select title, (select arname from artist b where b.arno=a.arno) arname,\r\n"
					+ "(select alname from album c where c.alno=a.alno) alname\r\n"
					+ "from(select * from soundTrack\r\n"
					+ "where arno=?\r\n"
					+ "order by listencount desc) a\r\n"
					+ "where rownum<7";
			ps=con.prepareStatement(sql);
			ps.setInt(1, arno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				String title=rs.getString("title");
				String arName=rs.getString("arName");
				String alName=rs.getString("alName");
				
				SoundTrackVO vo = new SoundTrackVO();
				vo.setTitle(title);
				vo.setArName(arName);
				vo.setAlName(alName);
				
				list.add(vo);
			}
			System.out.println("list="+list.size());
			return list;
		}finally {
			
		}
	}
	
	public List<SoundTrackVO> selectArAl(int arno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();
		
			String sql="select a.alno alno, b.alname alname, reldate\r\n"
					+ "from\r\n"
					+ "(select DISTINCT alno from soundtrack  \r\n"
					+ "where arno=?) a join album b\r\n"
					+ "on a.alno=b.alno";
			ps=con.prepareStatement(sql);
			ps.setInt(1, arno);
			rs=ps.executeQuery();
			while(rs.next()) {
				int alNo=rs.getInt("alno");
				String alName=rs.getString("alname");
				int relDate=rs.getInt("reldate");
				SoundTrackVO vo = new SoundTrackVO();
				vo.setAlNo(alNo);
				vo.setAlName(alName);
				vo.setRelDate(relDate);
				list.add(vo);
			}
			System.out.println("list"+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public SoundTrackVO albumByNo(int alno) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		SoundTrackVO vo=new SoundTrackVO();
		try {
			con=pool.getConnection();
			
			String sql="select * from album where alno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, alno);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				String alName=rs.getString("alName");
				int reldate=rs.getInt("reldate");
				
				vo.setAlNo(alno);
				vo.setAlName(alName);
				vo.setRelDate(reldate);
			}
			System.out.println("앨범조회 결과 vo="+vo+", 매개변수 no="+alno);
			
			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	
	public List<SoundTrackVO> albumList(int alno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();
			
			String sql="select title from soundtrack where alno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, alno);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				String title=rs.getString("title");
				
				SoundTrackVO vo=new SoundTrackVO();
				
				vo.setTitle(title);
				list.add(vo);
			}
			System.out.println("앨범 조회 결과, list.size="+list.size());
			
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
}
























