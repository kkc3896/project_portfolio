package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.been.ComentBean;
import com.test.dao.ComentDao;

@Service
public class ComentService {
	@Autowired
	private ComentDao comentDao;

	// 댓글 조회
	public List<ComentBean> comentList() throws Exception {
	    return comentDao.comentList();
	}

	// 댓글 작성
	public void comentWrite(ComentBean comentBean) throws Exception {
		comentDao.comentWrite(comentBean);
	}

	// 댓글 수정
	public void comenUpdate(ComentBean comentBean) throws Exception {
		comentDao.comenUpdate(comentBean);
	}

	// 댓글 삭제
	public void comenDelete(ComentBean comentBean) throws Exception {
		comentDao.comenDelete(comentBean);
	}
}
