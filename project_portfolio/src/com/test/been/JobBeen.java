package com.test.been;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.test.util.utiletc;

public class JobBeen {
	private int job_idx;		//인덱스
	private String job_name;	//회사이름
	private String job_content;	//내용
	private String job_place;	//회사 위치
	private String job_field;	//지원분야
	private String job_date;	//등록날짜
	private int job_count;		//조회수
	private String fileName;	//파일업로드 - 파일이름
	private MultipartFile uploadFile;	//파일업로드 - 단일
	private List<MultipartFile> uploadFileList;	//파일업로드 - 다중
	
	// 게시물 내용을 글자수에 맞추어 자르기
	public String getShortString_jobName(Integer len) {
		return utiletc.getShortString(job_name, len);
	}
	public String getShortString_jobPlace(Integer len) {
		return utiletc.getShortString(job_place, len);
	}
	
	// /게시물 내용을 글자수에 맞추어 자르기
	
	// getter, setter
	public int getJob_count() {
		return job_count;
	}
	public void setJob_count(int job_count) {
		this.job_count = job_count;
	}
	public int getJob_idx() {
		return job_idx;
	}
	public void setJob_idx(int job_idx) {
		this.job_idx = job_idx;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public String getJob_place() {
		return job_place;
	}
	public void setJob_place(String job_place) {
		this.job_place = job_place;
	}
	public String getJob_field() {
		return job_field;
	}
	public void setJob_field(String job_field) {
		this.job_field = job_field;
	}
	public String getJob_date() {
		return job_date;
	}
	public void setJob_date(String job_date) {
		this.job_date = job_date;
	}
	public String getJob_content() {
		return job_content;
	}
	public void setJob_content(String job_content) {
		this.job_content = job_content;
	}
	public String getFileName() {
		return fileName;
	}
	public String setFileName(String fileName) {
		return this.fileName = fileName;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public List<MultipartFile> getUploadFileList() {
		return uploadFileList;
	}
	public void setUploadFileList(List<MultipartFile> uploadFileList) {
		this.uploadFileList = uploadFileList;
	}
	
	// /getter, setter
	
	
}
