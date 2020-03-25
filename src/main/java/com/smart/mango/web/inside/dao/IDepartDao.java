package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

public interface IDepartDao {

	public List<HashMap<String, String>> getSuch(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getDepartList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getTeamList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getDepartInfo(HashMap<String, String> params) throws Throwable;

	public void insertDepart(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getDepartMgr(HashMap<String, String> params) throws Throwable;
	
	public void insertTeam(HashMap<String, String> params) throws Throwable;
	
	public HashMap<String, String> getTeamMgr(HashMap<String, String> params) throws Throwable;

	public int getEmpDepartCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getEmpDepartList(HashMap<String, String> params) throws Throwable;

	public void departEdit(HashMap<String, String> params) throws Throwable;

	public void departMgrEdit(HashMap<String, String> params) throws Throwable;
	
	public void teamEdit(HashMap<String, String> params) throws Throwable;
	
	public void teamMgrEdit(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMgr(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getTeamInfo(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getTMgr(HashMap<String, String> params) throws Throwable;


}
