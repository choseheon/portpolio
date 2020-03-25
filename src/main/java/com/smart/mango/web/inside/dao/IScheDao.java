package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

public interface IScheDao {

	void insertSche(HashMap<String, String> params) throws Throwable;

	void insertOpin(HashMap<String, String> params) throws Throwable ;

	List<HashMap<String, String>> scheList(HashMap<String, String> params) throws Throwable ;

	int getClientCnt(HashMap<String, String> params) throws Throwable ;

	List<HashMap<String, String>> getClientList(HashMap<String, String> params) throws Throwable ;

	void insertScheClient(HashMap<String, String> params) throws Throwable;

	int getScheNo(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getScheData(HashMap<String, String> params);

	HashMap<String, String> getCiData(HashMap<String, String> params);

	List<HashMap<String, String>> getOpinList(HashMap<String, String> params) throws Throwable ;

	int getOpinCnt(HashMap<String, String> params) throws Throwable ;

	void deleteOpin(HashMap<String, String> params) throws Throwable ;

	List<HashMap<String, String>> getRadioList(HashMap<String, String> params) throws Throwable ;

	List<HashMap<String, String>> getOptionList(HashMap<String, String> params) throws Throwable ;

	int getLeadCnt(HashMap<String, String> params) throws Throwable ;

	List<HashMap<String, String>> getLeadList(HashMap<String, String> params) throws Throwable ;

	int getBssCnt(HashMap<String, String> params) throws Throwable ;

	List<HashMap<String, String>> getBssList(HashMap<String, String> params) throws Throwable ;

	void insertScheLead(HashMap<String, String> params) throws Throwable ;

	void insertScheBss(HashMap<String, String> params) throws Throwable ;

	int getScheBssProgNo(HashMap<String, String> params) throws Throwable ;

	int getDivCnt(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getLeadData(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBssData(HashMap<String, String> params) throws Throwable;

	String getScheFixData(HashMap<String, String> params) throws Throwable;

	void updateSche(HashMap<String, String> params) throws Throwable;

	void updateScheClient(HashMap<String, String> params) throws Throwable;

	void updateScheLead(HashMap<String, String> params) throws Throwable;

	void updateScheBss(HashMap<String, String> params) throws Throwable;

	void deleteSche(HashMap<String, String> params) throws Throwable;

	void insertScheAttach(HashMap<String, String> params)  throws Throwable;

	List<HashMap<String, String>> getAttachList(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getMinutesList(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable;

	int getAttachCnt(HashMap<String, String> params) throws Throwable;

	int getMinutesCnt(HashMap<String, String> params) throws Throwable;

	int getProdCnt(HashMap<String, String> params) throws Throwable;

	void deleteAttach(HashMap<String, String> params) throws Throwable;
	
	

	int getScheListCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getScheList(HashMap<String, String> params) throws Throwable;

	void insertScheMinutes(HashMap<String, String> params) throws Throwable;

	void deleteMinutes(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getMinutesData(HashMap<String, String> params) throws Throwable;

	void updatesMinutes(HashMap<String, String> params)  throws Throwable;

	List<HashMap<String, String>> schePordList(HashMap<String, String> params) throws Throwable;

	void insertScheProd(HashMap<String, String> params) throws Throwable;

	void deleteProd(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getScheCalendar(HashMap<String, String> params) throws Throwable;

}
