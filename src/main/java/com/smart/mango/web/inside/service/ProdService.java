package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.common.dao.ICommonDao;
import com.smart.mango.web.inside.dao.IProdDao;

@Service
public class ProdService implements IProdService{
	@Autowired
	public IProdDao iProdDao;
	@Autowired
	public ICommonDao iCommonDao;
	@Override
	public List<HashMap<String, String>> getServiceList(HashMap<String, String> params) throws Throwable {
		return iProdDao.getServiceList(params);
	}
	@Override
	public List<HashMap<String, String>> getGoodsList(HashMap<String, String> params) throws Throwable {
		return iProdDao.getGoodsList(params);
	}
	@Override
	public void addgoodsdata(HashMap<String, String> params) throws Throwable {
		iProdDao.addgoodsdata(params);
		
	}
	@Override
	public void addservicedata(HashMap<String, String> params) throws Throwable {
		iProdDao.addservicedata(params);
		
	}
	@Override
	public HashMap<String, String> getdata(HashMap<String, String> params) throws Throwable {
		return iProdDao.getdata(params);
	}
	@Override
	public void Detdeletedata(HashMap<String, String> params) throws Throwable {
		iProdDao.Detdeletedata(params);
		
	}
	@Override
	public int getgoodslistCnt(HashMap<String, String> params) throws Throwable {
		return iProdDao.getgoodslistCnt(params);
	}
	@Override
	public int getservicelistCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iProdDao.getservicelistCnt(params);
	}
	@Override
	public void addproddata(HashMap<String, String> params) throws Throwable {
		iProdDao.addproddata(params);
		
	}
	@Override
	public void prodSEQ(HashMap<String, String> params) throws Throwable {
		iProdDao.prodSEQ(params);
		
	}
	@Override
	public HashMap<String, String> getLastProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iProdDao.getLastProd(params);
	}
	/*
	 * @Override public HashMap<String, String> getproddata(HashMap<String, String>
	 * params) throws Throwable { return iProdDao.getproddata(params); }
	 */
	@Override
	public void updatedata(HashMap<String, String> params) throws Throwable {
		iProdDao.updatedata(params);
		
	}
	@Override
	public void update2data(HashMap<String, String> params) throws Throwable {
		iProdDao.update2data(params);
		
	}
	@Override
	public void Detdeletedata2(HashMap<String, String> params) throws Throwable {
		iProdDao.Detdeletedata2(params);
		
	}

}
