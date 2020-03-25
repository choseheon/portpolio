package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.common.dao.ICommonDao;
import com.smart.mango.web.inside.dao.ILeadDao;

@Service
public class LeadService implements ILeadService{
	@Autowired
	public ILeadDao iLeadDao;
	
	@Autowired
	public ICommonDao iCommonDao;

	@Override
	public List<HashMap<String, String>> getLeadlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getLeadlist(params);
	}

	@Override
	public int getleadCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getleadCnt(params);
	}

	@Override
	public void editLs(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.editLs(params);
	}

	@Override
	public List<HashMap<String, String>> getclientList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getclientList(params);
	}

	@Override
	public int getpopCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getpopCnt(params);
	}

	@Override
	public HashMap<String, String> getLeadData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getLeadData(params);
	}

	@Override
	public void insertLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.insertLead(params);
	}

	@Override
	public List<HashMap<String, String>> getClient(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getClinet(params);
	}

	@Override
	public int getClientCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getClientCnt(params);
	}

	@Override
	public void deleteLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.deleteLead(params);
	}

	@Override
	public List<HashMap<String, String>> getLeadOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getLeadOpin(params);
	}

	@Override
	public void addLeadOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.addLeadOpin(params);
	}

	@Override
	public void delLeadOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.delLeadOpin(params);
	}

	@Override
	public void modLeadStat(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.modLeadStat(params);
	}

	@Override
	public int getLeadOpinCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getLeadOpinCnt(params);
	}

	@Override
	public void insertattach(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.insertattach(params);
	}

	@Override
	public List<HashMap<String, String>> getattachlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getattachlist(params);
	}

	@Override
	public void updateattach(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.updateattach(params);
	}

	@Override
	public HashMap<String, String> updateList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.updateList(params);
	}

	@Override
	public void updateLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.updateLead(params);
	}

	@Override
	public List<HashMap<String, String>> getLeadSche(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getLeadSche(params);
	}

	@Override
	public void insertChn(HashMap<String, String> params) throws Throwable {
		iLeadDao.insertChn(params);
	}

	@Override
	public int chkBssChn(HashMap<String, String> params) throws Throwable {
		return iLeadDao.chkBssChn(params);
	}

	@Override
	public void leadchk(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iLeadDao.leadchk(params);
	}

	@Override
	public void leadchkreset() throws Throwable {
		iLeadDao.leadchkreset();
	}

	@Override
	public List<HashMap<String, String>> getLeadCard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iLeadDao.getLeadCard(params);
	}
}
