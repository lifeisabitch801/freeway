package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.Driver;
import com.ssm.service.DriverService;

@Controller
@RequestMapping("driver")
public class DriverController {
	
	@Autowired
	private DriverService dservice;
	@RequestMapping("selectalldriver")
	public String selectAllDriver(Model model) {
		List<Driver> dlist = dservice.selectAllDriver();
		model.addAttribute("dlist", dlist);
		return selectDrivers(1,"",model);
	}
	@RequestMapping("toinsertdriver")
	public String toInsertDriver() {
		return "insertdriver";
	}
	@RequestMapping("insertdriver")
	public String insertDriver(Driver driver,Model model) {
		dservice.insertDriver(driver);
		return selectDrivers(1,"",model);
	}
	@RequestMapping("deletedriver")
	public String deleteDriver(String did,Model model) {
		dservice.deleteDriver(did);
		return selectDrivers(1,"",model);
	}
	@RequestMapping("toupdatedriver")
	public String toUpdateDriver(String did,Model model) {
		Driver driver = dservice.selectByDid(did);
		model.addAttribute(driver);
		return "updatedriver";
	} 
	@ResponseBody
	@RequestMapping("validdid")
	public String validDid(String did) {
		Driver driver = dservice.selectByDid(did);
		if(driver != null) {
			return "error";
		}else {
			return "ok";
		}
	}
	@RequestMapping("updatedriver")
	public String updateDriver(Driver driver,Model model) {
		dservice.updateDriver(driver);
		return selectDrivers(1,"",model);
	}
	@RequestMapping("toupdatemoney")
	public String toUpdateMoney(String did,Model model2,Model model1) {
		List<Driver> dlist = dservice.selectAllDriver();
		model1.addAttribute("dlist", dlist);
		Driver driver = dservice.selectByDid(did);
		model2.addAttribute(driver);
		return "updatemoney";
	} 
	@RequestMapping("updatemoney")
	public String updateMoney(Driver driver,Integer oldm,Model model) {
		int addm = driver.getDmoney();
		Integer nowm = oldm+driver.getDmoney();
		driver.setDmoney(nowm);
		dservice.updateDriverMoney(driver,addm);
		return selectDrivers(1,"",model);
	}
	@RequestMapping("selectdrivers")
	public String selectDrivers(int pageno,String searchdid,Model model) {
		PageInfo<Driver> driverpage = dservice.page(pageno, searchdid);
		model.addAttribute("driverpage", driverpage);
		return "driverlist";
	}
//	@RequestMapping("updatemoneyfee")
//	public String updateMoneyFee(Driver driver,Integer oldm,Model model) {
//		int addm = driver.getDmoney();
//		Integer nowm = oldm+driver.getDmoney();
//		driver.setDmoney(nowm);
//		dservice.updateDriverMoney(driver,addm);
//		return selectDrivers(1,"",model);
//	}
}
