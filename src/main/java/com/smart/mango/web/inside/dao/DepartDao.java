package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DepartDao implements IDepartDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getSuch(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("depart.getSuch",params);
	}
	@Override
	public List<HashMap<String, String>> getDepartList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("depart.getDepartList",params);
	}
	@Override
	public List<HashMap<String, String>> getTeamList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("depart.getTeamList",params);
	}
	@Override
	public HashMap<String, String> getDepartInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("depart.getDepartInfo",params);
	}
	@Override
	public void insertDepart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("depart.insertDepart",params);
	}
	@Override
	public HashMap<String, String> getDepartMgr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("depart.getDepartMgr",params);
	}
	@Override
	public void insertTeam(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("depart.insertTeam",params);
	}
	@Override
	public HashMap<String, String> getTeamMgr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("depart.getTeamMgr",params);
	}
	@Override
	public int getEmpDepartCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("depart.getEmpDepartCnt",params);
	}
	@Override
	public List<HashMap<String, String>> getEmpDepartList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("depart.getEmpDepartList",params);
	}
	@Override
	public void departEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("depart.departEdit",params);
	}
	@Override
	public void departMgrEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("depart.departMgrEdit",params);
	}
	@Override
	public HashMap<String, String> getMgr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("depart.getMgr",params);
	}
	@Override
	public HashMap<String, String> getTeamInfo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("depart.getTeamInfo",params);
	}
	@Override
	public void teamEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("depart.teamEdit",params);
	}
	@Override
	public void teamMgrEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("depart.teamMgrEdit",params);
	}
	@Override
	public HashMap<String, String> getTMgr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("depart.getTMgr",params);
	}

}