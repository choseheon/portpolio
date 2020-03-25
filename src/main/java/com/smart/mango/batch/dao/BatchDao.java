package com.smart.mango.batch.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BatchDao implements IBatchDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public void randomMachine() throws Throwable {
		// 이메일 랜덤 수신
		sqlSession.update("machine.emailReceptRandom");
		// 이메일 랜덤 실반응
		sqlSession.update("machine.emailRealrtRandom");
		// 이메일 미수신 실반응
		sqlSession.update("machine.emailRealrtNone");
		// 문자 랜덤 수신
		sqlSession.update("machine.letterReceptRandom");
		// 문자 랜덤 실반응
		sqlSession.update("machine.letterRealrtRandom");
		// 문자 미수신 실반응
		sqlSession.update("machine.letterRealrtNone");
	}

	@Override
	public void cmpMachineEnd() throws Throwable {
		// 캠페인 종료
		sqlSession.update("machine.cmpMachineEnd");
	}

	@Override
	public List<HashMap<String, String>> getContent() throws Throwable {
		
		return sqlSession.selectList("machine.cmpMachineEnd");
	}
	
	
}
