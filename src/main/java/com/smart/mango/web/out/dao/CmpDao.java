package com.smart.mango.web.out.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CmpDao implements ICmpDao {

	@Autowired
	public SqlSession sqlSession;

	@Override
	public int clientCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cmp.clientCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getClientList(HashMap<String, String> term) throws Throwable {
		return sqlSession.selectList("cmp.getClientList", term);
	}

	@Override
	public void channelSelect(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("cmp.channelSelect", params);
	}

	@Override
	public int getCmpCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cmp.getCmpCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getCmpList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cmp.getCmpList", params);
	}

	
	
	@Override
	public HashMap<String, String> cmpAdd(HashMap<String, String> params) throws Throwable {
		String seq = sqlSession.selectOne("cmp.getSeq");
		params.put("seq", seq);
		sqlSession.insert("cmp.cmpAdd",params);
		return params;
	}
	
	@Override
	public List<HashMap<String, String>> getsms(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cmp.getsms", params);
	}
	@Override
	public List<HashMap<String, String>> getmms(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cmp.getmms",params);
	}

	@Override
	public List<HashMap<String, String>> getemail(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cmp.getemail", params);
	}

	@Override
	public List<HashMap<String, String>> getSim_result(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cmp.getSim_result",params);
	}

	@Override
	public void updateS(HashMap<String, String> params) throws Throwable {
		sqlSession.update("cmp.updateS",params);
	}

	@Override
	public int searchClientCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cmp.searchClientCnt",params);
	}

	@Override
	public HashMap<String, String> getCmpS(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("cmp.getCmpS",params);
	}

	@Override
	public List<HashMap<String, String>> selectCbox(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cmp.selectCbox",params);
	}

	@Override
	public void insertT(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("cmp.insertT", params);
	}

	@Override
	public List<HashMap<String, String>> selectCh(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cmp.selectCh", params);
	}

	@Override
	public void save(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("cmp.save", params);
	}

	@Override
	public List<HashMap<String, String>> getCmpType(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cmp.getCmpType",params);
	}

	@Override
	public List<HashMap<String, String>> cmpTypeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("cmp.cmpTypeList",params);
	}

	

	



	
}
