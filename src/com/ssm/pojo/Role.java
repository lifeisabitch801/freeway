package com.ssm.pojo;

public class Role {
	private int roid;
	private String roname;
	public Role(int roid, String roname) {
		super();
		this.roid = roid;
		this.roname = roname;
	}
	public Role() {
		super();
	}
	public int getRoid() {
		return roid;
	}
	public void setRoid(int roid) {
		this.roid = roid;
	}
	public String getRoname() {
		return roname;
	}
	public void setRoname(String roname) {
		this.roname = roname;
	}
	
}
