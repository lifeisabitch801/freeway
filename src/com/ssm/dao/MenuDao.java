package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.Menu;

public interface MenuDao {
	public List<Menu> selectByMeid();
}
