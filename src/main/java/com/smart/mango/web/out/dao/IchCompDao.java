package com.smart.mango.web.out.dao;

import java.util.HashMap;
import java.util.List;

public interface IchCompDao {

	public List<HashMap<String, String>> getComp(HashMap<String, String> params) throws Throwable;

	public int CompCnt(HashMap<String, String> params) throws Throwable;

	public void saveComp(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCh(HashMap<String, String> params) throws Throwable;

}
