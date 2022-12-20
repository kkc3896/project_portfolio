package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.been.JobBeen;
import com.test.been.SearchBean;
import com.test.dao.JobDao;

@Service
public class JobService {
	@Autowired
	private JobDao jobDao;

	// 목록_list
//	public List<JobBeen> Job_List() throws Exception{
//		List<JobBeen> Job_List = jobDao.Job_List();
//		
//		return Job_List;
//	}
	// 목록_list - 페이징 추가
	public List<JobBeen> Job_List(SearchBean searchBean) throws Exception{
		List<JobBeen> Job_List = jobDao.Job_List(searchBean);
		return Job_List;
		
//		return jobDao.Job_List(searchBean);
	}
	
	//입력_write
	public void Job_Write(JobBeen jobBeen) throws Exception{
		jobDao.Job_Write(jobBeen);
	}
	
	//글읽기_read
	public JobBeen Job_Read(int job_idx) throws Exception{
		JobBeen jobBeen =  jobDao.Job_Read(job_idx);
		return jobBeen;
	}
	
	//글수정_update
	public void Job_Update(JobBeen jobBeen) throws Exception{
		jobDao.Job_Update(jobBeen);
	}
	
	//삭제_delete
	public void Job_Delete(int job_idx) throws Exception{
		jobDao.Job_Delete(job_idx);
	}

	//조회수_count
	public void Job_Count(int job_count) throws Exception{
		jobDao.Job_Count(job_count);
	}
	
	// 페이지네이션 
	// 게시글 갯수
	public int getBoardListCnt(SearchBean searchBean) throws Exception {
		return jobDao.getBoardListCnt(searchBean);
	}
}
