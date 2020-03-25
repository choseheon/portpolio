package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BssPpsDao implements IBssPpsDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public int insertBssPpsAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("bssPps.insertBssPpsAdd",params);
	}

	@Override
	public int getBssPpsCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssPps.getBssPpsCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getBssPpsList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssPps.getBssPpsList",params);
	}

	@Override
	public HashMap<String, String> getBssPpsOne(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssPps.getBssPpsOne",params);
	}

	@Override
	public void updateBssPpsEdit(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("bssPps.updateBssPpsEdit",params);
	}

	@Override
	public void updateBssPpsDelete(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("bssPps.updateBssPpsDelete",params);
	}

	@Override
	public List<HashMap<String, String>> getDepartList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssPps.getDepartList",params);
	}
}
