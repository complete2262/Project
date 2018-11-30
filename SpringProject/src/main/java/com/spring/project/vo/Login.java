package com.spring.project.vo;

public class Login {

		private int id;
		private String user_id;
		private String password;
		private String nickName;
		
		
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
		public String getNickName() {
			return nickName;
		}
		public void setNickName(String nickName) {
			this.nickName = nickName;
		}
		@Override
		public String toString() {
			return "Login [id=" + id + ", user_id=" + user_id + ", password=" + password + ", nickName=" + nickName
					+ "]";
		}
		
}
