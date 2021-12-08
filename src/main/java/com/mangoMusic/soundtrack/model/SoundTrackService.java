package com.mangoMusic.soundtrack.model;

import java.sql.SQLException;
import java.util.List;

public class SoundTrackService {
	private SoundTrackDAO soundTrackDao;
	
	public SoundTrackService() {
		soundTrackDao=new SoundTrackDAO();
	}
	
	public List<SoundTrackVO> selectArTOP(int arno) throws SQLException{
		return soundTrackDao.selectArTOP(arno);
	}
}
