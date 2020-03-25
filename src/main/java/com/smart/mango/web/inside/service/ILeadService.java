package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

public interface ILeadService {

	public List<HashMap<String, String>> getLeadlist(HashMap<String, String> params) throws Throwable;

	public int getleadCnt(HashMap<String, String> params) throws Throwable;

	public void editLs(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getclientList(HashMap<String, String> params) throws Throwable;

	public int getpopCnt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getLeadData(HashMap<String, String> params) throws Throwable;

	public void insertLead(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getClient(HashMap<String, String> params) throws Throwable;

	public int getClientCnt(HashMap<String, String> params) throws Throwable;

	public void deleteLead(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getLeadOpin(HashMap<String, String> params) throws Throwable;

	public void addLeadOpin(HashMap<String, String> params) throws Throwable;

	public void delLeadOpin(HashMap<String, String> params) throws Throwable;

	public void modLeadStat(HashMap<String, String> params) throws Throwable;

	public int getLeadOpinCnt(HashMap<String, String> params) throws Throwable;

	public void insertattach(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getattachlist(HashMap<String, String> params) throws Throwable;

	public void updateattach(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> updateList(HashMap<String, String> params) throws Throwable;

	public void updateLead(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getLeadSche(HashMap<String, String> params) throws Throwable;

	public void insertChn(HashMap<String, String> params) throws Throwable;

	public int chkBssChn(HashMap<String, String> params) throws Throwable;

	public void leadchk(HashMap<String, String> params) throws Throwable;

	public void leadchkreset() throws Throwable;

	public List<HashMap<String, String>> getLeadCard(HashMap<String, String> params) throws Throwable;


}
