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
import com.smart.mango.web.common.service.ICommonService;
import com.smart.mango.web.inside.service.IBssPpsService;
import com.smart.mango.web.inside.service.ICompService;
@Controller
public class BssPpsController {

	@Autowired
	public IBssPpsService iBssPpsService;
	
	@Autowired
	public ICompService iCompService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping(value = "/bssPpsList")
	public ModelAndView bssPpsList(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		
		mav.setViewName("bssPps/bssPpsList");
		return mav;
	}
	
	@RequestMapping(value = "/bssPpsListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bssPpsListAjax(@RequestParam HashMap<String,String> params,
			ModelAndView mav, HttpSession session) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		try {
			int cnt = iBssPpsService.getBssPpsCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String,String>> list = iBssPpsService.getBssPpsList(params);
			List<HashMap<String,String>> departList = iBssPpsService.getDepartList(params);
			
			modelMap.put("list",list);
			modelMap.put("departList",departList);
			modelMap.put("pb", pb);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bssPpsDeleteAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bssPpsDeleteAjax(@RequestParam HashMap<String,String> params,
			ModelAndView mav, HttpSession session) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		iBssPpsService.updateBssPpsDelete(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bssPpsAdd")
	public ModelAndView bssPpsAdd(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav)throws Throwable {
		
		
		mav.setViewName("bssPps/bssPpsAdd");
		return mav;
	}
	
	@RequestMapping(value="/EmpPopAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String EmpPopAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iCompService.getEmpCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 7, 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCompService.getEmpList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bssPpsAddAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bssPpsAddAjax(@RequestParam HashMap<String,String> params,
			ModelAndView mav, HttpSession session) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		iBssPpsService.insertBssPpsAdd(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/bssPpsEdit")
	public ModelAndView bssPpsEdit(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		HashMap<String,String> data = iBssPpsService.getBssPpsOne(params);
		
		mav.addObject("data",data);
		mav.setViewName("bssPps/bssPpsEdit");
		return mav;
	}
	
	@RequestMapping(value = "/bssPpsEditAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bssPpsEditAjax(@RequestParam HashMap<String,String> params,
			ModelAndView mav, HttpSession session) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		iBssPpsService.updateBssPpsEdit(params);
		
		return mapper.writeValueAsString(modelMap);
	}
}
