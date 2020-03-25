package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sun.javafx.collections.MappingChange.Map;

@Repository
public class ProdDao implements IProdDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getServiceList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("prod.getServiceList", params);
	}

	@Override
	public List<HashMap<String, String>> getGoodsList(HashMap<String, String> params ) throws Throwable {
		return sqlSession.selectList("prod.getGoodsList", params);
	}
	
	
	@Override
	public void addproddata(HashMap<String, String> params) throws Throwable {
		
		sqlSession.insert("prod.addproddata", params);
		
	}

	@Override
	public void addgoodsdata(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("prod.addgoodsdata", params);
		
	}

	@Override
	public void addservicedata(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("prod.addservicedata", params);
		
	}

	@Override
	public HashMap<String, String> getdata(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("prod.getdata", params);
	}

	@Override
	public void Detdeletedata(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("prod.Detdeletedata", params);
		
	}

	@Override
	public int getgoodslistCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("prod.getgoodslistCnt", params);
	}

	@Override
	public int getservicelistCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("prod.getservicelistCnt", params);
	}

	@Override
	public void prodSEQ(HashMap<String, String> params) throws Throwable {
		 String seq = Integer.toString(sqlSession.selectOne("prod.prodSEQ", params));
	     params.put("seq", seq);
		
	}

	@Override
	public HashMap<String, String> getLastProd(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("prod.getLastProd", params);
	}

	@Override
	public void updatedata(HashMap<String, String> params) throws Throwable {
		sqlSession.update("prod.updatedata", params);
		
	}

	@Override
	public void update2data(HashMap<String, String> params) throws Throwable {
		sqlSession.update("prod.update2data", params);
		
	}

	@Override
	public void Detdeletedata2(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("prod.Detdeletedata2", params);
	}

	/*
	 * @Override public HashMap<String, String> getproddata(HashMap<String, String>
	 * params) throws Throwable { return sqlSession.selectOne("prod.getproddata",
	 * params); }
	 */


		
	}




	

