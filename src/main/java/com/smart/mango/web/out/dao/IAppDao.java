package com.smart.mango.web.out.dao;

import java.util.HashMap;
import java.util.List;

public interface IAppDao {

	public int listCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getlist(HashMap<String, String> params)throws Throwable;

	public void Appday(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getapp(HashMap<String, String> params)throws Throwable;	

	List<HashMap<String, String>> get_sim(HashMap<String, String> params) throws Throwable;

	public void updateStat(HashMap<String, String> params) throws Throwable;

	

}
