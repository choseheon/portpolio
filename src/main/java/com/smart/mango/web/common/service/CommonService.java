package com.smart.mango.web.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.common.dao.ICommonDao;

@Service
public class CommonService implements ICommonService {
	@Autowired
	public ICommonDao iCommonDao;

	@Override
	public List<HashMap<String, String>> getLeftMenu(HashMap<String, String> params) throws Throwable {
		return iCommonDao.getLeftMenu(params);
	}
	
	/*
	 menuAuthorCheck
	 param : authorNo - 권한번호
	       : menuNo - 메뉴번호
	 return : 권한타입 - 0(권한없음), 1(읽기), 2(읽기,쓰기)
	 */
	@Override
	public String menuAuthorCheck(String authorNo, String menuNo) throws Throwable {
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("authorNo", authorNo);
		params.put("menuNo", menuNo);
		
		return iCommonDao.menuAuthorCheck(params);
	}

	@Override
	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable {
		return iCommonDao.loginCheck(params);
	}
}
