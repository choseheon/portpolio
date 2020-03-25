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
import com.smart.mango.web.out.service.IchCompService;

@Controller
public class chCompController {
	
	@Autowired
	public IchCompService ichcompservice;
	
	@Autowired
	public IPagingService iPagingService;
	
	//채널업체 페이지
	@RequestMapping(value = "/channelComp")
	public ModelAndView channelComp(ModelAndView mav) {

		mav.setViewName("chComp/channelComp");

		return mav;
	}
	
	//업체목록
	@RequestMapping(value="/chcompListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody 
	public String chcpListAjax(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable{
	
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			int cnt = ichcompservice.CompCnt(params);
			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt , 10 ,5); 
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			 
			System.out.println(params);
			List<HashMap<String,String>> list = ichcompservice.getComp(params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	
	//채널목록
	@RequestMapping(value="/chListAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	
	@ResponseBody 
	public String chListAjax(@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String,String>> list = ichcompservice.getCh(params);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	//업체등록
	@RequestMapping(value="/chcompsaveAjax",
			method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")

	@ResponseBody // Spring은 View를 활용하여 구현하게 되어있어 View인것으로 인식시켜 넘어가게하는 어노테이션
	public String chcompsaveAjax(@RequestParam HashMap<String,String> params, 
							HttpSession session,ModelAndView mav) throws Throwable{
	
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			ichcompservice.saveComp(params);
			modelMap.put("res","SUCCESS");
		} catch(Exception e){
			System.out.println(("#money"));
			e.printStackTrace();
			modelMap.put("res","FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	

	
}
