package com.ssm.pojo;

public class Menu {
	private int meid;
	private String mename;
	private String url;
	
	public Menu() {
		super();
	}
	public Menu(int meid, String mename, String url) {
		super();
		this.meid = meid;
		this.mename = mename;
		this.url = url;
	}
	public int getMeid() {
		return meid;
	}
	public void setMeid(int meid) {
		this.meid = meid;
	}
	public String getMename() {
		return mename;
	}
	public void setMename(String mename) {
		this.mename = mename;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
