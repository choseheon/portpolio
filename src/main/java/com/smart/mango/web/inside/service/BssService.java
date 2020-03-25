package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.inside.dao.IBssDao;

@Service
public class BssService implements IBssService {
	@Autowired
	public IBssDao iBssDao;

	@Override
	public List<HashMap<String, String>> getBssList(HashMap<String, String> params) throws Throwable {
		return iBssDao.getBssList(params);
	}

	@Override
	public int getBssCnt(HashMap<String, String> params) throws Throwable {
		return iBssDao.getBssCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBss(HashMap<String, String> params) throws Throwable {
		return iBssDao.getBss(params);
	}

	@Override
	public List<HashMap<String, String>> getLeadList(HashMap<String, String> params) throws Throwable {
		return iBssDao.getLeadList(params);
	}

	@Override
	public HashMap<String, String> getBssNo(HashMap<String, String> params) throws Throwable {
		return iBssDao.getBssNo(params);
	}

}

