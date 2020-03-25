package com.smart.mango.batch.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.batch.dao.IBatchDao;

@Service
public class BatchService implements IBatchService {
	@Autowired
	public IBatchDao iBatchDao;

	@Override
	public void randomMachine() throws Throwable {
		iBatchDao.randomMachine();
	}

	@Override
	public void cmpMachineEnd() throws Throwable {
		iBatchDao.cmpMachineEnd();
	}

	@Override
	public List<HashMap<String, String>> getContent() throws Throwable {
		
		return iBatchDao.getContent();
	}
}
