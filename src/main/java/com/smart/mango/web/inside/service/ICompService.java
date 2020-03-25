package com.smart.mango.web.inside.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;

public interface ICompService {

	public List<HashMap<String, String>> getCompList(HashMap<String, String> params) throws Throwable;
	public int getCompCnt(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getGradeList() throws Throwable;
	public List<HashMap<String, String>> getStatList() throws Throwable;
	public int getSectCnt(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getSectList(HashMap<String, String> params) throws Throwable;
	public int checkSectName(HashMap<String, String> params) throws Throwable;
	public void insertSect(HashMap<String, String> params) throws Throwable;
	public int getEmpCnt(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable;
	public int checkCompName(HashMap<String, String> params) throws Throwable;
	public void insertComp(HashMap<String, String> params) throws Throwable;
	public HashMap<String, String> getCompData(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getClient(HashMap<String, String> params) throws Throwable;
	public int getClientCnt(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getCompOpin(HashMap<String, String> params) throws Throwable;
	public void insertCompOpin(HashMap<String, String> params) throws Throwable;
	public int getCompOpinCnt(HashMap<String, String> params) throws Throwable;
	public void delCompOpin(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getWorkLead(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getWorkChn(HashMap<String, String> params) throws Throwable;
	public void updateComp(HashMap<String, String> params) throws Throwable;
	public void deleteComp(HashMap<String, String> params) throws Throwable;
	public List<HashMap<String, String>> getCompSche(HashMap<String, String> params) throws Throwable;
	
}
