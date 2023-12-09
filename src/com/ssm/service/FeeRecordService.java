package com.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.FeeRecord;

public interface FeeRecordService {
		//list
		public PageInfo<FeeRecord> selectAll(int pageno);
		//into
		public void insertFee(FeeRecord fee);
		//out
		public void updateFee(int fid,int endid);
		//select one
		public FeeRecord selectOneByfid(int fid);
		//select money
		public int selectMoney(int fid,int endid);
		//selectNotIn
		//public List<FeeRecord> selectNotIn();
}
