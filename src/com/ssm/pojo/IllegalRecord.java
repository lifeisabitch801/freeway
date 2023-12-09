package com.ssm.pojo;

public class IllegalRecord {
	private Integer iid;
	private String cid;
	private String rcreatetime;
	private String rlocation;
	private Integer rid;
	private Integer rstate;
	private String ibackup;
	
	
	public IllegalRecord() {
		super();
	}
	public IllegalRecord(Integer iid, String cid, String rcreatetime, String rlocation, Integer rid, Integer rstate,
			String ibackup) {
		super();
		this.iid = iid;
		this.cid = cid;
		this.rcreatetime = rcreatetime;
		this.rlocation = rlocation;
		this.rid = rid;
		this.rstate = rstate;
		this.ibackup = ibackup;
	}
	public Integer getIid() {
		return iid;
	}
	public void setIid(Integer iid) {
		this.iid = iid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getRcreatetime() {
		return rcreatetime;
		//return rcreatetime.substring(0,rcreatetime.lastIndexOf("."));
	}
	public void setRcreatetime(String rcreatetime) {
		this.rcreatetime = rcreatetime;
	}
	public String getRlocation() {
		return rlocation;
	}
	public void setRlocation(String rlocation) {
		this.rlocation = rlocation;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getRstate() {
		return rstate;
	}
	public void setRstate(Integer rstate) {
		this.rstate = rstate;
	}
	public String getIbackup() {
		return ibackup;
	}
	public void setIbackup(String ibackup) {
		this.ibackup = ibackup;
	}
	@Override
	public String toString() {
		return "IllegalRecord [iid=" + iid + ", cid=" + cid + ", rcreatetime=" + rcreatetime + ", rlocation="
				+ rlocation + ", rid=" + rid + ", rstate=" + rstate + ", ibackup=" + ibackup + "]";
	}
	
	
	
}
