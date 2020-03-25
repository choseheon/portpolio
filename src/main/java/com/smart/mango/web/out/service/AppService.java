package com.smart.mango.web.out.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.out.dao.IAppDao;

@Service
public class AppService implements IAppService{
	
	@Autowired
	public IAppDao iAppdao;

	@Override
	public int listCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iAppdao.listCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iAppdao.getlist(params);
	}

	@Override
	public void Appday(HashMap<String, String> params) throws Throwable {
		iAppdao.Appday(params);
	}

	@Override
	public HashMap<String, String> getapp(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iAppdao.getapp(params);
	}

	@Override
	public List<HashMap<String, String>> get_sim(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iAppdao.get_sim(params);
	}

	@Override
	public void updateStat(HashMap<String, String> params) throws Throwable {
		iAppdao.updateStat(params);
		
	}

	


}
