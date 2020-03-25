package com.smart.mango.web.out.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class chCompDao implements IchCompDao{
	
	@Autowired
	public SqlSession sqlsession;

	@Override
	public List<HashMap<String, String>> getComp(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("chComp.getComp",params);
	}

	@Override
	public int CompCnt(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("chComp.CompCnt",params);
	}

	@Override
	public void saveComp(HashMap<String, String> params) throws Throwable {
		sqlsession.insert("chComp.saveComp",params);
	}

	@Override
	public List<HashMap<String, String>> getCh(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectList("chComp.getCh",params);
	}
}
