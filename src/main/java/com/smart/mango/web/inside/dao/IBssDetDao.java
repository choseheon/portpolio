package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

public interface IBssDetDao {

	public HashMap<String, String> getChn(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBssType(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBssSalesDiv(HashMap<String, String> params) throws Throwable;

	public int getEmpCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSelectProdDiv(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getSelectProdType(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getProdDefaultList(HashMap<String, String> params) throws Throwable;

	public int getProdDefaultListCnt(HashMap<String, String> params) throws Throwable;

	public void updateProg(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getFirst(HashMap<String, String> params) throws Throwable;

	public int getProdNowListCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getProdNowList(HashMap<String, String> params) throws Throwable;

	public void updateNowProd(HashMap<String, String> params) throws Throwable;

	public void deleteNowProd(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBssOpin(HashMap<String, String> params) throws Throwable;

	public int getBssOpinCnt(HashMap<String, String> params) throws Throwable;

	public void insertBssOpin(HashMap<String, String> params) throws Throwable;

	public void delBssOpin(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBssSche(HashMap<String, String> params) throws Throwable;
	//첨부파일 등록
	public void insertSgtAttach(HashMap<String, String> params) throws Throwable;
	
	public void insertNgtAttach(HashMap<String, String> params) throws Throwable;
	
	public void insertCtractAttach(HashMap<String, String> params) throws Throwable;
	//첨부파일 목록
	public List<HashMap<String, String>> sgtAttachList(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> ngtAttachList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> ctractAttachList(HashMap<String, String> params) throws Throwable;
	//첨부파일 삭제
	public void delSgtAttach(HashMap<String, String> params) throws Throwable;
	
	public void delNgtAttach(HashMap<String, String> params) throws Throwable;
	
	public void delCtractAttach(HashMap<String, String> params) throws Throwable;

	public void updateNowProdend(HashMap<String, String> params) throws Throwable;

	public int getPopBssNoProd(HashMap<String, String> params) throws Throwable;

	public void updateBssChn(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getProdGoods(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getProdService(HashMap<String, String> params) throws Throwable;

	public void updateBssEndDt(HashMap<String, String> params) throws Throwable;

	public void makeNextProgTbl(HashMap<String, String> params) throws Throwable;

	public int getNextBssNo(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getListBeforeProd(HashMap<String, String> params) throws Throwable;

	public void updateBssNextProgProd(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getSgt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getSgtChnDt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getNgt(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getCtract(HashMap<String, String> params) throws Throwable;

	public int getDepCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getDepList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBssTypeEnd(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBssNo(HashMap<String, String> params) throws Throwable;

}
