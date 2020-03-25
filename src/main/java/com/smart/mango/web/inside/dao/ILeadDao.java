package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

public interface ILeadDao {

	List<HashMap<String, String>> getLeadlist(HashMap<String, String> params) throws Throwable;

	int getleadCnt(HashMap<String, String> params) throws Throwable;

	void editLs(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getclientList(HashMap<String, String> params) throws Throwable;

	int getpopCnt(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getLeadData(HashMap<String, String> params) throws Throwable;

	void insertLead(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getClinet(HashMap<String, String> params) throws Throwable;

	int getClientCnt(HashMap<String, String> params) throws Throwable;

	void deleteLead(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getLeadOpin(HashMap<String, String> params) throws Throwable;

	void addLeadOpin(HashMap<String, String> params) throws Throwable;

	void delLeadOpin(HashMap<String, String> params) throws Throwable;

	void modLeadStat(HashMap<String, String> params) throws Throwable;

	int getLeadOpinCnt(HashMap<String, String> params) throws Throwable;

	void insertattach(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getattachlist(HashMap<String, String> params) throws Throwable;

	void updateattach(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> updateList(HashMap<String, String> params) throws Throwable;

	void updateLead(HashMap<String, String> params)throws Throwable;

	List<HashMap<String, String>> getLeadSche(HashMap<String, String> params) throws Throwable;

	void insertChn(HashMap<String, String> params) throws Throwable;

	int chkBssChn(HashMap<String, String> params) throws Throwable;

	void leadchk(HashMap<String, String> params) throws Throwable;

	void leadchkreset() throws Throwable;

	List<HashMap<String, String>> getLeadCard(HashMap<String, String> params) throws Throwable;

}
