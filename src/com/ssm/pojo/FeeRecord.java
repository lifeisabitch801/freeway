package com.ssm.pojo;

public class FeeRecord {
	private Integer fid;
	private Integer beginid;
	private String cid;
	private Integer endid;
	private Integer fprice;
	private Integer fstate;
	private String cbackup;
	
	
	public FeeRecord() {
		super();
	}
	public FeeRecord(Integer fid, Integer beginid, String cid, Integer endid, Integer fprice, Integer fstate,
			String cbackup) {
		super();
		this.fid = fid;
		this.beginid = beginid;
		this.cid = cid;
		this.endid = endid;
		this.fprice = fprice;
		this.fstate = fstate;
		this.cbackup = cbackup;
	}
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public Integer getBeginid() {
		return beginid;
	}
	public void setBeginid(Integer beginid) {
		this.beginid = beginid;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public Integer getEndid() {
		return endid;
	}
	public void setEndid(Integer endid) {
		this.endid = endid;
	}
	public Integer getFprice() {
		return fprice;
	}
	public void setFprice(Integer fprice) {
		this.fprice = fprice;
	}
	public Integer getFstate() {
		return fstate;
	}
	public void setFstate(Integer fstate) {
		this.fstate = fstate;
	}
	public String getCbackup() {
		return cbackup;
	}
	public void setCbackup(String cbackup) {
		this.cbackup = cbackup;
	}
	@Override
	public String toString() {
		return "FeeRecord [fid=" + fid + ", beginid=" + beginid + ", cid=" + cid + ", endid=" + endid + ", fprice="
				+ fprice + ", fstate=" + fstate + ", cbackup=" + cbackup + "]";
	}
	
	
	
}