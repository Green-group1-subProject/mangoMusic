package com.mango.board.model;

import java.sql.SQLException;
import java.util.List;

public class BoardService {
	private BoardDAO boardDao;

	
	  public BoardService() { boardDao=new BoardDAO(); }
	  
	  public List<BoardVO> selectMainNotice() throws SQLException { return
	  boardDao.selectMainNotice(); }
	 
}
