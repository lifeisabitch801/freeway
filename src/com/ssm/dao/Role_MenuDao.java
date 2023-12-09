package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.Role_Menu;

public interface Role_MenuDao {
	public List<Role_Menu> selectByRoid(int roid);
}
