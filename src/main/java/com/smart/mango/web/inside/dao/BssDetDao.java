package com.smart.mango.web.inside.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BssDetDao implements IBssDetDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> getChn(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getChn", params);
	}

	@Override
	public List<HashMap<String, String>> getBssType(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getBssType", params);
	}

	@Override
	public List<HashMap<String, String>> getBssSalesDiv(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getBssSalesDiv", params);
	}

	@Override
	public int getEmpCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getEmpCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getEmpList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getEmpList", params);
	}

	@Override
	public List<HashMap<String, String>> getSelectProdDiv(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getSelectProdDiv", params);
	}

	@Override
	public List<HashMap<String, String>> getSelectProdType(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getSelectProdType", params);
	}
	
	@Override
	public List<HashMap<String, String>> getBssOpin(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bssDet.getBssOpin", params);
	}

	@Override
	public int getBssOpinCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("bssDet.getBssOpinCnt", params);
	}

	@Override
	public void insertBssOpin(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("bssDet.insertBssOpin", params);
	}

	@Override
	public void delBssOpin(HashMap<String, String> params) throws Throwable {
		sqlSession.update("bssDet.delBssOpin", params);
	}

	@Override
	public List<HashMap<String, String>> getBssSche(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bssDet.getBssSche", params);
	}

	@Override
	public List<HashMap<String, String>> getProdDefaultList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getProdDefaultList", params);
	}

	@Override
	public int getProdDefaultListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getProdDefaultListCnt", params);
	}

	@Override
	public void updateProg(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("bssDet.updateProg", params);
	}

	@Override
	public HashMap<String, String> getFirst(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getFirst", params);
	}

	@Override
	public int getProdNowListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getProdNowListCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getProdNowList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getProdNowList", params);
	}

	@Override
	public void updateNowProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("bssDet.updateNowProd", params);
	}

	@Override
	public void deleteNowProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.delete("bssDet.deleteNowProd", params);
	}

	@Override
	public void updateNowProdend(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("bssDet.updateNowProdend", params);
	}

	@Override
	public int getPopBssNoProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getPopBssNoProd", params);
	}

	@Override
	public void updateBssChn(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("bssDet.updateBssChn", params);
	}

	@Override
	public List<HashMap<String, String>> getProdGoods(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getProdGoods", params);
	}

	@Override
	public List<HashMap<String, String>> getProdService(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getProdService", params);
	}

	@Override
	public void updateBssEndDt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("bssDet.updateBssEndDt", params);
	}

	@Override
	public void makeNextProgTbl(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("bssDet.makeNextProgTbl", params);
	}

	@Override
	public int getNextBssNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getNextBssNo", params);
	}

	@Override
	public List<HashMap<String, String>> getListBeforeProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getListBeforeProd", params);
	}

	@Override
	public void updateBssNextProgProd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("bssDet.updateBssNextProgProd", params);
	}

	@Override
	public HashMap<String, String> getSgt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getSgt", params);
	}

	@Override
	public HashMap<String, String> getSgtChnDt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getSgtChnDt", params);
	}

	@Override
	public HashMap<String, String> getNgt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getNgt", params);
	}

	@Override
	public void insertSgtAttach(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("bssDet.insertSgtAttach", params);
	}

	@Override
	public void insertNgtAttach(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("bssDet.insertNgtAttach", params);
	}

	@Override
	public void insertCtractAttach(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("bssDet.insertCtractAttach", params);
	}

	@Override
	public List<HashMap<String, String>> sgtAttachList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bssDet.sgtAttachList", params);
	}

	@Override
	public List<HashMap<String, String>> ngtAttachList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bssDet.ngtAttachList", params);
	}

	@Override
	public List<HashMap<String, String>> ctractAttachList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bssDet.ctractAttachList", params);
	}

	@Override
	public void delSgtAttach(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("bssDet.delSgtAttach", params);
	}

	@Override
	public void delNgtAttach(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("bssDet.delNgtAttach", params);
	}

	@Override
	public void delCtractAttach(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("bssDet.delCtractAttach", params);
	}

	@Override
	public HashMap<String, String> getCtract(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getCtract", params);
	}

	@Override
	public int getDepCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getDepCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getDepList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getDepList", params);
	}

	@Override
	public List<HashMap<String, String>> getBssTypeEnd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bssDet.getBssTypeEnd", params);
	}

	@Override
	public HashMap<String, String> getBssNo(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("bssDet.getBssNo", params);
	}
	
	
}
