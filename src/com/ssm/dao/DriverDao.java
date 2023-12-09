package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.Driver;

public interface DriverDao {
	//INSERT DRIVER
	public void insertDriver(Driver driver);
	//UPDATE DRIVER
	public void updateDriver(Driver driver);
	//UPDATE DRIVER---MONEY
	public void updateDriverMoney(Driver driver);
	//DEL
	public void deleteDriver(String did);
	//SELECT ALL DRIVER
	public List<Driver> selectAllDriver();
	//SELECT DRIVER BY DID
	public Driver selectByDid(String did);
	//dynamic---page
	public List<Driver> selectDriversByDid(String did);
	//update money score by did
	public void updateMaSBydid(Driver driver);
	//update money by did
	public void updateMoneyBydid(Driver driver);
}
