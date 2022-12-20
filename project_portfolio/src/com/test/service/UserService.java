package com.test.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.been.UserBean;
import com.test.dao.UserDao;

@Service
public class UserService {
	@Autowired
	private UserDao userDao;
	
	// 회원가입_join
	public void user_Join(UserBean userBean) throws Exception{
		userDao.user_Join(userBean);
	}
	
	// 로그인_login
	public UserBean user_Login(UserBean userBean) throws Exception{
		return userDao.user_Login(userBean);
	}
	
	// 회원정보수정
	public void join_Update(UserBean userBean) throws Exception{
		
		userDao.join_Update(userBean);
	}
	
	// 사용자 정보 가져오기 - 회원정보수정등과같이 필요한 곳에 사용하기 위해
	public int getUserInfo(int user_idx) throws Exception{
		userDao.getUserInfo(user_idx);
		return user_idx;
		
	}

	// 회원탈퇴_삭제
	public void user_Delete(String user_id) throws Exception {
		userDao.user_Delete(user_id);
	}
	
	// 아이디중복확인
	public int id_Check(String user_id) throws Exception {
		return userDao.id_Check(user_id);
	}
	
}
