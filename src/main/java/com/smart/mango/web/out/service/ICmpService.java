package com.smart.mango.web.out.service;

import java.util.HashMap;
import java.util.List;

public interface ICmpService {

	public HashMap<String, String> getTarget(String[] boxx, String[] chh, HashMap<String, String> params) throws Throwable;

	public int clientCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getClientList(HashMap<String, String> term) throws Throwable;

	public void channelSelect(HashMap<String, String> params)throws Throwable;

	public int getCmpCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCmpList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getsms(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getmms(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getemail(HashMap<String, String> params)throws Throwable;

	public void cmpAdd(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSim_result(HashMap<String, String> params)throws Throwable;


	public void updateS(HashMap<String, String> params) throws Throwable;

	public int searchClientCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCmpS(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> selectCbox(HashMap<String, String> params) throws Throwable;

	public void insertT(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> selectCh(HashMap<String, String> params)throws Throwable;

	public void save(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getCmpType(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> cmpTypeList(HashMap<String, String> params) throws Throwable;

}
