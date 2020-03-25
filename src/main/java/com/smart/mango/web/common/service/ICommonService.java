package com.smart.mango.web.common.service;

import java.util.HashMap;
import java.util.List;

public interface ICommonService {

	public List<HashMap<String, String>> getLeftMenu(HashMap<String, String> params) throws Throwable;

	String menuAuthorCheck(String authorNo, String menuNo) throws Throwable;

	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable;

}
