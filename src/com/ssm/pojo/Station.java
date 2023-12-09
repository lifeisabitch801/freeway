package com.ssm.pojo;

public class Station {
	private Integer sid;
	private String sname;
	private Integer sprice;
	private String sbackup;
	public Station(Integer sid, String sname, Integer sprice, String sbackup) {
		super();
		this.sid = sid;
		this.sname = sname;
		this.sprice = sprice;
		this.sbackup = sbackup;
	}
	public Station() {
		super();
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Integer getSprice() {
		return sprice;
	}
	public void setSprice(Integer sprice) {
		this.sprice = sprice;
	}
	public String getSbackup() {
		return sbackup;
	}
	public void setSbackup(String sbackup) {
		this.sbackup = sbackup;
	}
	@Override
	public String toString() {
		return "Station [sid=" + sid + ", sname=" + sname + ", sprice=" + sprice + ", sbackup=" + sbackup + "]";
	}
	
}
