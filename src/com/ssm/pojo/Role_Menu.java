package com.ssm.pojo;

public class Role_Menu {
	private int rmid;
	private int roid;
	private int meid;
	
	public Role_Menu() {
		super();
	}
	public Role_Menu(int rmid, int roid, int meid) {
		super();
		this.rmid = rmid;
		this.roid = roid;
		this.meid = meid;
	}
	public int getRmid() {
		return rmid;
	}
	public void setRmid(int rmid) {
		this.rmid = rmid;
	}
	public int getRoid() {
		return roid;
	}
	public void setRoid(int roid) {
		this.roid = roid;
	}
	public int getMeid() {
		return meid;
	}
	public void setMeid(int meid) {
		this.meid = meid;
	}
	
}
