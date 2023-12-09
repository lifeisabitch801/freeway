package com.ssm.pojo;

public class Users {
	private String uid;
	private String uname;
	private String upwd;
	private String uface;
	private int urole;
	
	public Users() {
		super();
	}
	public Users(String uid, String uname, String upwd, String uface, int urole) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upwd = upwd;
		this.uface = uface;
		this.urole = urole;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUface() {
		return uface;
	}
	public void setUface(String uface) {
		this.uface = uface;
	}
	public int getUrole() {
		return urole;
	}
	public void setUrole(int urole) {
		this.urole = urole;
	}
	@Override
	public String toString() {
		return "Users [uid=" + uid + ", uname=" + uname + ", upwd=" + upwd + ", uface=" + uface + ", urole=" + urole
				+ "]";
	}
	
	
}
