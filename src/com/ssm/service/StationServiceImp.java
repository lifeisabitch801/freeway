package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.dao.StationDao;
import com.ssm.pojo.Station;
@Service
@Transactional
public class StationServiceImp implements StationService {
	
	@Autowired
	private StationDao sdao;
	@Override
	public List<Station> selectALLStation() {
		// TODO Auto-generated method stub
		return sdao.selectALLStation();
	}

	@Override
	public void insertStation(Station station) {
		// TODO Auto-generated method stub
		sdao.insertStation(station);
	}

	@Override
	public void updateStation(Station station) {
		// TODO Auto-generated method stub
		sdao.updateStation(station);
	}

	@Override
	public void deleteStation(int sid) {
		// TODO Auto-generated method stub
		sdao.deleteStation(sid);
	}

	@Override
	public Station selectStationBySname(String sname) {
		// TODO Auto-generated method stub
		return sdao.selectStationBySname(sname);
	}

	@Override
	public Station selectStationBySid(int sid) {
		// TODO Auto-generated method stub
		return sdao.selectStationBySid(sid);
	}

	@Override
	public List<Station> selectStationsBySname(String sname) {
		// TODO Auto-generated method stub
		return sdao.selectStationsBySname(sname);
	}
	//分页

	@Override
	public PageInfo<Station> page(int pageno, String sname) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageno, 5);
		
		List<Station> stationlist = sdao.selectStationsBySname(sname);
		
		PageInfo<Station> result = new PageInfo(stationlist);
		
		System.out.println("一共"+result.getPageSize()+"页");
		System.out.println("一共"+result.getTotal()+"记录");
		System.out.println("当前站点列表"+result.getList());
		
		return result;
	}
			
}
