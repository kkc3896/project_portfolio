package com.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.been.ComentBean;

@Repository
public class ComentDao {
	// 쿼리문 동작을 위해 bean 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 댓글 조회
	public List<ComentBean> comentList() throws Exception {
		return sqlSession.selectList("project_portfolio_coment.comentList");
	}

	// 댓글 작성
	public void comentWrite(ComentBean comentBean) throws Exception {
		sqlSession.insert("project_portfolio_coment.comentWrite", comentBean);
	}

	// 댓글 수정
	public void comenUpdate(ComentBean comentBean) throws Exception {
		sqlSession.update("project_portfolio_coment.comenUpdate", comentBean);
	}

	// 댓글 삭제
	public void comenDelete(ComentBean comentBean) throws Exception {
		sqlSession.delete("project_portfolio_coment.comenDelete", comentBean);
	}

}
