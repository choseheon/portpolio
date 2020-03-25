package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

public interface IScheService {
	
	/* 일정 등록 기능 */
	void insertSche(HashMap<String, String> params) throws Throwable ;
	
	/* 일정 번호 가져오기 기능 */
	int getScheNo(HashMap<String, String> params) throws Throwable ;

	/* 일정 고객 등록 기능*/
	void insertScheClient(HashMap<String, String> params) throws Throwable ;
	
	/* 테스트용 기능 */
	List<HashMap<String, String>> scheList(HashMap<String, String> params) throws Throwable ;
	
	/* 고객 검색 (Cnt)기능 */
	int getClientCnt(HashMap<String, String> params) throws Throwable ;

	/* 고객 검색 (고객리스트) 기능 */
	List<HashMap<String, String>> getClientList(HashMap<String, String> params) throws Throwable ;
	
	/* 일정 데이터 출력 (일정 수정,세부사항) 기능 */
	HashMap<String, String> getScheData(HashMap<String, String> params) throws Throwable ;

	/* 일정 고객 정보 출력 ( 일정 수정,세부사항 ) 기능 */
	HashMap<String, String> getCiData(HashMap<String, String> params) throws Throwable ;

	/* 의견 등록 기능 */
	void insertOpin(HashMap<String, String> params) throws Throwable ;

	/* 의견 리스트 출력 기능 */
	List<HashMap<String, String>> getOpinList(HashMap<String, String> params) throws Throwable ;
	
	/* 의견 수 출력 기능 */
	int getOpinCnt(HashMap<String, String> params) throws Throwable;

	/* 의견 삭제 기능 */
	void deleteOpin(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getRadioList(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getOptionList(HashMap<String, String> params) throws Throwable;

	int getLeadCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getLeadList(HashMap<String, String> params) throws Throwable;

	int getBssCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getBssList(HashMap<String, String> params) throws Throwable;

	void insertScheLead(HashMap<String, String> params) throws Throwable;

	void insertScheBss(HashMap<String, String> params) throws Throwable;

	int getScheBssProgNo(HashMap<String, String> params) throws Throwable;

	int getDivCnt(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getLeadData(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getBssData(HashMap<String, String> params) throws Throwable;

	String getScheFixData(HashMap<String, String> params) throws Throwable;

	void updateSche(HashMap<String, String> params) throws Throwable;

	void updateScheClient(HashMap<String, String> params) throws Throwable;

	void updateScheLead(HashMap<String, String> params) throws Throwable;

	void updateScheBss(HashMap<String, String> params) throws Throwable;

	void deleteSche(HashMap<String, String> params) throws Throwable;

	void insertScheAttach(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getAttachList(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getMinutesList(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getProdList(HashMap<String, String> params) throws Throwable;

	int getAttachCnt(HashMap<String, String> params) throws Throwable;
	
	int getMinutesCnt(HashMap<String, String> params) throws Throwable;
	
	int getProdCnt(HashMap<String, String> params) throws Throwable;

	void deleteAttach(HashMap<String, String> params)  throws Throwable;

	int getScheListCnt(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getScheList(HashMap<String, String> params) throws Throwable;

	void insertScheMinutes(HashMap<String, String> params) throws Throwable;

	void deleteMinutes(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> getMinutesData(HashMap<String, String> params) throws Throwable;

	void updatesMinutes(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> schePordList(HashMap<String, String> params) throws Throwable;

	void insertScheProd(HashMap<String, String> params) throws Throwable;

	void deleteProd(HashMap<String, String> params) throws Throwable;

	List<HashMap<String, String>> getScheCalendar(HashMap<String, String> params) throws Throwable;


	
	

}
