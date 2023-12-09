package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.dao.MoneyRecordDao;
import com.ssm.pojo.MoneyRecord;
@Service
public class MoneyRecordServiceImp implements MoneyRecordService {
	@Autowired
	private MoneyRecordDao mdao;
	@Override
	public void insertMoneyRe(MoneyRecord moneyre) {
		// TODO Auto-generated method stub
		mdao.insertMoneyRe(moneyre);
	}

	@Override
	public List<MoneyRecord> selectAll() {
		// TODO Auto-generated method stub
		return mdao.selectAll();
	}
	
}
