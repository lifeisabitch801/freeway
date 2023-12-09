package com.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Driver;
public interface DriverService {
		
		//INSERT DRIVER
		public void insertDriver(Driver driver);
		//UPDATE DRIVER
		public void updateDriver(Driver driver);
		//UPDATE DRIVER---MONEY
		public void updateDriverMoney(Driver driver,int addm);
		//DEL
		public void deleteDriver(String did);
		//SELECT ALL DRIVER
		public List<Driver> selectAllDriver();
		//SELECT DRIVER BY DID
		public Driver selectByDid(String did);
		//dynamic---page
		public PageInfo<Driver> page(int pageno,String did);
		//update money score by did
		public void updateMaSBydid(Driver driver);
}
