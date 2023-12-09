package com.ssm.dao;

import java.util.List;

import com.ssm.pojo.IllegalRecord;

public interface IllegalRecordDao {
	//select all illegal
	public List<IllegalRecord> selectAll();
	//dynamic select all illegal
	//public List<IllegalRecord> selectAll(IllegalRecord illegals);
	//update illegal
	public void updateIllegal(Integer iid);
	//insert illegal
	public void insertIllegal(IllegalRecord illegals);
	//select by iid
	public IllegalRecord selectIlByIid(int iid);
	//DYNAMIC
	public List<IllegalRecord> dynamicAll(String searchtime,String cid);
}
