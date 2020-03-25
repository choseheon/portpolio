package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.common.dao.ICommonDao;
import com.smart.mango.web.inside.dao.IEmpDao;

@Service
public class EmpService implements IEmpService {
	@Autowired
	public IEmpDao iEmpDao;
	
	@Autowired
	public ICommonDao iCommonDao;

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		return iEmpDao.getEmpList(params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return iEmpDao.getEmpCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getPosiList(HashMap<String, String> params) throws Throwable {
		return iEmpDao.getPosiList(params);
	}

	@Override
	public List<HashMap<String, String>> getFormList() throws Throwable {
		return iEmpDao.getFormList();
	}

	@Override
	public List<HashMap<String, String>> getDepartList() throws Throwable {
		return iEmpDao.getDepartList();
	}

	@Override
	public List<HashMap<String, String>> getAuthorList() throws Throwable {
		return iEmpDao.getAuthorList();
	}

	@Override
	public List<HashMap<String, String>> getTeamList(HashMap<String, String> params) throws Throwable {
		return iEmpDao.getTeamList(params);
	}

	@Override
	public void insertEmp(HashMap<String, String> params) throws Throwable {
		iEmpDao.insertEmp(params);
	}

	@Override
	public HashMap<String, String> getEmpData(HashMap<String, String> params) throws Throwable {
		return iEmpDao.setEmpData(params);
	}

	@Override
	public int getTeamEmpCnt(HashMap<String, String> params) throws Throwable {
		return iEmpDao.getTeamEmpCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getTeamEmp(HashMap<String, String> params) throws Throwable {
		return iEmpDao.getTeamEmp(params);
	}

	@Override
	public int checkEmail(HashMap<String, String> params) throws Throwable {
		return iEmpDao.checkEmail(params);
	}

	@Override
	public int checkEmpId(HashMap<String, String> params) throws Throwable {
		return iEmpDao.checkEmpId(params);
	}

	@Override
	public void updateEmp(HashMap<String, String> params) throws Throwable {
		iEmpDao.updateEmp(params);
	}

	@Override
	public void deleteEmp(HashMap<String, String> params) throws Throwable {
		iEmpDao.deleteEmp(params);
	}
}
