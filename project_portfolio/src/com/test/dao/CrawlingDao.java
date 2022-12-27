package com.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.been.ComentBean;
import com.test.been.CrawlingBean;
import com.test.been.JobBeen;

@Repository
public class CrawlingDao {
	// 쿼리문 동작을 위해 bean 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 입력
	public void Crawling_Write(CrawlingBean crawlingBean) throws Exception {
		sqlSession.insert("project_portfolio_crawling.Crawling_Write", crawlingBean);
	}
	
	// 조회
	public List<CrawlingBean> Crawling_List() throws Exception{
		return sqlSession.selectList("project_portfolio_crawling.Crawling_List");
	}
	
}
