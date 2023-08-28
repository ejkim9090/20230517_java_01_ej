package kh.lclass.db1.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.db1.board.model.dao.BoardDao;
import kh.lclass.db1.board.model.vo.BoardVo;

@Service
public class BoardService {
 
	@Autowired
	private BoardDao boardDao;
	
	public List<BoardVo> selectList() throws Exception{
		return boardDao.selectList(); 
	}
	public BoardVo selectOne(int bno) throws Exception{
		return boardDao.selectOne(bno);
	}

	@Transactional
	public int insert(BoardVo vo) throws Exception{
//		int nextval = boardDao.getNextVal();
		BoardVo returnVo = boardDao.insert(vo);
		int result = returnVo.getBno();
		if(result != 0) {
			// insert 실패
	//		if(returnVo.getAttachFileList()!=null&&returnVo.getAttachFileList().size()>0) {
	//			boardDao.insertAttachFileList(returnVo);
	//		}
		}
		return result;
	}
	
	public int update(BoardVo vo) throws Exception{
		return boardDao.update(vo);
	}
	public int delete(int bno) throws Exception{
		return boardDao.delete(bno);
	}
}
