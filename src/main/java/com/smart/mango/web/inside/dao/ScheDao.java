package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ScheDao implements IScheDao{
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void insertSche(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sche.insertSche",params);
	}
	
	@Override
	public int getScheNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getScheNo",params);
	}
	
	@Override
	public void insertScheClient(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sche.insertScheClient",params);
	}

	@Override
	public void insertOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sche.insertOpin",params);
	}

	@Override
	public List<HashMap<String, String>> scheList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.scheList",params);
	}

	@Override
	public int getClientCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getClientCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getClientList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getClientList",params);
	}

	@Override
	public HashMap<String, String> getScheData(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getScheData",params);
	}

	@Override
	public HashMap<String, String> getCiData(HashMap<String, String> params) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getCiData",params);
	}

	@Override
	public List<HashMap<String, String>> getOpinList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getOpinList",params);
	}

	@Override
	public int getOpinCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getOpinCnt",params);
	}

	@Override
	public void deleteOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sche.deleteOpin",params);
	}

	@Override
	public List<HashMap<String, String>> getRadioList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getRadioList",params);
	}

	@Override
	public List<HashMap<String, String>> getOptionList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getOptionList",params);
	}

	@Override
	public int getLeadCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getLeadCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getLeadList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getLeadList",params);
	}

	@Override
	public int getBssCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getBssCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getBssList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getBssList",params);
	}

	@Override
	public void insertScheLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sche.insertScheLead",params);
	}

	@Override
	public void insertScheBss(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sche.insertScheBss",params);
	}

	@Override
	public int getScheBssProgNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getScheBssProgNo",params);
	}

	@Override
	public int getDivCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getDivCnt",params);
	}

	@Override
	public HashMap<String, String> getLeadData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getLeadData",params);
	}

	@Override
	public HashMap<String, String> getBssData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getBssData",params);
	}

	@Override
	public String getScheFixData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getScheFixData",params);
	}

	@Override
	public void updateSche(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sche.updateSche",params);
	}

	@Override
	public void updateScheClient(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sche.updateScheClient",params);
	}

	@Override
	public void updateScheLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sche.updateScheLead",params);
	}

	@Override
	public void updateScheBss(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sche.updateScheBss",params);
	}

	@Override
	public void deleteSche(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sche.deleteSche",params);
	}

	@Override
	public void insertScheAttach(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sche.insertScheAttach",params);
	}

	@Override
	public List<HashMap<String, String>> getAttachList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getAttachList",params);
	}

	@Override
	public List<HashMap<String, String>> getMinutesList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getMinutesList",params);
	}

	@Override
	public List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getProdList",params);
	}

	@Override
	public int getAttachCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getAttachCnt",params);
	}

	@Override
	public int getMinutesCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getMinutesCnt",params);
	}

	@Override
	public int getProdCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getProdCnt",params);
	}

	@Override
	public void deleteAttach(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.delete("sche.deleteAttach",params);
	}
	
	
	@Override
	public int getScheListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getScheListCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getScheList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getScheList", params);
	}

	@Override
	public void insertScheMinutes(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sche.insertScheMinutes",params);
	}

	@Override
	public void deleteMinutes(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sche.deleteMinutes",params);
	}

	@Override
	public HashMap<String, String> getMinutesData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sche.getMinutesData",params);
	}

	@Override
	public void updatesMinutes(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sche.updatesMinutes",params);
	}

	@Override
	public List<HashMap<String, String>> schePordList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.schePordList",params);
	}

	@Override
	public void insertScheProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sche.insertScheProd",params);
	}

	@Override
	public void deleteProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.delete("sche.deleteProd",params);
	}

	@Override
	public List<HashMap<String, String>> getScheCalendar(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sche.getScheCalendar", params);
	}

	

	
}
