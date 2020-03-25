package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.common.dao.ICommonDao;
import com.smart.mango.web.inside.dao.ICompDao;
import com.smart.mango.web.inside.dao.IEmpDao;

@Service
public class CompService implements ICompService {
	@Autowired
	public ICompDao iCompDao;
	@Autowired
	public ICommonDao iCommonDao;

	@Override
	public List<HashMap<String, String>> getCompList(HashMap<String, String> params) throws Throwable {
		return iCompDao.getCompList(params);
	}

	@Override
	public int getCompCnt(HashMap<String, String> params) throws Throwable {
		return iCompDao.getCompCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getGradeList() throws Throwable {
		return iCompDao.getGradeList();
	}

	@Override
	public List<HashMap<String, String>> getStatList() throws Throwable {
		return iCompDao.getStatList();
	}

	@Override
	public int getSectCnt(HashMap<String, String> params) throws Throwable {
		return iCompDao.getSectCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getSectList(HashMap<String, String> params) throws Throwable {
		return iCompDao.getSectList(params);
	}

	@Override
	public int checkSectName(HashMap<String, String> params) throws Throwable {
		return iCompDao.checkSectName(params);
	}

	@Override
	public void insertSect(HashMap<String, String> params) throws Throwable {
		iCompDao.insertSect(params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return iCompDao.getEmpCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		return iCompDao.getEmpList(params);
	}

	@Override
	public int checkCompName(HashMap<String, String> params) throws Throwable {
		return iCompDao.checkCompName(params);
	}

	@Override
	public void insertComp(HashMap<String, String> params) throws Throwable {
		iCompDao.insertComp(params);
	}

	@Override
	public HashMap<String, String> getCompData(HashMap<String, String> params) throws Throwable {
		return iCompDao.getCompData(params);
	}

	@Override
	public List<HashMap<String, String>> getClient(HashMap<String, String> params) throws Throwable {
		return iCompDao.getClient(params);
	}

	@Override
	public int getClientCnt(HashMap<String, String> params) throws Throwable {
		return iCompDao.getClientCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCompOpin(HashMap<String, String> params) throws Throwable {
		return iCompDao.getCompOpin(params);
	}

	@Override
	public void insertCompOpin(HashMap<String, String> params) throws Throwable {
		iCompDao.insertCompOpin(params);
	}

	@Override
	public int getCompOpinCnt(HashMap<String, String> params) throws Throwable {
		return iCompDao.getCompOpinCnt(params);
	}

	@Override
	public void delCompOpin(HashMap<String, String> params) throws Throwable {
		iCompDao.delCompOpin(params);
	}

	@Override
	public List<HashMap<String, String>> getWorkLead(HashMap<String, String> params) throws Throwable {
		return iCompDao.getWorkLead(params);
	}

	@Override
	public List<HashMap<String, String>> getWorkChn(HashMap<String, String> params) throws Throwable {
		return iCompDao.getWorkChn(params);
	}

	@Override
	public void updateComp(HashMap<String, String> params) throws Throwable {
		iCompDao.updateComp(params);
	}

	@Override
	public void deleteComp(HashMap<String, String> params) throws Throwable {
		iCompDao.deleteComp(params);
	}

	@Override
	public List<HashMap<String, String>> getCompSche(HashMap<String, String> params) throws Throwable {
		return iCompDao.getCompSche(params);
	}
	
}
