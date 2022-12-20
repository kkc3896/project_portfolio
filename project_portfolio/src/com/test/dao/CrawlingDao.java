package com.test.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CrawlingDao {
	// 쿼리문 동작을 위해 bean 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
