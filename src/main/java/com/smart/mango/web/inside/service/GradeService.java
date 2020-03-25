package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.inside.dao.IGradeDao;

@Service
public class GradeService implements IGradeService{
	@Autowired
	public IGradeDao iGradeDao;
	
	@Override
	public List<HashMap<String, Object>> getGrade(HashMap<String, String> params) throws Throwable {
		return iGradeDao.getGrade(params);
	}

	@Override
	public void editGrade(HashMap<String, String> params) throws Throwable {
		iGradeDao.editGrade(params);
	}

	@Override
	public void delGrade(HashMap<String, String> params) throws Throwable {
		iGradeDao.delGrade(params);
	}

	@Override
	public void insertGrade(HashMap<String, String> params) throws Throwable {
		iGradeDao.insertGrade(params);
	}

	@Override
	public List<HashMap<String, String>> getGradeList(HashMap<String, String> params) throws Throwable {
		return iGradeDao.getGradeList(params);
	}

	@Override
	public int gradeListCnt(HashMap<String, String> params) throws Throwable {
		return iGradeDao.gradeListCnt(params);
	}

	@Override
	public void updateGrade(HashMap<String, String> params) throws Throwable {
		iGradeDao.updateGrade(params);
	}

}
