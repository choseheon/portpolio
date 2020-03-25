package com.smart.mango.web.out.dao;

import java.util.HashMap;
import java.util.List;

public interface IAnalyzeDao {

	public void insertFeedb(HashMap<String, String> params) throws Throwable;

	public int getFeedbCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getFeedbList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCmpTitle(HashMap<String, String> params) throws Throwable;

}
