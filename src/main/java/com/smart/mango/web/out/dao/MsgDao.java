package com.smart.mango.web.out.dao;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.ajdt.internal.compiler.ast.AddAtAspectJAnnotationsVisitor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;

@Repository
public class MsgDao implements IMsgDao{
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getMsgInviteList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getMsgInviteList", params);
	}

	@Override
	public List<HashMap<String, String>> getMsgDepartList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getMsgDepartList", params);
	}

	@Override
	public List<HashMap<String, String>> getMsgTeamList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getMsgTeamList", params);
	}

	@Override
	public List<HashMap<String, String>> getChatBookmarkList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getChatBookmarkList", params);
	}

	@Override
	public List<HashMap<String, String>> getChatList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getChatList", params);
	}

	@Override
	public String insertChatRoom(HashMap<String, String> params, List<String> chbox) throws Throwable {
		
		String seq = Integer.toString(sqlSession.selectOne("msg.getChatNumSeq", params));
		params.put("seq", seq);
		
		try {
			sqlSession.insert("msg.insertChatRoom", params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int i=0; i<chbox.size(); i++) {
			params.put("emp", chbox.get(i));
			sqlSession.insert("msg.insertEmp", params);
			String empName = sqlSession.selectOne("msg.getEmpName", params).toString();
			params.put("empName", empName);
			sqlSession.insert("msg.chatEmpAlert", params);
		}
		//FIXME 여기 수정해야함 값을 jsp로 넘겨야 됌
		return seq;
	}

	@Override
	public void chatroomInvite(HashMap<String, String> params, List<String> empbox) throws Throwable {
		
		for(int i=0; i<empbox.size(); i++) {
			params.put("empRoom", empbox.get(i));
			sqlSession.insert("msg.chatroomInvite", params);
			String empName = sqlSession.selectOne("msg.getEmpNm", params).toString();
			params.put("empName", empName);
			sqlSession.insert("msg.chatroomEmpAlert", params);
		}
	}
	
	@Override
	public List<HashMap<String, String>> getChat(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getChat", params);
	}

	@Override
	public void insertChat(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("msg.insertChat", params);
	}

	@Override
	public List<HashMap<String, String>> getChatInviteList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getChatInviteList", params);
	}

	@Override
	public List<HashMap<String, String>> getChatroomInviteList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getChatroomInviteList", params);
	}

//	원위치
	@Override
	public void chatroomExit(HashMap<String, String> params) throws Throwable {
		sqlSession.delete("msg.chatroomExit", params);
	}

	@Override
	public List<HashMap<String, String>> getAddChat(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("msg.getAddChat", params);
	}

	@Override
	public void chatTitleEdit(HashMap<String, String> params) throws Throwable {
		sqlSession.update("msg.chatRoomEdit", params);
	}
	
}
