package com.mangomusic.soundtrack.model;

import java.sql.SQLException;
import java.util.List;

public class SoundTrackService {
	private SoundTrackDAO soundTrackDao;
	
	public SoundTrackService() {
		soundTrackDao=new SoundTrackDAO();
	}
	
	public List<SoundTrackVO> selectArtistTOP() throws SQLException{
		return soundTrackDao.selectArtistTOP();
	}
}
