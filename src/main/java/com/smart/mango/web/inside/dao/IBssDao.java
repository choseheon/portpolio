package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

public interface IBssDao {

	public List<HashMap<String, String>> getBssList(HashMap<String, String> params) throws Throwable;

	public int getBssCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBss(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getLeadList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBssNo(HashMap<String, String> params) throws Throwable;

}
