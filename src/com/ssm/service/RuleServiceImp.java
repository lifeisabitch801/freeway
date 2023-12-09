package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.RuleDao;
import com.ssm.pojo.Rule;

@Service
@Transactional
public class RuleServiceImp implements RuleService {
	
	@Autowired
	private RuleDao rdao;
	
	@Override
	public List<Rule> selectAllRule() {
		// TODO Auto-generated method stub
		return rdao.selectAllRule();
	}

	@Override
	public Rule selectByRid(int rid) {
		// TODO Auto-generated method stub
		return rdao.selectByRid(rid);
	}

	@Override
	public Rule selectByRaction(String raction) {
		// TODO Auto-generated method stub
		return rdao.selectByRaction(raction);
	}

}
