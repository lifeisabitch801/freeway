package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.CarInfo;
import com.ssm.pojo.Driver;
import com.ssm.service.CarInfoService;
import com.ssm.service.DriverService;

@Controller
@RequestMapping("carinfo")
public class CarInfoController {

	@Autowired
	private CarInfoService cservice;
	@Autowired
	private DriverService dservice;
	
	@RequestMapping("selectallcar")
	public String selectAllCar(Model model) {
		List<CarInfo> carlist = cservice.selectAllCar();
		model.addAttribute("carlist", carlist);
		return selectCars(1,"",model);
	}
	
	@RequestMapping("deletecar")
	public String deleteCar(String cid,Model model) {
		cservice.deleteByCid(cid);
		return selectCars(1,"",model);
	}
	@RequestMapping("toinsertcar")
	public String toInsertCar(Model model1) {
		List<Driver> driverlist = dservice.selectAllDriver();
		model1.addAttribute("driverlist", driverlist);
		return "insertcar";
	}
	@RequestMapping("insertcar")
	public String insertCar(CarInfo car,Model model) {
		cservice.insertCar(car);
		return selectCars(1,"",model);
	}
	
	@RequestMapping("toupdatecar")
	public String toUpdateCar(String cid,Model model,Model model1) {
		List<Driver> driverlist = dservice.selectAllDriver();
		model1.addAttribute("driverlist", driverlist);
		CarInfo c = cservice.selectByCid(cid);
		System.out.println(c);
		model.addAttribute("c", c);
		//model.addAttribute(c);
		return "updatecar";
	}
	@RequestMapping("updatecar")
	public String updateCar(CarInfo car,Model model) {
		cservice.updateCar(car);
		return selectCars(1,"",model);
	}
	@RequestMapping("selectcars")
	public String selectCars(int pageno,String searchcid,Model model) {
		PageInfo<CarInfo> carpage = cservice.page(pageno, searchcid);
		model.addAttribute("carpage", carpage);
		return "carlist";
	}
}
