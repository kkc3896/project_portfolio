package com.test.been;


public class UserBean {
	private int user_idx;	//유저에게index번호를 부여 - primary키를위해 만듬
	private String user_id;				//아이디 - unique키를주고 사용
	private String user_pw;				//비밀번호
	private String user_pw_check;		//비밀번호 확인
	private String user_name;			//회원가입자 이름
	private String user_birth_year;		//생일 - 년
	private String user_birth_month;	//생일 - 월
	private String user_birth_day;		//생일 - 일
	private String user_gender;			//성별
	
	private String user_email;			//이메일
	private String user_date;			//가입한 날짜
	private boolean user_login_value;	//회원 등급 - 관리자 = 1, 일반회원 = 0
	private String id_check;		//회원가입 아이디 중복을 위해서.
	
	
	public String getId_check() {
		return id_check;
	}
	public void setId_check(String id_check) {
		this.id_check = id_check;
	}
	public boolean isUser_login_value() {
		return user_login_value;
	}
	public void setUser_login_value(boolean user_login_value) {
		this.user_login_value = user_login_value;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_pw_check() {
		return user_pw_check;
	}
	public void setUser_pw_check(String user_pw_check) {
		this.user_pw_check = user_pw_check;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_date() {
		return user_date;
	}
	public void setUser_date(String user_date) {
		this.user_date = user_date;
	}
	public String getUser_birth_year() {
		return user_birth_year;
	}
	public void setUser_birth_year(String user_birth_year) {
		this.user_birth_year = user_birth_year;
	}
	public String getUser_birth_month() {
		return user_birth_month;
	}
	public void setUser_birth_month(String user_birth_month) {
		this.user_birth_month = user_birth_month;
	}
	public String getUser_birth_day() {
		return user_birth_day;
	}
	public void setUser_birth_day(String user_birth_day) {
		this.user_birth_day = user_birth_day;
	}

}
