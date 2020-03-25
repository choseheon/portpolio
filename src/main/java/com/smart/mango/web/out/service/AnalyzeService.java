package com.smart.mango.web.out.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.out.dao.IAnalyzeDao;

@Service
public class AnalyzeService implements IAnalyzeService {
	
	@Autowired
	public IAnalyzeDao iAnalyzeDao;

	@Override
	public void insertFeedb(HashMap<String, String> params) throws Throwable {
		iAnalyzeDao.insertFeedb(params);
	}

	@Override
	public int getFeedbCnt(HashMap<String, String> params) throws Throwable {
		return iAnalyzeDao.getFeedbCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getFeedbList(HashMap<String, String> params) throws Throwable {
		return iAnalyzeDao.getFeedbList(params);
	}

	@Override
	public List<HashMap<String, String>> getCmpTitle(HashMap<String, String> params) throws Throwable {
		return iAnalyzeDao.getCmpTitle(params);
	}
}
