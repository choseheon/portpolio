package com.smart.mango.web.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao implements ICommonDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getLeftMenu(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("common.getLeftMenu", params);
	}

	@Override
	public String menuAuthorCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("common.menuAuthorCheck", params);
	}

	@Override
	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("common.loginCheck", params);
	}
}
