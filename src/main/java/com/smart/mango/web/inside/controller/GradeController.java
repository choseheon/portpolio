package com.smart.mango.web.inside.controller;

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
import com.smart.mango.web.common.service.ICommonService;
import com.smart.mango.web.inside.service.IGradeService;

@Controller
public class GradeController {
	@Autowired
	public ICommonService iCommonService;
	
	@Autowired
	public IGradeService iGradeService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/gradeList")
	public ModelAndView gradeList(ModelAndView mav) throws Throwable{
		
		mav.setViewName("grade/gradeList");
		
		return mav;
	}
	
	@RequestMapping(value="/gradeEdit")
	public ModelAndView gradeEdit(ModelAndView mav) throws Throwable{
		
		mav.setViewName("grade/gradeEdit");
		
		return mav;
	}
	
	@RequestMapping(value="/gradeChange")
	public ModelAndView gradeChange(ModelAndView mav) throws Throwable{
		
		mav.setViewName("grade/gradeChange");
		
		return mav;
	}
	
	@RequestMapping(value="/getGradeAjax", method = RequestMethod.POST,
			   produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getGradeAjax(@RequestParam HashMap<String, String> params,
						   ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, Object>> grade = iGradeService.getGrade(params);
		
		modelMap.put("grade", grade);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/editGradeAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String editGradeAjax(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iGradeService.editGrade(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/delGradeAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delGradeAjax(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iGradeService.delGrade(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/insertGradeAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String insertGradeAjax(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iGradeService.insertGrade(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/updateGradeAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateGradeAjax(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iGradeService.updateGrade(params);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getGradeListAjax", method = RequestMethod.POST,
			   produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getGradeListAjax(@RequestParam HashMap<String, String> params,
						   ModelAndView mav) throws Throwable{
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iGradeService.gradeListCnt(params);
		
		PagingBean pb = null;
		if(params.get("addr") == null) {
			pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 6, 5);
		}else {
			pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		}
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iGradeService.getGradeList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
}
