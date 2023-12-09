package com.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.pojo.Rule;
import com.ssm.service.RuleService;

@Controller
@RequestMapping("rule")
public class RuleController {
	@Autowired
	private RuleService rservice;
	
	@RequestMapping("selectallrule")
	public String selectAllRule(Model model) {
		List<Rule> rlist = rservice.selectAllRule();
		model.addAttribute("rlist", rlist);
		return null;
	}
	
	@RequestMapping("selectbyrid")
	public String selectByRid(Integer rid,Model model) {
		Rule r = rservice.selectByRid(rid);
		model.addAttribute(r);
		return null;
	}
	
	@RequestMapping("selectbyraction")
	public String selectByRaction(String raction,Model model) {
		Rule r = rservice.selectByRaction(raction);
		model.addAttribute(r);
		return null;
	}
	
}
