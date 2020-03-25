package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import com.sun.javafx.collections.MappingChange.Map;

public interface IProdDao {

	List<HashMap<String, String>> getServiceList(HashMap<String, String> params)throws Throwable;

	List<HashMap<String, String>> getGoodsList(HashMap<String, String> params)throws Throwable;

	public void addgoodsdata(HashMap<String, String> params)throws Throwable;

	public void addservicedata(HashMap<String, String> params)throws Throwable;
	
	public void  addproddata(HashMap<String, String> params)throws Throwable;

	HashMap<String, String> getdata(HashMap<String, String> params)throws Throwable;

	public void Detdeletedata(HashMap<String, String> params)throws Throwable;

	public int getgoodslistCnt(HashMap<String, String> params)throws Throwable;

	public int getservicelistCnt(HashMap<String, String> params)throws Throwable;

	public void prodSEQ(HashMap<String, String> params)throws Throwable;

	HashMap<String, String> getLastProd(HashMap<String, String> params) throws Throwable;

	public void updatedata(HashMap<String, String> params)throws Throwable;

	public void update2data(HashMap<String, String> params)throws Throwable;

	public void Detdeletedata2(HashMap<String, String> params)throws Throwable;

	/*
	 * HashMap<String, String> getproddata(HashMap<String, String> params)throws
	 * Throwable;
	 */






}
