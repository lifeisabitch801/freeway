package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.CarInfo;
import com.ssm.pojo.IllegalRecord;
import com.ssm.pojo.Rule;
import com.ssm.service.CarInfoService;
import com.ssm.service.IllegalRecordService;
import com.ssm.service.RuleService;

@Controller
@RequestMapping("illegalre")
public class IllegalRecordController {
	
	@Autowired
	private IllegalRecordService iservice;
	@Autowired
	private RuleService rservice;
	@Autowired
	private CarInfoService cservice;
	
	@RequestMapping("allillegals")
	public String allIllegals(int pageno,String cid,int optime,Model model,Model model1) throws Exception {
		PageInfo<IllegalRecord> illist = iservice.selectByTwo(pageno, cid, optime);
		//List<IllegalRecord> illist = iservice.selectAll();
		List<Rule> rlist = rservice.selectAllRule();
//		for(IllegalRecord data: illist) {
//			System.out.println(data);
//		}
		model.addAttribute("illist", illist);
		model1.addAttribute("rlist", rlist);
		return "illegalrecordlist";
	}
	@RequestMapping("toinsertillegals")
	public String toInsertIllegals(Model model1) {
		List<Rule> rlist = rservice.selectAllRule();
		model1.addAttribute("rlist", rlist);
		List<CarInfo> clist = cservice.selectAllCar();
		model1.addAttribute("clist", clist);
		return "insertillegals";
	}
	@RequestMapping("insertillegals")
	public String insertIllegals(String date1,String time1,IllegalRecord illegals,Model model,Model model1) throws Exception {
		String createtime = date1+" "+time1+":00";
		illegals.setRcreatetime(createtime);
		iservice.insertIllegal(illegals);
		return allIllegals(1,"",0,model,model1);
	}
	@RequestMapping("toupdaterstate")
	public String toUpdateRstate(int iid,Model model,Model model1,Model model2) {
		IllegalRecord ill = iservice.selectIlByIid(iid);
		model.addAttribute("ill", ill);
		Rule rule = rservice.selectByRid(ill.getRid());
		model1.addAttribute("rule", rule);
		//CarInfo car = cservice.selectAllCar();
		List<Rule> rlist = rservice.selectAllRule();
		model2.addAttribute("rlist", rlist);
		return "handleil";
	}
	@RequestMapping("updaterstate")
	public String updateRstate(String cid,String rlocation,Integer rid,
			 Integer rmoney,Integer rscore,Integer iid,Model model,Model model1) throws Exception {
		//iservice.updateIllegal(illegals);
		//String mcreatetime = date1+" "+time1+":00";
		iservice.updateIllegal(cid,rlocation,rid, rmoney, rscore, iid);
		return allIllegals(1,"",0,model,model1);
	}
//	@RequestMapping("dynamicall")
//	public String dynameicAll(int pageno,String optime) {
//		return "illegalrecordlist";
//	}
}
