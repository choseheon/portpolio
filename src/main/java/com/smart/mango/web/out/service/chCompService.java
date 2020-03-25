package com.smart.mango.web.out.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.out.dao.IchCompDao;

@Service
public class chCompService implements IchCompService{
	@Autowired
	public IchCompDao ichcompdao;

	public List<HashMap<String, String>> getComp(HashMap<String, String> params) throws Throwable{
		return ichcompdao.getComp(params);
	}

	public int CompCnt(HashMap<String, String> params) throws Throwable{
		return ichcompdao.CompCnt(params);
	}

	@Override
	public void saveComp(HashMap<String, String> params) throws Throwable {
		ichcompdao.saveComp(params);
	}

	@Override
	public List<HashMap<String, String>> getCh(HashMap<String, String> params) throws Throwable {
		return ichcompdao.getCh(params);
	}
}
