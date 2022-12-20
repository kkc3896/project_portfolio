package com.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.been.JobBeen;
import com.test.been.SearchBean;

@Repository
public class JobDao {
	// 쿼리문 동작을 위해 bean 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 목록_list
//	public List<JobBeen> Job_List() throws Exception{
//		List<JobBeen> Job_List = sqlSession.selectList("project_portfolio.Job_List");
//		return Job_List;
//	}
	// 목록_list - 페이징추가
	public List<JobBeen> Job_List(SearchBean searchBean) throws Exception {
		List<JobBeen> Job_List = sqlSession.selectList("project_portfolio.Job_List", searchBean);
		return Job_List;
//		return sqlSession.selectList("project_portfolio.Job_List", searchBean);
	}

	// 입력_write
	public void Job_Write(JobBeen jobBeen) throws Exception {
		sqlSession.insert("project_portfolio.Job_Write", jobBeen);
	}

	// 글읽기_read
	public JobBeen Job_Read(int job_idx) throws Exception {
		JobBeen jobBeen = sqlSession.selectOne("project_portfolio.Job_Read", job_idx);
		return jobBeen;
	}

	// 글수정_update
	public void Job_Update(JobBeen jobBeen) throws Exception {
		sqlSession.update("project_portfolio.Job_Update", jobBeen);
	}

	// 삭제_delete
	public void Job_Delete(int job_idx) throws Exception {
		sqlSession.delete("project_portfolio.Job_Delete", job_idx);
	}

	// 조회수_count
	public void Job_Count(int job_count) throws Exception {
		sqlSession.update("project_portfolio.Job_Count", job_count);
	}

	// 페이지네이션
	// 게시글 갯수
	public int getBoardListCnt(SearchBean searchBean) throws Exception {
        return sqlSession.selectOne("project_portfolio.getBoardListCnt", searchBean);
    }
}
