package com.shop.board.service;

import org.apache.ibatis.session.SqlSession;

import com.shop.board.mapper.BoardMapper;
import com.shop.common.DataSource;
import com.shop.vo.BoardVO;

public class BoardServiceImpl implements BoardService {
	SqlSession session = DataSource.getInstance().openSession(true);
	BoardMapper mapper = session.getMapper(BoardMapper.class);
	
	@Override
	public boolean addBoard(BoardVO bvo) {
		return mapper.insertBoard(bvo) == 1;
	}
	
	
}
