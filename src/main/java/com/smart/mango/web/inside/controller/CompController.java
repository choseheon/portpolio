package com.smart.mango.web.inside.controller;

import java.util.Collections;
import java.util.Comparator;
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
import com.smart.mango.web.inside.service.ICompService;

@Controller
public class CompController {
	@Autowired
	public ICompService iCompService;
	@Autowired
	public ICommonService iCommonService;
	@Autowired
	public IPagingService iPagingService;
	
	// 고객사 목록 페이지
	@RequestMapping(value = "/compList")
	public ModelAndView compList(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) {
		if(params.get("page") == null) {
			params.put("page", "1");
		}
		mav.addObject("page", params.get("page"));
		mav.setViewName("comp/compList");
		return mav;
	}
	
	// 고객사 목록 Get
	@RequestMapping(value="/getCompListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getCompListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iCompService.getCompCnt(params);
			
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCompService.getCompList(params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);
	
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 등록 페이지
	@RequestMapping(value = "/compAdd")
	public ModelAndView compAdd(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {			
		List<HashMap<String, String>> grade = iCompService.getGradeList();
		List<HashMap<String, String>> stat = iCompService.getStatList();
		
		mav.addObject("grade", grade);
		mav.addObject("stat", stat);
			
		mav.setViewName("comp/compAdd");
		return mav;
	}
	
	// 업종 목록 Get
	@RequestMapping(value="/getSectListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getSectListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iCompService.getSectCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 7, 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iCompService.getSectList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	}
	
	// 업종 중복 검사
	@RequestMapping(value="/checkSectNameAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String checkSectNameAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		// 2 : 중복있음 | 1 : 중복 없음
		int check = 2;
		int cnt = iCompService.checkSectName(params);
		if(cnt == 0) {
			check = 1;
		}
		modelMap.put("check", check);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 업종 Insert
	@RequestMapping(value="/insertSectAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String insertSectAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			iCompService.insertSect(params);
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 담당자 목록 Get
	@RequestMapping(value="/getEmpPopAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getEmpPopAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
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
	
	// 고객사명 중복 체크
	@RequestMapping(value="/checkCompNameAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String checkCompNameAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iCompService.checkCompName(params);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 insert
	@RequestMapping(value="/addCompAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addCompAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iCompService.insertComp(params);
			modelMap.put("res", "SUCCESS");
		} catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 정보 페이지
	@RequestMapping(value = "/compDetail")
	public ModelAndView compDetail(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		HashMap<String, String> data = iCompService.getCompData(params);
		mav.addObject("data", data);
		mav.setViewName("comp/compDetail");
		return mav;
	}
	
	// 고객사 관련 고객 Get
	@RequestMapping(value="/getClientAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getClientAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		List<HashMap<String, String>> list = iCompService.getClient(params);
		int cnt = iCompService.getClientCnt(params);

		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 관련 고객 인원수 Get
	@RequestMapping(value="/getClientCntAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getClientCntAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iCompService.getClientCnt(params);
		
		modelMap.put("cnt", cnt);
			
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 의견 목록 Get
	@RequestMapping(value="/getCompOpinAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getCompOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> opin = iCompService.getCompOpin(params);
		int cnt = iCompService.getCompOpinCnt(params);
		
		modelMap.put("opin", opin);
		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 의견 Insert
	@RequestMapping(value="/insertCompOpinAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String insertCompOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			iCompService.insertCompOpin(params);
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 의견 Delete
	@RequestMapping(value="/delCompOpinAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String delCompOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			iCompService.delCompOpin(params);
			res = "SUCCESS";
		}
		catch(Exception e) {
			res = "FAILED";
		}
		
		modelMap.put("res", res);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 관련 작업 목록 Get
	@RequestMapping(value="/getWorkListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getWorkListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> work = iCompService.getWorkLead(params);
		work.addAll(iCompService.getWorkChn(params));
		
		// 날짜별 정렬
		MapComparator compar = new MapComparator("DT");
		Collections.sort(work, compar);
		
		modelMap.put("work", work);
		modelMap.put("cnt", work.size());
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 수정 페이지
	@RequestMapping(value = "/compEdit")
	public ModelAndView compEdit(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {			
		List<HashMap<String, String>> grade = iCompService.getGradeList();
		List<HashMap<String, String>> stat = iCompService.getStatList();
		params.put("comp_no", params.get("view_no"));
		HashMap<String, String> data = iCompService.getCompData(params);

		mav.addObject("grade", grade);
		mav.addObject("stat", stat);
		mav.addObject("data", data);
			
		mav.setViewName("comp/compEdit");
		return mav;
	}
	
	// 고객사 Update
	@RequestMapping(value="/updateCompAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String updateCompAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iCompService.updateComp(params);
			modelMap.put("res", "SUCCESS");
		} catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 Delete
	@RequestMapping(value="/deleteCompAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String deleteCompAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iCompService.deleteComp(params);
			modelMap.put("res", "SUCCESS");
		} catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 고객사 관련 활동일정 Get
	@RequestMapping(value="/getCompScheAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getCompScheAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		String str = "";
		if(params.get("acti0") != null) {
			str += "OR CC2.CODE_S_CATE = 0 ";
		}
		if(params.get("acti1") != null) {
			str += "OR CC2.CODE_S_CATE = 1 ";
		}
		if(params.get("acti2") != null) {
			str += "OR CC2.CODE_S_CATE = 2 ";
		}
		if(params.get("acti3") != null) {
			str += "OR CC2.CODE_S_CATE = 3 ";
		}
		if(str.equals("")) {
			str += "1 != 1";
			params.put("filter", str);
		}
		else {
			params.put("filter", str.substring(3));			
		}
		
		System.out.println(params + "\n\n\n");
			
		List<HashMap<String, String>> list = iCompService.getCompSche(params);
		
		modelMap.put("list", list);
		return mapper.writeValueAsString(modelMap);
	}
}

// 관련 작업 리스트 키별 정렬
class MapComparator implements Comparator<HashMap<String, String>> {
	private final String key;
	
	public MapComparator(String key) {
		this.key = key;
	}
	
	@Override
	public int compare(HashMap<String, String> f, HashMap<String, String> s) {
		int result = s.get(key).compareTo(f.get(key));
		return result;
	}
}


