package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.inside.dao.IDepartDao;

@Service
public class DepartService implements IDepartService {
	@Autowired
	public IDepartDao iDepartDao;

	@Override
	public List<HashMap<String, String>> getSuch(HashMap<String, String> params) throws Throwable {
		return iDepartDao.getSuch(params);
	}
	@Override
	public List<HashMap<String, String>> getDepartList(HashMap<String, String> params) throws Throwable {
		return iDepartDao.getDepartList(params);
	}
	@Override
	public List<HashMap<String, String>> getTeamList(HashMap<String, String> params) throws Throwable {
		return iDepartDao.getTeamList(params);
	}
	@Override
	public HashMap<String, String> getDepartInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDepartDao.getDepartInfo(params);
	}
	@Override
	public void insertDepart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iDepartDao.insertDepart(params);
	}
	@Override
	public HashMap<String, String> getDepartMgr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDepartDao.getDepartMgr(params);
	}
	@Override
	public void insertTeam(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iDepartDao.insertTeam(params);
	}
	@Override
	public HashMap<String, String> getTeamMgr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDepartDao.getTeamMgr(params);
	}
	@Override
	public int getEmpDepartCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDepartDao.getEmpDepartCnt(params);
	}
	@Override
	public List<HashMap<String, String>> getEmpDepartList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDepartDao.getEmpDepartList(params);
	}
	@Override
	public void departEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iDepartDao.departEdit(params);
	}
	@Override
	public void departMgrEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iDepartDao.departMgrEdit(params);
	}
	@Override
	public HashMap<String, String> getMgr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDepartDao.getMgr(params);
	}
	@Override
	public HashMap<String, String> getTeamInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDepartDao.getTeamInfo(params);
	}
	@Override
	public void teamEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iDepartDao.teamEdit(params);
	}
	@Override
	public void teamMgrEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iDepartDao.teamMgrEdit(params);
	}
	@Override
	public HashMap<String, String> getTMgr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iDepartDao.getTMgr(params);
	}
	
}


