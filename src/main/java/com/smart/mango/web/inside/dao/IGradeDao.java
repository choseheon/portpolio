package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

public interface IGradeDao {

	public List<HashMap<String, Object>> getGrade(HashMap<String, String> params) throws Throwable;

	public void editGrade(HashMap<String, String> params) throws Throwable;

	public void delGrade(HashMap<String, String> params) throws Throwable;

	public void insertGrade(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getGradeList(HashMap<String, String> params) throws Throwable;

	public int gradeListCnt(HashMap<String, String> params) throws Throwable;

	public void updateGrade(HashMap<String, String> params) throws Throwable;

}
