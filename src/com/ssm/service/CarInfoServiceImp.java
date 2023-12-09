package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.CarInfoDao;
import com.ssm.pojo.CarInfo;

@Service
@Transactional
public class CarInfoServiceImp implements CarInfoService {
	
	@Autowired
	private CarInfoDao cdao;

	@Override
	public List<CarInfo> selectAllCar() {
		// TODO Auto-generated method stub
		return cdao.selectAllCar();
	}

	@Override
	public CarInfo selectByCid(String cid) {
		// TODO Auto-generated method stub
		return cdao.selectByCid(cid);
	}

	@Override
	public List<CarInfo> selectByCcard(String ccard) {
		// TODO Auto-generated method stub
		return cdao.selectByCcard(ccard);
	}

	@Override
	public void deleteByCid(String cid) {
		// TODO Auto-generated method stub
		cdao.deleteByCid(cid);
	}

	@Override
	public void updateCar(CarInfo car) {
		// TODO Auto-generated method stub
		cdao.updateCar(car);
	}

	@Override
	public void insertCar(CarInfo car) {
		// TODO Auto-generated method stub
		cdao.insertCar(car);
	}

	@Override
	public PageInfo<CarInfo> page(int pageno, String cid) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageno, 5);
		
		List<CarInfo> carlist = cdao.selectCarsByCid(cid);
		
		PageInfo<CarInfo> result = new PageInfo(carlist);
		
		return result;
	}

	@Override
	public List<CarInfo> getCid() {
		// TODO Auto-generated method stub
		return cdao.getCid();
	}
	
	
}
