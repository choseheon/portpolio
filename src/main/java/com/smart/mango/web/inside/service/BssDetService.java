package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.inside.dao.IBssDetDao;

@Service
public class BssDetService implements IBssDetService {
	@Autowired
	public IBssDetDao iBssDetDao;

	@Override
	public HashMap<String, String> getChn(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getChn(params);
	}

	@Override
	public List<HashMap<String, String>> getBssType(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getBssType(params);
	}

	@Override
	public List<HashMap<String, String>> getBssSalesDiv(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getBssSalesDiv(params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getEmpCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getEmpList(params);
	}

	@Override
	public List<HashMap<String, String>> getSelectProdDiv(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getSelectProdDiv(params);
	}

	@Override
	public List<HashMap<String, String>> getSelectProdType(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getSelectProdType(params);
	}

	@Override
	public List<HashMap<String, String>> getProdDefaultList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getProdDefaultList(params);
	}

	@Override
	public int getProdDefaultListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getProdDefaultListCnt(params);
	}

	@Override
	public void updateProg(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssDetDao.updateProg(params);
	}

	@Override
	public HashMap<String, String> getFirst(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getFirst(params);
	}

	@Override
	public int getProdNowListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getProdNowListCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getProdNowList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getProdNowList(params);
	}

	@Override
	public void updateNowProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssDetDao.updateNowProd(params);
	}

	@Override
	public void deleteNowProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssDetDao.deleteNowProd(params);
	}

	@Override
	public List<HashMap<String, String>> getBssOpin(HashMap<String, String> params) throws Throwable {
		return iBssDetDao.getBssOpin(params);
	}

	@Override
	public int getBssOpinCnt(HashMap<String, String> params) throws Throwable {
		return iBssDetDao.getBssOpinCnt(params);
	}

	@Override
	public void insertBssOpin(HashMap<String, String> params) throws Throwable {
		iBssDetDao.insertBssOpin(params);
	}

	@Override
	public void delBssOpin(HashMap<String, String> params) throws Throwable {
		iBssDetDao.delBssOpin(params);
	}

	@Override
	public List<HashMap<String, String>> getBssSche(HashMap<String, String> params) throws Throwable {
		return iBssDetDao.getBssSche(params);
	}

	// 첨부파일 입력
	@Override
	public void insertSgtAttach(HashMap<String, String> params) throws Throwable {
		iBssDetDao.insertSgtAttach(params);
	}

	@Override
	public void insertNgtAttach(HashMap<String, String> params) throws Throwable {
		iBssDetDao.insertNgtAttach(params);
	}

	@Override
	public void insertCtractAttach(HashMap<String, String> params) throws Throwable {
		iBssDetDao.insertCtractAttach(params);
	}

	// 첨부파일 목록
	@Override
	public List<HashMap<String, String>> sgtAttachList(HashMap<String, String> params) throws Throwable {
		return iBssDetDao.sgtAttachList(params);
	}

	@Override
	public List<HashMap<String, String>> ngtAttachList(HashMap<String, String> params) throws Throwable {
		return iBssDetDao.ngtAttachList(params);
	}

	@Override
	public List<HashMap<String, String>> ctractAttachList(HashMap<String, String> params) throws Throwable {
		return iBssDetDao.ctractAttachList(params);
	}

	// 첨부파일 삭제
	@Override
	public void delSgtAttach(HashMap<String, String> params) throws Throwable {
		iBssDetDao.delSgtAttach(params);
	}

	public void delNgtAttach(HashMap<String, String> params) throws Throwable {
		iBssDetDao.delNgtAttach(params);
	}

	public void delCtractAttach(HashMap<String, String> params) throws Throwable {
		iBssDetDao.delCtractAttach(params);
	}

	@Override
	public void updateNowProdend(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssDetDao.updateNowProdend(params);
	}

	@Override
	public int getPopBssNoProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getPopBssNoProd(params);
	}

	@Override
	public void updateBssChn(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssDetDao.updateBssChn(params);
	}

	@Override
	public List<HashMap<String, String>> getProdGoods(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getProdGoods(params);
	}

	@Override
	public List<HashMap<String, String>> getProdService(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getProdService(params);
	}

	@Override
	public void updateBssEndDt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssDetDao.updateBssEndDt(params);
	}

	@Override
	public void makeNextProgTbl(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssDetDao.makeNextProgTbl(params);
	}

	@Override
	public int getNextBssNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getNextBssNo(params);
	}

	@Override
	public List<HashMap<String, String>> getListBeforeProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getListBeforeProd(params);
	}

	@Override
	public void updateBssNextProgProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iBssDetDao.updateBssNextProgProd(params);
	}

	@Override
	public HashMap<String, String> getSgt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getSgt(params);
	}

	@Override
	public HashMap<String, String> getSgtChnDt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getSgtChnDt(params);
	}

	@Override
	public HashMap<String, String> getNgt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getNgt(params);
	}

	@Override
	public HashMap<String, String> getCtract(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getCtract(params);
	}

	@Override
	public int getDepCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getDepCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getDepList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getDepList(params);
	}

	@Override
	public List<HashMap<String, String>> getBssTypeEnd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getBssTypeEnd(params);
	}

	@Override
	public HashMap<String, String> getBssNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iBssDetDao.getBssNo(params);
	}

}
