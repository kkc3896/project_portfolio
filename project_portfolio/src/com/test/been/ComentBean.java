package com.test.been;


public class ComentBean {
	private int coment_bno;			//댓글번호
	private String coment_content;	//댓글내용
	private String coment_user;		//댓글작성자
	private String coment_date;  	//댓글작성날짜
	private String remote_addr;		//아이피주소를 받기 위함 
	
	public int getComent_bno() {
		return coment_bno;
	}
	public void setComent_bno(int coment_bno) {
		this.coment_bno = coment_bno;
	}
	public String getComent_content() {
		return coment_content;
	}
	public void setComent_content(String coment_content) {
		this.coment_content = coment_content;
	}
	public String getComent_user() {
		return coment_user;
	}
	public void setComent_user(String coment_user) {
		this.coment_user = coment_user;
	}
	
	public String getComent_date() {
		return coment_date;
	}
	public void setComent_date(String coment_date) {
		this.coment_date = coment_date;
	}
	
	public String getRemote_addr() {
		return remote_addr;
	}
	public void setRemote_addr(String remote_addr) {
		this.remote_addr = remote_addr;
	}
	@Override
	public String toString() {
		return "ComentBean [coment_bno=" + coment_bno + ", coment_content=" + coment_content + ", coment_user="
				+ coment_user + ", coment_date=" + coment_date + ", coment_update=" + ", remote_addr="
				+ remote_addr + "]";
	}

	
	
}
