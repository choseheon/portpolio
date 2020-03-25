package com.smart.mango.web.out.dao;

import java.util.HashMap;
import java.util.List;

public interface IMsgDao {

	public List<HashMap<String, String>> getMsgInviteList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMsgDepartList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMsgTeamList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChatBookmarkList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChatList(HashMap<String, String> params) throws Throwable;

	public String insertChatRoom(HashMap<String, String> params, List<String> chbox) throws Throwable;

	public List<HashMap<String, String>> getChat(HashMap<String, String> params) throws Throwable;

	public void insertChat(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChatInviteList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getChatroomInviteList(HashMap<String, String> params) throws Throwable;

	public void chatroomInvite(HashMap<String, String> params, List<String> empbox) throws Throwable;

	public void chatroomExit(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getAddChat(HashMap<String, String> params) throws Throwable;

	public void chatTitleEdit(HashMap<String, String> params) throws Throwable;

}
