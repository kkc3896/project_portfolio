package com.test.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.been.UserBean;

@Repository
public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원가입_join
	public void user_Join(UserBean userBean) throws Exception{
		sqlSession.insert("project_portfolio_user.user_Join", userBean);
	}
	
	// 로그인_login
	public UserBean user_Login(UserBean userBean) throws Exception{
		return sqlSession.selectOne("project_portfolio_user.user_Login", userBean);
	}
	
	// 회원정보수정
	public void join_Update(UserBean userBean) throws Exception{
		sqlSession.update("project_portfolio_user.join_Update", userBean);
	}
	
	// 사용자 정보 가져오기 - 회원정보수정등과같이 필요한 곳에 사용하기 위해
	public void getUserInfo(int user_idx) {
		 sqlSession.selectOne("project_portfolio_user.getUserInfo", user_idx);
	}
	
	// 회원탈퇴_삭제
	public void user_Delete(String user_id) throws Exception{
		sqlSession.delete("project_portfolio_user.user_Delete", user_id);
	}
	
	// 아이디 중복확인
	public int id_Check(String user_id) {
		return sqlSession.selectOne("project_portfolio_user.id_Check", user_id);
	}


}
