package com.smart.mango.web.out.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.smart.mango.web.out.service.IMsgService;

@Controller
public class MsgController {
	
	@Autowired
	public IMsgService iMsgService;
	
	//채팅방 페이지
	@RequestMapping(value = "/msgChat")
	public ModelAndView msgChat(ModelAndView mav) {
		mav.setViewName("msg/msgChat");
		
		return mav;
	}
	
	//채팅방 초대하기 페이지
		@RequestMapping(value = "/msgInvite")
		public ModelAndView msgInvite(ModelAndView mav, HttpSession session) {
			mav.setViewName("msg/msgInvite");
                                                           			
			return mav;
		}
	
	@RequestMapping(value = "/getMsgDepartListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody //Spring은 View를 활용하여 구현하게 되어 있어 View인것으로 인식시켜 넘어가게 하는 어노테이션
	public String getMsgDepartListAjax(@RequestParam HashMap<String, String> params,
									ModelAndView modelAndView) throws Throwable {
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	List<HashMap<String, String>> list = iMsgService.getMsgDepartList(params);
	
	modelMap.put("list", list);
	
	return mapper.writeValueAsString(modelMap);
	}
		
	//업체목록
	@RequestMapping(value="/getMsgInviteListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String getMsgInviteListAjax(@RequestParam HashMap<String,String> params,
										HttpSession session, ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));
	List<HashMap<String,String>> list = iMsgService.getMsgInviteList(params);
	
	modelMap.put("list", list);
	return mapper.writeValueAsString(modelMap);
	}

	//부서select 선택에 따른 팀 목록
	@RequestMapping(value="/getMsgTeamListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String getMsgTeamListAjax(@RequestParam HashMap<String,String> params,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	List<HashMap<String,String>> team = iMsgService.getMsgTeamList(params);
	
	modelMap.put("team", team);
	
	return mapper.writeValueAsString(modelMap);
	}
		
	//채팅하기 - 내가 참여한 채팅방 리스트
	@RequestMapping(value="/insertChatRoomAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String insertChatRoomAjax(@RequestParam HashMap<String,String> params,
							@RequestParam("chbox") List<String> chbox,
							HttpSession session,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	chbox.add(String.valueOf(session.getAttribute("sEmpNo")));
	try {
		String seq = iMsgService.insertChatRoom(params, chbox);
		modelMap.put("seqNo", seq);
		// FIXME 여기 채팅방 목록 띄우기가 수정이 필요함.  
	} catch (Exception e) {
		e.printStackTrace();
	}
	return mapper.writeValueAsString(modelMap);
	}

	//채팅방 목록 페이지
	@RequestMapping(value = "/msgList")
	public ModelAndView msgList(ModelAndView mav) {
		mav.setViewName("msg/msgList");
		
		return mav;
	}
	
	//채팅하기 - 북마크 챗 리스트
	@RequestMapping(value="/getChatBookmarkListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String getChatBookmarkListAjax(@RequestParam HashMap<String,String> params,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	List<HashMap<String,String>> bookmark = iMsgService.getChatBookmarkList(params);
	
	modelMap.put("bookmark", bookmark);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//채팅하기 - 내가 참여한 채팅방 리스트
	@RequestMapping(value="/getChatListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String getChatListAjax(@RequestParam HashMap<String,String> params,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	List<HashMap<String,String>> chat = iMsgService.getChatList(params);
	
	modelMap.put("chat", chat);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//채팅방 - 참여한 채팅방의 기록
	@RequestMapping(value="/getChatAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String getChatAjax(@RequestParam HashMap<String,String> params,
							HttpSession session,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	List<HashMap<String,String>> chat = iMsgService.getChat(params);
	
	modelMap.put("chat", chat);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//채팅보내기 - insert
	@RequestMapping(value="/insertChatAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String insertChatAjax(@RequestParam HashMap<String,String> params,
							HttpSession session,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	iMsgService.insertChat(params);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//getAddChatAjax
	@RequestMapping(value="/getAddChatAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String getAddChatAjax(@RequestParam HashMap<String,String> params,
								HttpSession session,
								ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	List<HashMap<String, String>> add = iMsgService.getAddChat(params);
	
	modelMap.put("add", add);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//채팅방 초대하기 버튼 클릭시 초대목록 (자신포함)
	@RequestMapping(value="/getChatInviteListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String getChatInviteListAjax(@RequestParam HashMap<String,String> params,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	List<HashMap<String,String>> list = iMsgService.getChatInviteList(params);
	
	modelMap.put("list", list);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//채팅방내에서 초대 가능목록띄우기
	@RequestMapping(value="/getChatroomInviteListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String getChatroomInviteListAjax(@RequestParam HashMap<String,String> params,
							HttpSession session,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	List<HashMap<String,String>> invite = iMsgService.getChatroomInviteList(params);
	
	modelMap.put("invite", invite);
	
	return mapper.writeValueAsString(modelMap);
	}
	
	
	//
	@RequestMapping(value="/chatroomInviteAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String chatroomInviteAjax(@RequestParam HashMap<String,String> params,
							@RequestParam("empbox") List<String> empbox,
							HttpSession session,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	try {
		iMsgService.chatroomInvite(params, empbox);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//chatExitAjax
	@RequestMapping(value="/chatroomExitAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String chatroomExitAjax(@RequestParam HashMap<String,String> params,
							HttpSession session,
							ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	try {
		iMsgService.chatroomExit(params);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return mapper.writeValueAsString(modelMap);
	}
	
	//chatTitleEditAjax
	@RequestMapping(value="/chatTitleEditAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String chatTitleEditAjax(@RequestParam HashMap<String,String> params,
									ModelAndView mav) throws Throwable{
	
	ObjectMapper mapper = new ObjectMapper();
	Map<String, Object> modelMap = new HashMap<String, Object>();
	
	try {
		iMsgService.chatTitleEdit(params);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return mapper.writeValueAsString(modelMap);
	}
}
