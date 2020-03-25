package com.smart.mango.web.common.dao;

import java.util.HashMap;
import java.util.List;

public interface ICommonDao {

	public List<HashMap<String, String>> getLeftMenu(HashMap<String, String> params) throws Throwable;

	public String menuAuthorCheck(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable;

}
