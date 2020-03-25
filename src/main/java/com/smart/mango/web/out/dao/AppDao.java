package com.smart.mango.web.out.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AppDao implements IAppDao{
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int listCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cmp.listCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getlist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cmp.getlist",params);
	}

	@Override
	public void Appday(HashMap<String, String> params) throws Throwable {
		sqlSession.update("cmp.Appday",params);
		
	}

	@Override
	public HashMap<String, String> getapp(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("cmp.getapp",params);
	}

	@Override
	public List<HashMap<String, String>> get_sim(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cmp.get_sim",params);
	}

	@Override
	public void updateStat(HashMap<String, String> params) throws Throwable {
		sqlSession.update("cmp.updateStat",params);
		
	}
}
