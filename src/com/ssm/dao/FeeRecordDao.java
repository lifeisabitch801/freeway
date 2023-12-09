package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.FeeRecord;

public interface FeeRecordDao {
	//list
	public List<FeeRecord> selectAll();
	//into
	public void insertFee(FeeRecord fee);
	//out
	public void updateFee(FeeRecord fee);
	//select one
	public FeeRecord selectOneByfid(int fid);
	//selectNotIn
	//public List<FeeRecord> selectNotIn();
}
