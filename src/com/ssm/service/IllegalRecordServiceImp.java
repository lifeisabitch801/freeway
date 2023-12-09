package com.ssm.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.CarInfoDao;
import com.ssm.dao.DriverDao;
import com.ssm.dao.IllegalRecordDao;
import com.ssm.dao.MoneyRecordDao;
import com.ssm.pojo.CarInfo;
import com.ssm.pojo.Driver;
import com.ssm.pojo.IllegalRecord;
import com.ssm.pojo.MoneyRecord;
@Service
@Transactional
public class IllegalRecordServiceImp implements IllegalRecordService {
	
	@Autowired
	private IllegalRecordDao idao;
	@Autowired
	private DriverDao ddao;
	@Autowired
	private CarInfoDao cdao;
	@Autowired
	private MoneyRecordDao mdao;
	
	@Override
	public void updateIllegal(String cid,  String rlocation, Integer rid, 
			Integer rmoney,Integer rscore, Integer iid) {
		// TODO Auto-generated method stub
		CarInfo car = cdao.selectByCid(cid);
		Driver driver = new Driver();
		driver.setDid(car.getCcard());
		driver.setDmoney(rmoney);
		driver.setDscore(rscore);
		ddao.updateMaSBydid(driver);
		MoneyRecord moneyre = new MoneyRecord();
		//moneyre.setMcreatetime(mcreatetime);
		moneyre.setDid(car.getCcard());
		moneyre.setMtype(3);
		moneyre.setMmoney(rmoney);
		mdao.insertMoneyRe(moneyre);
		idao.updateIllegal(iid);
	}

	@Override
	public void insertIllegal(IllegalRecord illegals) {
		// TODO Auto-generated method stub
		idao.insertIllegal(illegals);
	}

	@Override
	public List<IllegalRecord> selectAll() {
		// TODO Auto-generated method stub
		return idao.selectAll();
	}

	@Override
	public IllegalRecord selectIlByIid(int iid) {
		// TODO Auto-generated method stub
		return idao.selectIlByIid(iid);
	}

	@Override
	public PageInfo<IllegalRecord> searchIl(int pageno) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageno,5);
		List<IllegalRecord> illist = idao.selectAll();
		PageInfo<IllegalRecord> result = new PageInfo(illist);
		return result;
	}

	@Override
	public PageInfo<IllegalRecord> selectByTwo(int pageno, String cid, int optime) throws Exception {
		// TODO Auto-generated method stub
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 String searchtime;
		 String datestr = sdf.format(new Date());//获取系统当前时间
		 Date date=sdf.parse(datestr);
		 Calendar rightNow = Calendar.getInstance();
		 rightNow.setTime(date);
		 if(optime==1) {
			 rightNow.add(Calendar.DAY_OF_YEAR,-7);//日期-7天
			 Date dt1=rightNow.getTime();
			 searchtime = sdf.format(dt1);
		 }else if(optime==2) {
			 rightNow.add(Calendar.MONTH,-1);//日期-1个月
			 Date dt1=rightNow.getTime();
			 searchtime = sdf.format(dt1);
		 }else if(optime==3) {
			 rightNow.add(Calendar.MONTH,-3);//日期-3个月
			 Date dt1=rightNow.getTime();
			 searchtime = sdf.format(dt1);
		 }else {
			 searchtime = null;
		 }
		 PageHelper.startPage(pageno, 5);
		 List<IllegalRecord> illist = idao.dynamicAll(searchtime, cid);
		 PageInfo<IllegalRecord> result = new PageInfo(illist);
		
		 return result;
	}
	
}
