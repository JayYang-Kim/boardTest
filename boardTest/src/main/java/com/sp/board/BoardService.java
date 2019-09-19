package com.sp.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public int insertBoard(Board dto, String pathname);
	public List<Board> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Board readBoard(int boardCode);
	public int updateHitCount(int boardCode);
	public Board preReadBoard(Map<String, Object> map);
	public Board nextReadBoard(Map<String, Object> map);
	public int updateBoard(Board dto, String pathname);
	public int deleteBoard(int boardCode, String pathname, String saveFilename);
}
