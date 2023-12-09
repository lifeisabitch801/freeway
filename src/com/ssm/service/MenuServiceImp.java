package com.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.MenuDao;
import com.ssm.pojo.Menu;
@Service
@Transactional
public class MenuServiceImp implements MenuService {
	@Autowired
	private MenuDao medao;
	@Override
	public List<Menu> selectByMeid( ) {
		// TODO Auto-generated method stub
		return medao.selectByMeid();
	}

}
