package com.ssm.service;

import java.util.List;

import com.ssm.pojo.Rule;

public interface RuleService {
		//select all rule
		public List<Rule> selectAllRule();
		//select rule by rid
		public Rule selectByRid(int rid);
		//select rule by raction
		public Rule selectByRaction(String raction);
}
