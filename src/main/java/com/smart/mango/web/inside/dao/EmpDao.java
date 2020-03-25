package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmpDao implements IEmpDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("emp.getEmpList", params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("emp.getEmpCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getPosiList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("emp.getPosiList", params);
	}

	@Override
	public List<HashMap<String, String>> getFormList() throws Throwable {
		return sqlSession.selectList("emp.getFormList");
	}

	@Override
	public List<HashMap<String, String>> getDepartList() throws Throwable {
		return sqlSession.selectList("emp.getDepartList");
	}

	@Override
	public List<HashMap<String, String>> getAuthorList() throws Throwable {
		return sqlSession.selectList("emp.getAuthorList");
	}

	@Override
	public List<HashMap<String, String>> getTeamList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("emp.getTeamList", params);
	}

	@Override
	public void insertEmp(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("emp.insertEmp", params);
	}

	@Override
	public HashMap<String, String> setEmpData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("emp.getEmpData", params);
	}

	@Override
	public int getTeamEmpCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("emp.getTeamEmpCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getTeamEmp(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("emp.getTeamEmp", params);
	}

	@Override
	public int checkEmail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("emp.checkEmail", params);
	}

	@Override
	public int checkEmpId(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("emp.checkEmpId", params);
	}

	@Override
	public void updateEmp(HashMap<String, String> params) throws Throwable {
		sqlSession.update("emp.updateEmp", params);
	}

	@Override
	public void deleteEmp(HashMap<String, String> params) throws Throwable {
		sqlSession.update("emp.deleteEmp", params);
	}
}
