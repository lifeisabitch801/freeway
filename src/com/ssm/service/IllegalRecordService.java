package com.ssm.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.ssm.pojo.IllegalRecord;

public interface IllegalRecordService {
		//update illegal
		public void updateIllegal(String cid,String rlocation,Integer rid,
				Integer rmoney,Integer rscore,Integer iid);
		//insert illegal
		public void insertIllegal(IllegalRecord illegals);
		//select all illegal
		public List<IllegalRecord> selectAll();
		//select by iid
		public IllegalRecord selectIlByIid(int iid);
		//PAGE---DYNAMIC
		public PageInfo<IllegalRecord> searchIl(int pageno);
		//SELECT BY CID AND RCREATETIME
		public PageInfo<IllegalRecord> selectByTwo(int pageno,String cid,int optime)throws Exception;
}
