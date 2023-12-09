package com.ssm.pojo;

public class Rule {
	private Integer rid;
	private String raction;
	private Integer rmoney;
	private Integer rscore;
	public Rule(Integer rid, String raction, Integer rmoney, Integer rscore) {
		super();
		this.rid = rid;
		this.raction = raction;
		this.rmoney = rmoney;
		this.rscore = rscore;
	}
	public Rule() {
		super();
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public String getRaction() {
		return raction;
	}
	public void setRaction(String raction) {
		this.raction = raction;
	}
	public Integer getRmoney() {
		return rmoney;
	}
	public void setRmoney(Integer rmoney) {
		this.rmoney = rmoney;
	}
	public Integer getRscore() {
		return rscore;
	}
	public void setRscore(Integer rscore) {
		this.rscore = rscore;
	}
	
}
