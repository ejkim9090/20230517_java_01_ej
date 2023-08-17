package kh.test.jdbckh.board.model.dao;

import static kh.test.jdbckh.common.jdbc.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kh.test.jdbckh.board.model.dto.AttachFileDto;
import kh.test.jdbckh.board.model.dto.BoardDto;


public class BoardDao {
	public List<AttachFileDto> selectAttachFileList(SqlSession sesson, int bno) {
		System.out.println("[Board Dao selectAttachFile]");
		List<AttachFileDto> result = sesson.selectList("boardMapper1.selectAttachFile1", bno);
		System.out.println("[Board Dao selectAttachFile] return:" + result);
		return result;
	}
	
	public BoardDto selectOne(SqlSession sesson, int bno) {
		System.out.println("[Board Dao selectOne]");
		BoardDto result = sesson.selectOne("boardMapper1.selectOne1", bno);
		System.out.println("[Board Dao selectOne] return:" + result);
		return result;
	}
	public int insert(SqlSession sesson, BoardDto dto, int nextVal) {
		System.out.println("[Board Dao insert]");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		map.put("nextVal", nextVal);
		int result = sesson.insert("boardMapper1.insert1", map);
		System.out.println("[Board Dao insert] return:" + result);
		return result;
	}

}
