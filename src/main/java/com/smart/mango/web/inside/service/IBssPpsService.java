package com.smart.mango.web.inside.service;

import java.util.HashMap;
import java.util.List;

public interface IBssPpsService {

	public int getBssPpsCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getBssPpsList(HashMap<String, String> params) throws Throwable;

	public void insertBssPpsAdd(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getBssPpsOne(HashMap<String, String> params) throws Throwable;

	public void updateBssPpsEdit(HashMap<String, String> params) throws Throwable;

	public void updateBssPpsDelete(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getDepartList(HashMap<String, String> params) throws Throwable;

}
