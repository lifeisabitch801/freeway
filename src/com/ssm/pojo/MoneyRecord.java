package com.ssm.pojo;

public class MoneyRecord {
	private Integer mid;
	private String did;
	private Integer mmoney;
	private Integer mtype;
	private String mcreatetime;
	public MoneyRecord(Integer mid, String did, Integer mmoney, Integer mtype, String mcreatetime) {
		super();
		this.mid = mid;
		this.did = did;
		this.mmoney = mmoney;
		this.mtype = mtype;
		this.mcreatetime = mcreatetime;
	}
	public MoneyRecord() {
		super();
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public Integer getMmoney() {
		return mmoney;
	}
	public void setMmoney(Integer mmoney) {
		this.mmoney = mmoney;
	}
	public Integer getMtype() {
		return mtype;
	}
	public void setMtype(Integer mtype) {
		this.mtype = mtype;
	}
	public String getMcreatetime() {
		return mcreatetime;
	}
	public void setMcreatetime(String mcreatetime) {
		this.mcreatetime = mcreatetime;
	}
	
}
