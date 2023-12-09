package com.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.CarInfo;

public interface CarInfoService {
	//SELECT ALL CAR
		public List<CarInfo> selectAllCar();
		//SELECT CAR BY CID
		public CarInfo selectByCid(String cid);
		//SELECT CAR BY CCARD
		public List<CarInfo> selectByCcard(String ccard);
		//DEL CAR BY CID
		public void deleteByCid(String cid);
		//UPDATE CAR BY CID
		public void updateCar(CarInfo car);
		//INSERT CAR 
		public void insertCar(CarInfo car);
		//DYNAMIC PAGE
		public PageInfo<CarInfo> page(int pageno,String cid);
		//getcid
		public List<CarInfo> getCid();
}
