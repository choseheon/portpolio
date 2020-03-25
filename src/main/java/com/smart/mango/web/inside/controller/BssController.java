package com.smart.mango.web.inside.controller;

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
import com.smart.mango.web.inside.service.IBssService;

@Controller
public class BssController {

	@Autowired  
	public IBssService iBssService;
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/bssMain")
	public ModelAndView bssMain(HttpSession session,@RequestParam HashMap<String,String> params,
								ModelAndView mav) throws Throwable {

		mav.setViewName("bss/bssMain");
		return mav;
	}
	
	@RequestMapping(value = "/bssMainAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String bssMainAjax(@RequestParam HashMap<String,String> params,
						ModelAndView mav, HttpSession session) throws Throwable{

		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String, String>> bssList = iBssService.getBssList(params);
		
		modelMap.put("bssList", bssList);
			
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bssLeadAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String bssLeadAjax(@RequestParam HashMap<String,String> params,
						ModelAndView mav, HttpSession session) throws Throwable{

		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String, String>> leadList = iBssService.getLeadList(params);
		
		modelMap.put("leadList", leadList);
			
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "bssListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )
	@ResponseBody
	public String bssListAjax(@RequestParam HashMap<String, String> params,
			HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = iBssService.getBssCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
				List<HashMap<String, String>> bssList = iBssService.getBss(params);
				
				modelMap.put("bssList", bssList);
				modelMap.put("pb", pb);
		} catch (Exception e){
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	//목록 클릭시 기회, 리드번호 세션에 가져오기
	@RequestMapping(value = "bssNoAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8" )
	@ResponseBody
	public String bssChnNoAjax(@RequestParam HashMap<String, String> params,
			HttpSession session, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			HashMap<String, String> data = iBssService.getBssNo(params);
			
			session.setAttribute("sChnNo", data.get("CHN_NO"));
			session.setAttribute("sLeadNo", data.get("LEAD_NO"));
		} catch (Exception e){
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
}
