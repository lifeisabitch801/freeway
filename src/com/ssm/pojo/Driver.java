package com.ssm.pojo;

public class Driver {
	private String did;
	private String dname;
	private String didcard;
	private Integer dsex;
	private Integer dscore;
	private String dtel;
	private Integer dmoney;
	private String cbackup;
	
	
	
	public Driver() {
		super();
	}
	public Driver(String did, String dname, String didcard, Integer dsex, Integer dscore, String dtel, Integer dmoney,
			String cbackup) {
		super();
		this.did = did;
		this.dname = dname;
		this.didcard = didcard;
		this.dsex = dsex;
		this.dscore = dscore;
		this.dtel = dtel;
		this.dmoney = dmoney;
		this.cbackup = cbackup;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDidcard() {
		return didcard;
	}
	public void setDidcard(String didcard) {
		this.didcard = didcard;
	}
	public Integer getDsex() {
		return dsex;
	}
	public void setDsex(Integer dsex) {
		this.dsex = dsex;
	}
	public Integer getDscore() {
		return dscore;
	}
	public void setDscore(Integer dscore) {
		this.dscore = dscore;
	}
	public String getDtel() {
		return dtel;
	}
	public void setDtel(String dtel) {
		this.dtel = dtel;
	}
	public Integer getDmoney() {
		return dmoney;
	}
	public void setDmoney(Integer dmoney) {
		this.dmoney = dmoney;
	}
	public String getCbackup() {
		return cbackup;
	}
	public void setCbackup(String cbackup) {
		this.cbackup = cbackup;
	}
	
}
