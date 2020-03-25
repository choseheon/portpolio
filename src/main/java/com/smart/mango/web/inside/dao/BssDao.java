package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BssDao implements IBssDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getBssList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bss.getBssList",params);
	}

	@Override
	public int getBssCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("bss.getBssCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getBss(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bss.getBss", params);
	}

	@Override
	public List<HashMap<String, String>> getLeadList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bss.getLeadList", params);
	}

	@Override
	public HashMap<String, String> getBssNo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("bss.getBssNo", params);
	}

}