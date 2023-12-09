package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.CarInfoDao;
import com.ssm.dao.DriverDao;
import com.ssm.dao.FeeRecordDao;
import com.ssm.dao.MoneyRecordDao;
import com.ssm.dao.StationDao;
import com.ssm.pojo.CarInfo;
import com.ssm.pojo.Driver;
import com.ssm.pojo.FeeRecord;
import com.ssm.pojo.MoneyRecord;
@Service
@Transactional
public class FeeRecordServiceImp implements FeeRecordService {
	@Autowired
	private FeeRecordDao fdao;
	@Autowired
	private DriverDao ddao;
	@Autowired
	private StationDao sdao;
	@Autowired
	private CarInfoDao cdao;
	@Autowired
	private MoneyRecordDao mdao;
	@Override
	public PageInfo<FeeRecord> selectAll(int pageno) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageno, 5);
		List<FeeRecord> feelist = fdao.selectAll();
		PageInfo<FeeRecord> result = new PageInfo(feelist);
		return result;
	}

	@Override
	public void insertFee(FeeRecord fee) {
		// TODO Auto-generated method stub
		
		fdao.insertFee(fee);
	}

	@Override
	public void updateFee(int fid,int endid) {
		// TODO Auto-generated method stub
		int fendid = endid;
		int temp;
		int fprice;
		FeeRecord fee = fdao.selectOneByfid(fid);
		int beginid = fee.getBeginid();
		if(endid<beginid) {
			temp = beginid;
			beginid = endid;
			endid = temp;
			int m1 = sdao.sumMoney(beginid, endid);
			int m0 = sdao.selectStationBySid(fendid).getSprice();
			fprice = m1-m0;
		}else {
			int m1 = sdao.sumMoney(beginid, endid);
			int m0 = sdao.selectStationBySid(fee.getBeginid()).getSprice();
			fprice = m1-m0;
		}
		fee.setFprice(fprice);
		fee.setEndid(fendid);
		fdao.updateFee(fee);
		CarInfo car = cdao.selectByCid(fee.getCid());
		Driver driver = ddao.selectByDid(car.getCcard());
		driver.setDmoney(fprice);
		//ddao.updateMaSBydid(driver);
		ddao.updateMoneyBydid(driver);
		MoneyRecord moneyre = new MoneyRecord();
		moneyre.setDid(driver.getDid());
		moneyre.setMmoney(fprice);
		moneyre.setMtype(2);
		mdao.insertMoneyRe(moneyre);
	}

	@Override
	public FeeRecord selectOneByfid(int fid) {
		// TODO Auto-generated method stub
		return fdao.selectOneByfid(fid);
	}

	@Override
	public int selectMoney(int fid, int endid) {
		// TODO Auto-generated method stub
		int fendid = endid;
		int temp;
		int fprice = 0;
		FeeRecord fee = fdao.selectOneByfid(fid);
		int beginid = fee.getBeginid();
		if(endid<beginid) {
			temp = beginid;
			beginid = endid;
			endid = temp;
			int m1 = sdao.sumMoney(beginid, endid);
			int m0 = sdao.selectStationBySid(fendid).getSprice();
			fprice = m1-m0;
		}else {
			int m1 = sdao.sumMoney(beginid, endid);
			int m0 = sdao.selectStationBySid(fee.getBeginid()).getSprice();
			fprice = m1-m0;
		}
		return fprice;
	}

	/*
	 * @Override public List<FeeRecord> selectNotIn() { // TODO Auto-generated
	 * method stub return cdao. }
	 */
	
}
