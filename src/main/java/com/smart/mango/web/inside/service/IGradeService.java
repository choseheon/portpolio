package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

public interface IGradeService {

	public List<HashMap<String, Object>> getGrade(HashMap<String, String> params) throws Throwable;

	public void editGrade(HashMap<String, String> params) throws Throwable;

	public void delGrade(HashMap<String, String> params) throws Throwable;

	public void insertGrade(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getGradeList(HashMap<String, String> params) throws Throwable;

	public int gradeListCnt(HashMap<String, String> params) throws Throwable;

	public void updateGrade(HashMap<String, String> params)throws Throwable;

}
