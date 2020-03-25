package com.smart.mango.batch.service;

import java.util.HashMap;
import java.util.List;

public interface IBatchService {

	public void randomMachine() throws Throwable;

	public void cmpMachineEnd() throws Throwable;

	public List<HashMap<String, String>> getContent() throws Throwable;

}
