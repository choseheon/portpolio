package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDao implements IClientDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void clientinsertData(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Client.clientinsertData",params);
	}

	@Override
	public List<HashMap<String, String>> getClientGrade(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Client.getClientGrade",params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Client.getEmpCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Client.getEmpList",params);
	}

	@Override
	public int getCompCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Client.getCompCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getCompList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Client.getCompList",params);
	}

	@Override
	public int getclientCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Client.getclientCnt",params);
	}

	@Override
	public List<HashMap<String, String>> getclientList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Client.getclientList",params);
	}

	@Override
	public HashMap<String, String> getClientData(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Client.getClientData",params);
	}

	@Override
	public List<HashMap<String, String>> getClientOpin(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Client.getClientOpin",params);
	}

	@Override
	public int getClientOpinCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Client.getClientOpinCnt",params);
	}

	@Override
	public void insertClientOpin(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Client.insertClientOpin",params);
	}

	@Override
	public void delClientOpin(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("Client.delClientOpin",params);
	}

	@Override
	public List<HashMap<String, String>> getClientMemo(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Client.getClientMemo",params);
	}

	@Override
	public int getClientMemoCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Client.getClientMemoCnt",params);
	}

	@Override
	public void insertClientMemo(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("Client.insertClientMemo",params);
	}

	@Override
	public void delClientMemo(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("Client.delClientMemo",params);
	}

	@Override
	public void clientdel(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("Client.clientdel",params);
	}

	@Override
	public void clientupdateData(HashMap<String, String> params) throws Throwable {
		sqlSession.update("Client.clientupdateData",params);
	}

	@Override
	public List<HashMap<String, String>> getClientSche(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Client.getClientSche",params);
	}
}
