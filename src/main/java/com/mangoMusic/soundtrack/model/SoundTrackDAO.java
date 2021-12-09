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

	public List<SoundTrackVO> selectArtist() throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<SoundTrackVO> list= new ArrayList<SoundTrackVO>();

		try {
			con=pool.getConnection();
			String sql="select * from artist";
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

			String sql="select sno, title, alno, (select arname from artist b where b.arno=a.arno) arname,\r\n"
					+ "(select alname from album c where c.alno=a.alno) alname\r\n"
					+ "from(select * from soundTrack\r\n"
					+ "where arno=?\r\n"
					+ "order by listencount desc) a\r\n"
					+ "where rownum<7";
			ps=con.prepareStatement(sql);
			ps.setInt(1, arno);

			rs=ps.executeQuery();
			while(rs.next()) {
				int sNo=rs.getInt("sno");
				String title=rs.getString("title");
				int alNo=rs.getInt("alno");
				String arName=rs.getString("arName");
				String alName=rs.getString("alName");

				SoundTrackVO vo = new SoundTrackVO();
				vo.setsNo(sNo);
				vo.setTitle(title);
				vo.setAlNo(alNo);
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
	         
	         String sql="select s.arno arno,alname, reldate, (select arname from artist r where r.arno=s.arno) arname\r\n"
	               + "from album l left join soundtrack s\r\n"
	               + "on l.alno=s.alno\r\n"
	               + "where l.alno=?";
	         ps=con.prepareStatement(sql);
	         ps.setInt(1, alno);
	         
	         rs=ps.executeQuery();
	         if(rs.next()) {
	            String alName=rs.getString("alName");
	            int reldate=rs.getInt("reldate");
	            String arName=rs.getString("arName");
	            int arNo=rs.getInt("arNo");
	            
	            vo.setAlNo(alno);
	            vo.setAlName(alName);
	            vo.setRelDate(reldate);
	            vo.setArName(arName);
	            vo.setArNo(arNo);
	         }
	         System.out.println("앨범조회 결과 vo="+vo+", 매개변수 no="+alno);
	         
	         return vo;
	      }finally {
	         pool.dbClose(rs, ps, con);
	      }
	   }
	//가수별 엘범리스트
	public List<SoundTrackVO> albumList(int alno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();

			String sql="select title, sno from soundtrack where alno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, alno);

			rs=ps.executeQuery();
			while(rs.next()) {
				String title=rs.getString("title");
				int sNo=rs.getInt("sno");
				SoundTrackVO vo=new SoundTrackVO();
				
				vo.setTitle(title);
				vo.setsNo(sNo);
				
				list.add(vo);
			}
			System.out.println("앨범 조회 결과, list.size="+list.size());

			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}
	//가수별 청취수순
	public List<SoundTrackVO> selectSongAll(int arno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();
			String sql="select sno, alno, title, (select arname from artist b where b.arno=a.arno) arname,\r\n"
					+ "(select alname from album c where c.alno=a.alno) alname\r\n"
					+ "from(select * from soundtrack\r\n"
					+ "where arno= ?\r\n"
					+ "order by listencount desc) a";
			ps=con.prepareStatement(sql);
			ps.setInt(1, arno);

			rs=ps.executeQuery();
			while(rs.next()) {
				int sNo=rs.getInt("sno");
				int alNo=rs.getInt("alno");
				String title=rs.getString("title");
				String arName=rs.getString("arname");
				String alName=rs.getString("alname");
				SoundTrackVO vo=new SoundTrackVO();
				vo.setsNo(sNo);
				vo.setAlNo(alNo);
				vo.setTitle(title);
				vo.setArName(arName);
				vo.setAlName(alName);

				list.add(vo);
			}
			System.out.println("list.size="+list.size());
			return list;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<SoundTrackVO> selectTop20() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();
			String sql="select sno, alno, title, arname, alname\r\n"
					+ "from(\r\n"
					+ "select sno, alno, title, (select arname from artist b where b.arno=a.arno) arname,\r\n"
					+ "(select alname from album c where c.alno=a.alno) alname\r\n"
					+ "from soundtrack a\r\n"
					+ "order by listencount desc\r\n"
					+ ")\r\n"
					+ "where rownum<21";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();
			while(rs.next()){
				int sNo=rs.getInt("sno");
				int alNo=rs.getInt("alno");
				String title=rs.getString("title");
				String arName=rs.getString("arname");
				String alName=rs.getString("alname");

				SoundTrackVO vo= new SoundTrackVO();

				vo.setsNo(sNo);
				vo.setAlNo(alNo);
				vo.setTitle(title);
				vo.setArName(arName);
				vo.setAlName(alName);
				list.add(vo);
			}
			System.out.println("list.size"+list.size());
			return list;
		}finally {

		}
	}

	public List<SoundTrackVO> select12() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();
			String sql="select sno,alno,title,arname,alname\r\n"
					+ "from (\r\n"
					+ "select sno,alno, title, (select arname from artist b where b.arno=a.arno) arname,\r\n"
					+ "(select alname from album c where c.alno=a.alno) alname\r\n"
					+ "from soundtrack a\r\n"
					+ "where geno=6\r\n"
					+ "order by DBMS_RANDOM.RANDOM)\r\n"
					+ "where rownum<13";
			ps=con.prepareStatement(sql);

			rs=ps.executeQuery();
			while(rs.next()){
				int sNo=rs.getInt("sno");
				int alNo=rs.getInt("alno");
				String title=rs.getString("title");
				String arName=rs.getString("arname");
				String alName=rs.getString("alname");

				SoundTrackVO vo= new SoundTrackVO();

				vo.setsNo(sNo);
				vo.setAlNo(alNo);
				vo.setTitle(title);
				vo.setArName(arName);
				vo.setAlName(alName);
				list.add(vo);
			}
			System.out.println("list.size"+list.size());
			return list;
		}finally {

		}
	}

	public SoundTrackVO genreByNo(int geno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		SoundTrackVO vo=new SoundTrackVO();
		try {
			con=pool.getConnection();

			String sql="select gename from genre where geno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, geno);

			rs=ps.executeQuery();
			if(rs.next()) {
				String gename=rs.getString("geName");

				vo.setGeName(gename);
			}
			System.out.println("장르조회 결과 vo="+vo+", 매개변수 geno="+geno);

			return vo;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<SoundTrackVO> genreList(int geno) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		try {
			con=pool.getConnection();

			String sql="select sno, alno, title, (select arname from artist c where c.arno=a.arno) arname,\r\n"
					+ "(select alname from album b where b.alno=a.alno) alname \r\n"
					+ "from soundtrack a \r\n"
					+ "where geno=? \r\n"
					+ "order by dbms_random.random()";
			ps=con.prepareStatement(sql);
			ps.setInt(1, geno);

			rs=ps.executeQuery();
			while(rs.next()) {
				int sNo=rs.getInt("sno");
				int alNo=rs.getInt("alno");
				String title=rs.getString("title");
				String arName=rs.getString("arname");
				String alName=rs.getString("alname");

				SoundTrackVO vo= new SoundTrackVO();
				vo.setsNo(sNo);
				vo.setAlNo(alNo);
				vo.setTitle(title);
				vo.setArName(arName);
				vo.setAlName(alName);

				list.add(vo);
			}
			System.out.println("장르앨범별 조회 결과 list.size="+list.size());
			return list;

		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public List<SoundTrackVO> selectBySNo(String[] sno) throws SQLException{
		List<SoundTrackVO> list=new ArrayList<SoundTrackVO>();
		for(int i=0;i<sno.length;i++) {
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			try {
				con=pool.getConnection();

				String sql="select sno, alno, title, (select arname from artist b where a.arno=b.arno) arname,\r\n"
						+ "(select alname from album c where a.alno=c.alno) alname\r\n"
						+ "from soundtrack a\r\n"
						+ "where sno=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, sno[i]);
				rs=ps.executeQuery();
				while(rs.next()) {
					int sNo=rs.getInt("sno");
					int alNo=rs.getInt("alno");
					String title=rs.getString("title");
					String arName=rs.getString("arname");
					String alName=rs.getString("alname");

					SoundTrackVO vo= new SoundTrackVO();
					vo.setsNo(sNo);
					vo.setAlNo(alNo);
					vo.setTitle(title);
					vo.setArName(arName);
					vo.setAlName(alName);

					list.add(vo);
				}
				System.out.println("playList 조회 결과 list.size="+list.size());
			}finally {
				pool.dbClose(rs, ps, con);
			}
		}
		return list;
	}

	public String getPL(int mNo) throws SQLException{
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			con=pool.getConnection();

			String sql="select ltitle from playlist"
					+ " where mno=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, mNo);

			rs=ps.executeQuery();
			String ltitle="";
			if(rs.next()) {
				ltitle=rs.getString("ltitle");
			}
			System.out.println("유저 playList 조회 결과 ltitle="+ltitle);

			return ltitle;
		}finally {
			pool.dbClose(rs, ps, con);
		}
	}

	public int addMusic(int mNo, String addMusic) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;

		addMusic+="/";

		try {
			con=pool.getConnection();

			String sql="update playlist"
					+ " set ltitle=?||ltitle"
					+ " where mno=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, addMusic);
			ps.setInt(2, mNo);

			int cnt=ps.executeUpdate();

			if(cnt>0) {
				System.out.println("플레이리스트 음악추가 성공");
			}else {
				System.out.println("플레이리스트 음악추가 실패");
			}

			return cnt;
		}finally {
			pool.dbClose(ps, con);
		}
	}


}
