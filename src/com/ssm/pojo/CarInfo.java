package com.ssm.pojo;

public class CarInfo {
	private String cid;
	private String ctype;
	private String ccard;
	private String cbackup;
	
	public CarInfo(String cid, String ctype, String ccard, String cbackup) {
		super();
		this.cid = cid;
		this.ctype = ctype;
		this.ccard = ccard;
		this.cbackup = cbackup;
	}
	public CarInfo() {
		super();
	}
	
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getCcard() {
		return ccard;
	}
	public void setCcard(String ccard) {
		this.ccard = ccard;
	}
	public String getCbackup() {
		return cbackup;
	}
	public void setCbackup(String cbackup) {
		this.cbackup = cbackup;
	}
	@Override
	public String toString() {
		return "CarInfo [cid=" + cid + ", ctype=" + ctype + ", ccard=" + ccard + ", cbackup=" + cbackup + "]";
	}
	
	
}
