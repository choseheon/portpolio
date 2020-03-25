package com.smart.mango.web.out.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.out.dao.IMsgDao;

@Service
public class MsgService implements IMsgService{
	
	@Autowired
	public IMsgDao iMsgDao;

	@Override
	public List<HashMap<String, String>> getMsgInviteList(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getMsgInviteList(params);
	}

	@Override
	public List<HashMap<String, String>> getMsgDepartList(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getMsgDepartList(params);
	}

	@Override
	public List<HashMap<String, String>> getMsgTeamList(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getMsgTeamList(params);
	}

	@Override
	public List<HashMap<String, String>> getChatBookmarkList(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getChatBookmarkList(params);
	}

	@Override
	public List<HashMap<String, String>> getChatList(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getChatList(params);
	}

	@Override
	public String insertChatRoom(HashMap<String, String> params, List<String> chbox) throws Throwable {
		return iMsgDao.insertChatRoom(params, chbox);
	}

	@Override
	public List<HashMap<String, String>> getChat(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getChat(params);
	}

	@Override
	public void insertChat(HashMap<String, String> params) throws Throwable {
		iMsgDao.insertChat(params);
	}

	@Override
	public List<HashMap<String, String>> getChatInviteList(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getChatInviteList(params);
	}

	@Override
	public List<HashMap<String, String>> getChatroomInviteList(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getChatroomInviteList(params);
	}

	@Override
	public void chatroomInvite(HashMap<String, String> params, List<String> empbox) throws Throwable {
		iMsgDao.chatroomInvite(params, empbox);
		
	}

	@Override
	public void chatroomExit(HashMap<String, String> params) throws Throwable {
		iMsgDao.chatroomExit(params);
	}

	@Override
	public List<HashMap<String, String>> getAddChat(HashMap<String, String> params) throws Throwable {
		return iMsgDao.getAddChat(params);
	}

	@Override
	public void chatTitleEdit(HashMap<String, String> params) throws Throwable {
		iMsgDao.chatTitleEdit(params);
		
	}

	
}
