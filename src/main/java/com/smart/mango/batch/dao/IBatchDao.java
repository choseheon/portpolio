package com.smart.mango.batch.dao;

import java.util.HashMap;
import java.util.List;

public interface IBatchDao {

	public void randomMachine() throws Throwable;

	public void cmpMachineEnd() throws Throwable;

	public List<HashMap<String, String>> getContent() throws Throwable;

}
