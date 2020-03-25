package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LeadDao implements ILeadDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getLeadlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("lead.getLeadlist", params);
	}

	@Override
	public int getleadCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lead.getleadCnt", params);
	}

	@Override
	public void editLs(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("lead.editLs", params);
	}

	@Override
	public List<HashMap<String, String>> getclientList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("lead.getclientList", params);
	}

	@Override
	public int getpopCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lead.getpopCnt", params);
	}

	@Override
	public HashMap<String, String> getLeadData(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lead.getLeadData", params);
	}

	@Override
	public void insertLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("lead.insertLead", params);
	}

	@Override
	public List<HashMap<String, String>> getClinet(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("lead.getClient", params);
	}

	@Override
	public int getClientCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lead.getClientCnt", params);
	}

	@Override
	public void deleteLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("lead.deleteLead", params);
	}

	@Override
	public List<HashMap<String, String>> getLeadOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("lead.getLeadOpin", params);
	}

	@Override
	public void addLeadOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("lead.addLeadOpin", params);
	}

	@Override
	public void delLeadOpin(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("lead.delLeadOpin", params);
	}

	@Override
	public void modLeadStat(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("lead.modLeadStat", params);
	}

	@Override
	public int getLeadOpinCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lead.getLeadOpinCnt", params);
	}

	@Override
	public void insertattach(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.selectOne("lead.insertattach", params);
	}

	@Override
	public List<HashMap<String, String>> getattachlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("lead.getattachlist", params);
	}

	@Override
	public void updateattach(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("lead.updateattach", params);
	}

	@Override
	public HashMap<String, String> updateList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("lead.updateList", params);
	}

	@Override
	public void updateLead(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("lead.updateLead", params);
	}

	@Override
	public List<HashMap<String, String>> getLeadSche(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("lead.getLeadSche", params);
	}

	@Override
	public void insertChn(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("lead.insertChn", params);
	}

	@Override
	public int chkBssChn(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("lead.chkBssChn", params);
	}

	@Override
	public void leadchk(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("lead.leadchk", params);
	}

	@Override
	public void leadchkreset() throws Throwable {
		sqlSession.update("lead.leadchkreset");
	}

	@Override
	public List<HashMap<String, String>> getLeadCard(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("lead.getLeadCard",params);
	}
}
