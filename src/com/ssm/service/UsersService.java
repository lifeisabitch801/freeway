package com.ssm.service;

import com.ssm.pojo.Users;

public interface UsersService {
		//SELECT USER BY UID
		public Users selectByUid(String uid) ;
		//SELECT USER BY UID AND UPWD
		public Users selectByUidAndUpwd(String uid,String upwd) ;
		//UPDATE USER ---PASSWORD
		public void updateUpwd(Users users);
		//UPDATE USER INFO
		public void updateUserInfo(Users users);
		//UPDATE USER UFACE
		public void updateUserUface(Users users);
}
