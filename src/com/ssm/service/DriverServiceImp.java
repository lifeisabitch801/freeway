package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.DriverDao;
import com.ssm.dao.MoneyRecordDao;
import com.ssm.pojo.Driver;
import com.ssm.pojo.MoneyRecord;
@Service
@Transactional
public class DriverServiceImp implements DriverService {
	@Autowired
	private DriverDao ddao;
	@Autowired
	private MoneyRecordDao mdao;
	
	@Override
	public void insertDriver(Driver driver) {
		// TODO Auto-generated method stub
		ddao.insertDriver(driver);
		
	}

	@Override
	public void updateDriver(Driver driver) {
		// TODO Auto-generated method stub
		ddao.updateDriver(driver);
	}

	@Override
	public void updateDriverMoney(Driver driver,int addm) {
		// TODO Auto-generated method stub
		ddao.updateDriverMoney(driver);
		MoneyRecord moneyre = new MoneyRecord();
		moneyre.setMmoney(addm);
		moneyre.setDid(driver.getDid());
		//moneyre.setMid(addm);
		moneyre.setMtype(1);
		mdao.insertMoneyRe(moneyre);
	}

	@Override
	public void deleteDriver(String did) {
		// TODO Auto-generated method stub
		ddao.deleteDriver(did);
	}

	@Override
	public List<Driver> selectAllDriver() {
		// TODO Auto-generated method stub
		return ddao.selectAllDriver();
	}

	@Override
	public Driver selectByDid(String did) {
		// TODO Auto-generated method stub
		return ddao.selectByDid(did);
	}

	@Override
	public PageInfo<Driver> page(int pageno, String did) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageno,5);
		
		List<Driver> driverlist = ddao.selectDriversByDid(did);
		
		PageInfo<Driver> result = new PageInfo(driverlist);
				
		return result;
	}

	@Override
	public void updateMaSBydid(Driver driver) {
		// TODO Auto-generated method stub
		ddao.updateMaSBydid(driver);
	}
	
	
}
