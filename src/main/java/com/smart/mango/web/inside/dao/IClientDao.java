package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

public interface IClientDao {

	void clientinsertData(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getClientGrade(HashMap<String, String> params)  throws Throwable;

	int getEmpCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable;

	int getCompCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getCompList(HashMap<String, String> params) throws Throwable;

	int getclientCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getclientList(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getClientData(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getClientOpin(HashMap<String, String> params) throws Throwable;

	int getClientOpinCnt(HashMap<String, String> params) throws Throwable;

	void insertClientOpin(HashMap<String, String> params) throws Throwable;

	void delClientOpin(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getClientMemo(HashMap<String, String> params) throws Throwable;

	int getClientMemoCnt(HashMap<String, String> params) throws Throwable;

	void insertClientMemo(HashMap<String, String> params) throws Throwable;

	void delClientMemo(HashMap<String, String> params) throws Throwable;

	void clientdel(HashMap<String, String> params) throws Throwable;

	void clientupdateData(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getClientSche(HashMap<String, String> params) throws Throwable;

}
