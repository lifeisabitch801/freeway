package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.Role_MenuDao;
import com.ssm.pojo.Role_Menu;
@Service
@Transactional
public class Role_MenuServiceImp implements Role_MenuService {
	@Autowired
	private Role_MenuDao rmdao;
	@Override
	public List<Role_Menu> selectByRoid(int roid) {
		// TODO Auto-generated method stub
		return rmdao.selectByRoid(roid);
				
	}

}
