package com.ssm.service;

import java.util.List;

import com.ssm.pojo.MoneyRecord;

public interface MoneyRecordService {
	//insert moneyre
		public void insertMoneyRe(MoneyRecord moneyre);
		//select moneyre
		public List<MoneyRecord> selectAll();
}
