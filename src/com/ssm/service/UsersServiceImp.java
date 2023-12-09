package com.ssm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssm.dao.UsersDao;
import com.ssm.pojo.Users;
@Service
@Transactional
public class UsersServiceImp implements UsersService {
	
	@Autowired
	private UsersDao udao;
	
	@Override
	public Users selectByUid(String uid) {
		// TODO Auto-generated method stub
		return udao.selectByUid(uid);
	}

	@Override
	public Users selectByUidAndUpwd(String uid, String upwd) {
		// TODO Auto-generated method stub
		return udao.selectByUidAndUpwd(uid, upwd);
	}

	@Override
	public void updateUpwd(Users users) {
		// TODO Auto-generated method stub
		udao.updateUpwd(users);
	}

	@Override
	public void updateUserInfo(Users users) {
		// TODO Auto-generated method stub
		udao.updateUserInfo(users);
	}

	@Override
	public void updateUserUface(Users users) {
		// TODO Auto-generated method stub
		udao.updateUserUface(users);
	}
	
}
