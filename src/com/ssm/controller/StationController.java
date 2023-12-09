package com.ssm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Station;
import com.ssm.pojo.Users;
import com.ssm.service.StationService;

@Controller
@RequestMapping("station")
public class StationController {
	
	@Autowired
	private StationService sservice;
	
	@RequestMapping("selectallstation")
	public String selectAllStation(Model model) {
		List<Station> stationlist = sservice.selectALLStation();
		model.addAttribute("stationlist", stationlist);
		return selectStations(1,"",model);
		//return null;
	}
	//TO INSERT STATION
	@RequestMapping("toinsertstation")
	public String toInsertStation() {
		return "insertstation";
	}
	//VALID UPWD
	@ResponseBody
	@RequestMapping("validsname")
	public String validSname(String sname) {
		Station station = sservice.selectStationBySname(sname);
		if(station != null) {
			return "error";
		}else {
			return "ok";
		}
	}
	//INSERT STATION
	@RequestMapping("insertstation")
	public String insertStation(Station station,Model model) {
		sservice.insertStation(station);
		return selectStations(1,"",model);
	}
	//DELETE STATION
	@RequestMapping("deletestation")
	public String deleteStation(int sid,Model model) {
		sservice.deleteStation(sid);
		return selectStations(1,"",model);
	}
	//TO UPDATE STATION
	@RequestMapping("toupdatestation")
	public String toUpdateStation(Integer sid,Model model) {
		//int sid1 = Integer.parseInt(sid);
		Station station = sservice.selectStationBySid(sid);
		model.addAttribute(station);
		return "updatestation";
	}
	//UPDATE STATION
	@RequestMapping("updatestation")
	public String updateStation(Station station,Model model) {
		sservice.updateStation(station);
		//return selectAllStation(model);
		return selectStations(1,"",model);
	
	}
	@RequestMapping("stationslist")
	public String selectStations(int pageno,String searchname,Model model) {
		//List<Station> stationlist = sservice.selectStationsBySname(sname);
		//model.addAttribute("stationlist", stationlist);
		PageInfo<Station> stationpage = sservice.page(pageno, searchname);
		model.addAttribute("stationpage", stationpage);
		return "stationlist";
	}
}
