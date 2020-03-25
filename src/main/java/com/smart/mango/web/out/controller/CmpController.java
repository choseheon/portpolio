package com.smart.mango.web.out.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.smart.mango.web.out.service.ICmpService;

@Controller
public class CmpController {

	@Autowired
	public ICmpService icmpservice;

	@Autowired
	public IPagingService iPagingService;

	// 대상선정 페이지
	@RequestMapping(value = "/targetSelect")
	public ModelAndView targetSelect(ModelAndView mav) {

		mav.setViewName("cmp/targetSelect");

		return mav;
	}

	// 대상선정페이지 ajax
	@RequestMapping(value = "/targetAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String targetAjax(@RequestParam(required = false) String[] boxx,
			@RequestParam(required = false) String[] chh, @RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			// 검색한 고객수 카운트
			// int searchCnt = icmpservice.searchClientCnt(params);
			int cnt = icmpservice.clientCnt(params);

			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 10);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			HashMap<String, String> term = icmpservice.getTarget(boxx, chh, params);
			System.out.println(term);
			List<HashMap<String, String>> list = icmpservice.getClientList(term);
			modelMap.put("list", list);
			modelMap.put("pb", pb);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}

	// 캠페인리스트 페이지
	@RequestMapping(value = "/cmpList")
	public ModelAndView cmpList(ModelAndView mav) {

		mav.setViewName("cmp/cmpList");

		return mav;
	}

	
	
	// cmpListAjax
	@RequestMapping(value = "/cmpListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String cmpListAjax(@RequestParam HashMap<String, String> params,	ModelAndView mav) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			int cnt = icmpservice.getCmpCnt(params);
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 10);
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = icmpservice.getCmpList(params);
			modelMap.put("list", list);
			modelMap.put("pb", pb);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}

	// 캠페인 등록(기본정보 입력)
	@RequestMapping(value = "/cmpAdd")
	public ModelAndView cmpAdd(ModelAndView mav,@RequestParam HashMap<String, String> params) throws Throwable{
		List<HashMap<String, String>> list = icmpservice.getCmpType(params);
		mav.addObject("list",list);
		
		mav.setViewName("cmp/cmpAdd");

		return mav;
	}

	// 캠페인등록 ajax
	@RequestMapping(value = "/cmpAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody // Spring은 View를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게하는 어노테이션
	public String cmpAddAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			icmpservice.cmpAdd(params);
			modelMap.put("seq", params.get("seq"));
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {

			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}

	// 시뮬레이션결과
	@RequestMapping(value = "/simResult")
	public ModelAndView Sim_result(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		/*
		 * HashMap<String, String> data = icmpservice.getCmpS(params);
		 * mav.addObject("data", data);
		 */

		mav.setViewName("cmp/simResult");

		return mav;
	}

	
	@RequestMapping(value = "/Sim_resultAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Sim_resultAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = icmpservice.getSim_result(params);

		modelMap.put("list", list);

		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}

	// 채널선정
	@RequestMapping(value = "/channelSelect")
	public ModelAndView channelSelect(ModelAndView mav) {

		mav.setViewName("cmp/channelSelect");

		return mav;
	}

	// 채널선정 ajax
	@RequestMapping(value = "/SaveAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String SaveAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		icmpservice.channelSelect(params);
		modelMap.put("res", "SUCCESS");

		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}

	// 진행상태update ajax
	@RequestMapping(value = "/updatestatAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody // Spring은 View를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게하는 어노테이션
	public String updatestatAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			icmpservice.updateS(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}

	// target Insert
	@RequestMapping(value = "/insertTargetAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody // Spring은 View를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게하는 어노테이션
	public String insertTargetAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		try {
			icmpservice.insertT(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	// 대상선정 체크박스 select
	@RequestMapping(value = "/checkCboxAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String checkCboxAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = icmpservice.selectCbox(params);

		modelMap.put("list", list);

		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}
	
	// 채널선정 select
	@RequestMapping(value = "/selectChAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String selectChAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> list = icmpservice.selectCh(params);
		
		modelMap.put("list", list);
			
		// writeValueAsString -> Map의 데이터를 문자열(JSON)으로 변환처리
		return mapper.writeValueAsString(modelMap);
	}

	// sms
	@RequestMapping(value = "/chcpListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String chcpListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			List<HashMap<String, String>> list = icmpservice.getsms(params);
			modelMap.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}

	// mms
	@RequestMapping(value = "/mmsListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String mmsListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			List<HashMap<String, String>> mms = icmpservice.getmms(params);
			modelMap.put("mms", mms);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}

	// email
	@RequestMapping(value = "/emailListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String emailListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			List<HashMap<String, String>> email = icmpservice.getemail(params);
			modelMap.put("email", email);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/saveAjax", method = RequestMethod.POST, produces = "test/json; charset=UTF-8")
	@ResponseBody // spring은 View를 활용하여 구현하게 되어 있어 View인것으로 인식시켜 넘어가게 하는 어노테이션
	public String saveAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView modelAndView)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			icmpservice.save(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/cmptypeAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody // Spring은 View를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게하는 어노테이션
	public String cmptypeAjax(@RequestParam HashMap<String,String> params, 
			HttpSession session,ModelAndView mav) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> cmpTypeList = icmpservice.cmpTypeList(params);
		
		modelMap.put("cmpTypeList",cmpTypeList);
		return mapper.writeValueAsString(modelMap);
	}

}
