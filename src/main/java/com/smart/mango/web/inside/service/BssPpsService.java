package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.inside.dao.IBssPpsDao;

@Service
public class BssPpsService implements IBssPpsService{
	
	@Autowired
	public IBssPpsDao iBssPpsDao;

	@Override
	public int getBssPpsCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssPpsDao.getBssPpsCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBssPpsList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssPpsDao.getBssPpsList(params);
	}

	@Override
	public void insertBssPpsAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssPpsDao.insertBssPpsAdd(params);
	}

	@Override
	public HashMap<String, String> getBssPpsOne(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssPpsDao.getBssPpsOne(params);
	}

	@Override
	public void updateBssPpsEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssPpsDao.updateBssPpsEdit(params);
	}

	@Override
	public void updateBssPpsDelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssPpsDao.updateBssPpsDelete(params);
	}

	@Override
	public List<HashMap<String, String>> getDepartList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssPpsDao.getDepartList(params);
	}
}
