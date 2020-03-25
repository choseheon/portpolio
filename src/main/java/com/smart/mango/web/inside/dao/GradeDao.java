package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GradeDao implements IGradeDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, Object>> getGrade(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("grade.getGrade", params);
	}

	@Override
	public void editGrade(HashMap<String, String> params) throws Throwable {
		sqlSession.update("grade.editGrade", params);
	}

	@Override
	public void delGrade(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("grade.delGrade", params);
	}

	@Override
	public void insertGrade(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("grade.insertGrade", params);
	}

	@Override
	public List<HashMap<String, String>> getGradeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("grade.getGradeList", params);
	}

	@Override
	public int gradeListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("grade.gradeListCnt", params);
	}

	@Override
	public void updateGrade(HashMap<String, String> params) throws Throwable {
		sqlSession.update("grade.updateGrade", params);
	}
}
