package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.CarInfo;

public interface CarInfoDao {
	//SELECT ALL CAR
	public List<CarInfo> selectAllCar();
	//SELECT CAR BY CID----
	public CarInfo selectByCid(String cid);
	//SELECT CAR BY CCARD
	public List<CarInfo> selectByCcard(String ccard);
	//DEL CAR BY CID
	public void deleteByCid(String cid);
	//UPDATE CAR BY CID
	public void updateCar(CarInfo car);
	//INSERT CAR 
	public void insertCar(CarInfo car);
	//DYNAMIC--PAGE
	public List<CarInfo> selectCarsByCid(String cid);
	//getcid
	public List<CarInfo> getCid();
}
