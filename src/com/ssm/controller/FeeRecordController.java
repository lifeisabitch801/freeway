package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.CarInfo;
import com.ssm.pojo.Driver;
import com.ssm.pojo.FeeRecord;
import com.ssm.pojo.Station;
import com.ssm.service.CarInfoService;
import com.ssm.service.DriverService;
import com.ssm.service.FeeRecordService;
import com.ssm.service.StationService;

@Controller
@RequestMapping("feerecord")
public class FeeRecordController {
	
	@Autowired
	private FeeRecordService fservice;
	@Autowired
	private StationService sservice;
	@Autowired
	private CarInfoService cservice;
	@Autowired
	private DriverService dservice;
	
	@RequestMapping("feerecordlist")
	public String allFee(int pageno,Model model,Model model1,Model model2) {
		
		List<Station> slist = sservice.selectALLStation();
		model1.addAttribute("slist", slist);
		
		//List<CarInfo> clist = cservice.selectAllCar();
		List<CarInfo> clist = cservice.getCid();
		model1.addAttribute("clist", clist);
		
		PageInfo<FeeRecord> feepage = fservice.selectAll(pageno);
		model.addAttribute("feepage", feepage);
		return "feelist";
	}
	
	@RequestMapping("insertfee")
	public String insertFee(FeeRecord fee,Model model,Model model1,Model model2) {
		fservice.insertFee(fee);
		return allFee(1,model,model1,model2);
	}
	@RequestMapping("toupdatefee")
	public String toUpdateFee(int fid,Model model,Model model1,Model model2) {
		FeeRecord fee = fservice.selectOneByfid(fid);
		CarInfo car = cservice.selectByCid(fee.getCid());
		Driver driver = dservice.selectByDid(car.getCcard());
		List<Station> slist = sservice.selectALLStation();
		model.addAttribute("slist", slist);
		model1.addAttribute("fee", fee);
		model2.addAttribute("driver", driver);
		return "feerecord";
	}
	@ResponseBody
	@RequestMapping("validmoney")
	public String validMoney(int fid,int endid) {
		String resp = fservice.selectMoney(fid, endid)+"";
		System.out.println("==================="+resp+"===================");
		return resp;
	}
	@RequestMapping("updatefee")
	public String updateFee(int fid,int endid,Model model,Model model1,Model model2) {
		fservice.updateFee(fid, endid);
		return allFee(1,model,model1,model2);
	}
	@RequestMapping("toupdatemoney")
	public String toUpdateMoney(String cid,int fid,Model model,Model model1) {
		CarInfo car = cservice.selectByCid(cid);
		Driver driver = dservice.selectByDid(car.getCcard());
		model.addAttribute("driver", driver);
		model.addAttribute("fid", fid);
		return "updatemoneyfee";
	}
	@RequestMapping("updatemoneyfee")
	public String updateMoney(Driver driver,Integer oldm,int fid,Model model,Model model1,Model model2) {
		int addm = driver.getDmoney();
		Integer nowm = oldm+driver.getDmoney();
		driver.setDmoney(nowm);
		dservice.updateDriverMoney(driver,addm);
		return toUpdateFee(fid,model,model1,model2);
	}
}
