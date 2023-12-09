package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.MoneyRecord;

public interface MoneyRecordDao {
	//insert moneyre
	public void insertMoneyRe(MoneyRecord moneyre);
	//select moneyre
	public List<MoneyRecord> selectAll();
}
