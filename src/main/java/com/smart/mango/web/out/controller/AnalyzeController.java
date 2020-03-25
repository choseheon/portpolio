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
import com.smart.mango.common.bean.PagingBean;
import com.smart.mango.common.service.IPagingService;
import com.smart.mango.web.out.service.IAnalyzeService;

@Controller
public class AnalyzeController {
	
	@Autowired
	public IAnalyzeService iAnalyzeService;
	
	@Autowired
	public IPagingService iPagingService;
	
	//대상선정 페이지
	@RequestMapping(value = "/perfAnalyze")
	public ModelAndView perfAnalyze(ModelAndView mav, HttpSession session) {

		mav.setViewName("perfAnalyze/perfAnalyze");

		return mav;
	}
	
	//캠페인번호 제목 갱신
	@RequestMapping(value = "/getCmpTitleAjax",
			method = RequestMethod.POST,
			produces = "test/json; charset=UTF-8")
	@ResponseBody
	public String getCmpTitleAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			List<HashMap<String, String>> title = iAnalyzeService.getCmpTitle(params);
			modelMap.put("title", title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	//피드백 등록
	@RequestMapping(value = "/insertFeedbAjax",
					method = RequestMethod.POST,
					produces = "test/json; charset=UTF-8")
	@ResponseBody
	public String insertFeedbAjax(@RequestParam HashMap<String, String> params,
									HttpSession session,
									ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));
			iAnalyzeService.insertFeedb(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	//캠페인번호에 따른 피드백 목록 갱신
	@RequestMapping(value = "/getFeedbListAjax",
			method = RequestMethod.POST,
			produces = "test/json; charset=UTF-8")
	@ResponseBody
	public String getFeedbListAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iAnalyzeService.getFeedbCnt(params);
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")),cnt,10,5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> feedb = iAnalyzeService.getFeedbList(params);
			modelMap.put("feedb", feedb);
			modelMap.put("pb", pb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
}
