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
import com.smart.mango.util.Utils;
import com.smart.mango.web.common.service.ICommonService;
import com.smart.mango.web.inside.service.IEmpService;

@Controller
public class EmpController {
	@Autowired
	public IEmpService iEmpService;
	@Autowired
	public ICommonService iCommonService;
	@Autowired
	public IPagingService iPagingService;
	
	// 사원 목록 페이지
	@RequestMapping(value = "/empMgtList")
	public ModelAndView empMgtList(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) {
		if(params.get("page") == null) {
			params.put("page", "1");
		}
		mav.addObject("page", params.get("page"));

		mav.setViewName("emp/empMgtList");
		return mav;
	}
	
	// 사원 목록 Get
	@RequestMapping(value="/getEmpListAjax", 
					method=RequestMethod.POST, 
					produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getEmpListAjax(@RequestParam HashMap<String, String> params, 
								 ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iEmpService.getEmpCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(
							Integer.parseInt(params.get("page")), cnt, 10, 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = iEmpService.getEmpList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
	
		return mapper.writeValueAsString(modelMap);
	}
	
	// 사원 등록 페이지
	@RequestMapping(value = "/empMgtAdd")
	public ModelAndView empMgtAdd(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		params.put("flag", "INSERT");
		List<HashMap<String, String>> posi = iEmpService.getPosiList(params);
		List<HashMap<String, String>> form = iEmpService.getFormList();
		List<HashMap<String, String>> depart = iEmpService.getDepartList();
		List<HashMap<String, String>> author = iEmpService.getAuthorList();

		mav.addObject("posi", posi);
		mav.addObject("form", form);
		mav.addObject("depart", depart);
		mav.addObject("author", author);
		
		mav.setViewName("emp/empMgtAdd");
		return mav;
	}
	
	// 팀 list Get
	@RequestMapping(value="/getTeamListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getTeamListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> team = iEmpService.getTeamList(params);
		
		modelMap.put("team", team);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 이메일 중복 체크
	@RequestMapping(value="/checkEmailAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String checkEmailAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iEmpService.checkEmail(params);
		
		cnt = (cnt > 0)? 0:1;
		modelMap.put("cnt", cnt);
		modelMap.put("selector", ".email_validator");
		
		if(cnt == 0) {
			modelMap.put("res", "이메일이 중복되었습니다.");
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// ID 중복 체크
	@RequestMapping(value="/checkEmpIdAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String checkEmpIdAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iEmpService.checkEmpId(params);
		
		cnt = (cnt > 0)? 0:1;
		modelMap.put("cnt", cnt);
		modelMap.put("selector", ".id_validator");
		
		if(cnt == 0) {
			modelMap.put("res", "id가 중복되었습니다.");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 사원 insert
	@RequestMapping(value="/addEmpAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addEmpAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			params.put("emp_pw", Utils.encryptAES128(params.get("emp_pw")));
			iEmpService.insertEmp(params);
			modelMap.put("res", "SUCCESS");
		} catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 사원 update
	@RequestMapping(value="/updateEmpAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String updateEmpAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			if(params.get("emp_pw") != null && !params.get("emp_pw").equals("")) {
				params.put("emp_pw", Utils.encryptAES128(params.get("emp_pw")));
			}
			iEmpService.updateEmp(params);
			modelMap.put("res", "SUCCESS");
		} catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 사원 delete
	@RequestMapping(value="/deleteEmpAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String deleteEmpAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			System.out.println(params + "\n\n\n");
			iEmpService.deleteEmp(params);
			modelMap.put("res", "SUCCESS");
		} catch(Exception e) {
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 사원 정보 페이지
	@RequestMapping(value = "/empMgtDetail")
	public ModelAndView empMgtDetail(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		HashMap<String, String> data = iEmpService.getEmpData(params);
		mav.addObject("data", data);
		mav.setViewName("emp/empMgtDetail");
		return mav;
	}
	
	// 팀 소속 사원 Get
	@RequestMapping(value="/getTeamEmpAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getTeamEmpAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		List<HashMap<String, String>> list = iEmpService.getTeamEmp(params);
		int cnt = iEmpService.getTeamEmpCnt(params);

		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	// 팀 팀소속 사원 인원수 Get
	@RequestMapping(value="/getTeamCntAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getTeamCntAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iEmpService.getTeamEmpCnt(params);

		modelMap.put("cnt", cnt);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	// 사원 수정 페이지
	@RequestMapping(value = "/empMgtEdit")
	public ModelAndView empMgtEdit(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		params.put("flag", "UPDATE");
		List<HashMap<String, String>> posi = iEmpService.getPosiList(params);
		List<HashMap<String, String>> form = iEmpService.getFormList();
		List<HashMap<String, String>> depart = iEmpService.getDepartList();
		List<HashMap<String, String>> author = iEmpService.getAuthorList();
		
		params.put("emp_no", params.get("view_no"));
		HashMap<String, String> data = iEmpService.getEmpData(params);

		mav.addObject("posi", posi);
		mav.addObject("form", form);
		mav.addObject("depart", depart);
		mav.addObject("author", author);
		mav.addObject("data", data);
		
		mav.setViewName("emp/empMgtEdit");
		return mav;
	}
}
