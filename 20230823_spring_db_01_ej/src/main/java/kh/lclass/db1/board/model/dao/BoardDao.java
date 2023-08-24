package kh.lclass.db1.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.db1.board.model.vo.BoardVo;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession;	
	
	public List<BoardVo> selectList() {
		return sqlSession.selectList("board.selectList");
	}
	public BoardVo selectOne(int bno) {
		return sqlSession.selectOne("board.selectOne", bno);
	}
	public int insert(BoardVo vo) {
		return sqlSession.insert("board.insert", vo);
	}
	public int update(BoardVo vo) {
		return sqlSession.update("board.update", vo);
	}
	public int delete(int bno) {
		return sqlSession.delete("board.delete", bno);
	}
	
}
