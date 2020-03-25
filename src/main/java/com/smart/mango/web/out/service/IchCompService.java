package com.smart.mango.web.out.service;

import java.util.HashMap;
import java.util.List;

public interface IchCompService {

	public int CompCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getComp(HashMap<String, String> params) throws Throwable;

	public void saveComp(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCh(HashMap<String, String> params) throws Throwable;

}
