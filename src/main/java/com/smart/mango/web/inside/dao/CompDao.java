package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CompDao implements ICompDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getCompList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("comp.getCompList", params);
	}

	@Override
	public int getCompCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("comp.getCompCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getGradeList() throws Throwable {
		return sqlSession.selectList("comp.getGradeList");
	}

	@Override
	public List<HashMap<String, String>> getStatList() throws Throwable {
		return sqlSession.selectList("comp.getStatList");
	}

	@Override
	public int getSectCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("comp.getSectCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getSectList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("comp.getSectList", params);
	}

	@Override
	public int checkSectName(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("comp.checkSectName", params);
	}

	@Override
	public void insertSect(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("comp.insertSect", params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("comp.getEmpCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("comp.getEmpList", params);
	}

	@Override
	public int checkCompName(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("comp.checkCompName", params);
	}

	@Override
	public void insertComp(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("comp.insertComp", params);
	}

	@Override
	public HashMap<String, String> getCompData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("comp.getCompData", params);
	}

	@Override
	public List<HashMap<String, String>> getClient(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("comp.getClient", params);
	}

	@Override
	public int getClientCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("comp.getClientCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getCompOpin(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("comp.getCompOpin", params);
	}

	@Override
	public void insertCompOpin(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("comp.insertCompOpin", params);
	}

	@Override
	public int getCompOpinCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("comp.getCompOpinCnt", params);
	}

	@Override
	public void delCompOpin(HashMap<String, String> params) throws Throwable {
		sqlSession.update("comp.delCompOpin", params);
	}

	@Override
	public List<HashMap<String, String>> getWorkLead(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("comp.getWorkLead", params);
	}

	@Override
	public List<HashMap<String, String>> getWorkChn(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("comp.getWorkChn", params);
	}

	@Override
	public void updateComp(HashMap<String, String> params) throws Throwable {
		sqlSession.update("comp.updateComp", params);
	}

	@Override
	public void deleteComp(HashMap<String, String> params) throws Throwable {
		sqlSession.update("comp.deleteComp", params);
	}

	@Override
	public List<HashMap<String, String>> getCompSche(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("comp.getCompSche", params);
	}
	
}
