package com.spring.project.vo;

public class Puser {

	private int id; //index
	private String user_id;	
	private String password;
	private String encryptPassword;
	private String nickName;
	private String email_id;
	private String email_site;
	private String email ;
	private String interest;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEncryptPassword() {
		return encryptPassword;
	}
	public void setEncryptPassword(String encryptPassword) {
		this.encryptPassword = encryptPassword;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
	public String getEmail_id() {
		return email_id;
	}
	public void setEmail_id(String email_id) {
		this.email_id = email_id;
	}
	public String getEmail_site() {
		return email_site;
	}
	public void setEmail_site(String email_site) {
		this.email_site = email_site;
	}
	public String getEmail() {
		return email;
	}
	
	
	public void setEmail(String email) {
		this.email = email;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	@Override
	public String toString() {
		return "Puser [id=" + id + ", user_id=" + user_id + ", password=" + password + ", nickName=" + nickName
				+ ", email_id=" + email_id + ", email_site=" + email_site + ", email=" + email + ", interest="
				+ interest + "]";
	}
	
	
}





