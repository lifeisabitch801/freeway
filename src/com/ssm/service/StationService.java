package com.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Station;

public interface StationService {
	//SELECT ALL STATION
		public List<Station> selectALLStation();
		//INSERT STATION
		public void insertStation(Station station);
		//UPDATE STATION
		public void updateStation(Station station);
		//DELETE STATION
		public void deleteStation(int sid);
		//SELECT STATION BY SNAME
		public Station selectStationBySname(String sname);
		//SELECT STATION BY SID
		public Station selectStationBySid(int sid);
		//动态查询
		public List<Station> selectStationsBySname(String sname);
		//分页
		public PageInfo<Station> page(int pageno,String sname);
}
