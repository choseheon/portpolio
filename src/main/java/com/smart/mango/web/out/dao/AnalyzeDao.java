package com.smart.mango.web.out.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnalyzeDao implements IAnalyzeDao {
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void insertFeedb(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("analyze.insertFeedb", params);
	}

	@Override
	public int getFeedbCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("analyze.getFeedbCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getFeedbList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("analyze.getFeedbList", params);
	}

	@Override
	public List<HashMap<String, String>> getCmpTitle(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("analyze.getCmpTitle", params);
	}
}
