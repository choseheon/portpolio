package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.common.dao.ICommonDao;
import com.smart.mango.web.inside.dao.IScheDao;

@Service
public class ScheService implements IScheService{
	
	@Autowired
	public IScheDao iScheDao;
	
	@Autowired
	public ICommonDao iCommonDao;

	@Override
	public void insertSche(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.insertSche(params);
	}
	
	@Override
	public int getScheNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getScheNo(params);
	}
	
	@Override
	public void insertScheClient(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.insertScheClient(params);
	}

	@Override
	public void insertOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.insertOpin(params);
	}

	@Override
	public List<HashMap<String, String>> scheList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.scheList(params);
	}

	@Override
	public int getClientCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getClientCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getClientList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getClientList(params);
	}

	@Override
	public HashMap<String, String> getScheData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getScheData(params);
	}

	@Override
	public HashMap<String, String> getCiData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getCiData(params);
	}

	@Override
	public List<HashMap<String, String>> getOpinList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getOpinList(params);
	}

	@Override
	public int getOpinCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getOpinCnt(params);
	}

	@Override
	public void deleteOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.deleteOpin(params);
	}

	@Override
	public List<HashMap<String, String>> getRadioList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getRadioList(params);
	}

	@Override
	public List<HashMap<String, String>> getOptionList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getOptionList(params);
	}

	@Override
	public int getLeadCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getLeadCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getLeadList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getLeadList(params);
	}

	@Override
	public int getBssCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getBssCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getBssList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getBssList(params);
	}

	@Override
	public void insertScheLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.insertScheLead(params);
	}

	@Override
	public void insertScheBss(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.insertScheBss(params);
	}

	@Override
	public int getScheBssProgNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getScheBssProgNo(params);
	}

	@Override
	public int getDivCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getDivCnt(params);
	}

	@Override
	public HashMap<String, String> getLeadData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getLeadData(params);
	}

	@Override
	public HashMap<String, String> getBssData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getBssData(params);
	}

	@Override
	public String getScheFixData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getScheFixData(params);
	}

	@Override
	public void updateSche(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.updateSche(params);
	}

	@Override
	public void updateScheClient(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.updateScheClient(params);
	}

	@Override
	public void updateScheLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.updateScheLead(params);
	}

	@Override
	public void updateScheBss(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.updateScheBss(params);
	}

	@Override
	public void deleteSche(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.deleteSche(params);
	}

	@Override
	public void insertScheAttach(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.insertScheAttach(params);
	}

	@Override
	public List<HashMap<String, String>> getAttachList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getAttachList(params);
	}

	@Override
	public List<HashMap<String, String>> getMinutesList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getMinutesList(params);
	}

	@Override
	public List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getProdList(params);
	}

	@Override
	public int getAttachCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getAttachCnt(params);
	}

	@Override
	public int getMinutesCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getMinutesCnt(params);
	}

	@Override
	public int getProdCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getProdCnt(params);
	}

	@Override
	public void deleteAttach(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.deleteAttach(params);
	}

	@Override
	public int getScheListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getScheListCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getScheList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getScheList(params);
	}

	@Override
	public void insertScheMinutes(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.insertScheMinutes(params);
	}

	@Override
	public void deleteMinutes(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.deleteMinutes(params);
	}

	@Override
	public HashMap<String, String> getMinutesData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getMinutesData(params);
	}

	@Override
	public void updatesMinutes(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.updatesMinutes(params);
	}

	@Override
	public List<HashMap<String, String>> schePordList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.schePordList(params);
	}

	@Override
	public void insertScheProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.insertScheProd(params);
	}

	@Override
	public void deleteProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iScheDao.deleteProd(params);
	}

	@Override
	public List<HashMap<String, String>> getScheCalendar(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iScheDao.getScheCalendar(params);
	}

	

	
}
