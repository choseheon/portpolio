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
import com.smart.mango.web.inside.service.ILeadService;
import com.sun.org.apache.bcel.internal.classfile.Attribute;

@Controller
public class LeadController {
	@Autowired
	public ILeadService iLeadService;

	@Autowired
	public IPagingService iPagingService;

	@Autowired
	public ICommonService iCommonService;

	@RequestMapping(value = "/leadList")
	public ModelAndView leadList(@RequestParam HashMap<String,String> params, HttpSession session, ModelAndView mav) {
				
		mav.setViewName("Lead/leadList");
		return mav;
	}

	@RequestMapping(value = "/leadReg")
	public ModelAndView leadReg(HttpSession session, ModelAndView mav) {
		mav.setViewName("Lead/leadReg");

		return mav;
	}
	
	@RequestMapping(value = "/leadupdate")
	public ModelAndView leadupdate(@RequestParam HashMap<String,String> params, HttpSession session, ModelAndView mav) throws Throwable {
		System.out.println(params +"\n\n\n\n\n\n\n\n\n\n\n\n\n");
		
		HashMap<String, String> data = iLeadService.updateList(params);
		
		mav.addObject("data", data);
		
		mav.setViewName("Lead/leadupdate");
		return mav;
	}
	@RequestMapping(value = "listupdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") // 형태지정
	@ResponseBody
	public String listupdateAjax(@RequestParam HashMap<String, String> params, 
							ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iLeadService.updateLead(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "leadRegAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") // 형태지정
	@ResponseBody
	public String leadRegAjax(@RequestParam HashMap<String, String> params, 
							ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iLeadService.insertLead(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "uploadAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") // 형태지정
	@ResponseBody
	public String uploadAjax(@RequestParam HashMap<String, String> params, 
							ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iLeadService.insertattach(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "deleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") // 형태지정
	@ResponseBody
	public String deleteAjax(@RequestParam HashMap<String, String> params, 
							ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iLeadService.updateattach(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "uploadListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String uploadListAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iLeadService.getattachlist(params);
		
		
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/leadCardView")
	public ModelAndView leadCardView(HttpSession session, ModelAndView mav) {
		mav.setViewName("Lead/leadCardView");

		return mav;
	}

	@RequestMapping(value = "leadListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadListAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		
		int cnt = iLeadService.getleadCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		

		List<HashMap<String, String>> list = iLeadService.getLeadlist(params);
		
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "leadCardAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadCardAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iLeadService.getLeadCard(params);		
		
		modelMap.put("list", list);		

		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "leadpopAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String leadpopAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		 int cnt = iLeadService.getpopCnt(params);
		 PagingBean pb =iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 7,5);
		 params.put("startCnt", Integer.toString(pb.getStartCount()));
		 params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> pop = iLeadService.getclientList(params);
		
		modelMap.put("pop", pop);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "leadDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") // 형태지정
	@ResponseBody
	public String leadDelAjax(@RequestParam HashMap<String, String> params, 
							ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iLeadService.deleteLead(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			
			modelMap.put("res", "FAILED");
		}
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "editAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String editAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iLeadService.editLs(params);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/leadDetail")
	public ModelAndView leadDetail(HttpSession session, ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		HashMap<String, String> data = iLeadService.getLeadData(params);
		if(!String.valueOf(data.get("COMP_ZC")).equals("null") && !String.valueOf(data.get("COMP_ADDR")).equals("null")) {
			data.put("COMP_ADDR", "(" + data.get("COMP_ZC") + ")  " + data.get("COMP_ADDR"));
			if(!String.valueOf(data.get("COMP_DETAIL_ADDR")).equals("null")){
				data.put("COMP_ADDR", data.get("COMP_ADDR")+ ", " +data.get("COMP_DETAIL_ADDR"));
			}
		}
		try {
			iLeadService.leadchk(params);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		mav.addObject("data", data);
		mav.setViewName("Lead/leadDetail");
		
		return mav;
	}
	
	@RequestMapping(value="/modLeadStatAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String modLeadStatAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iLeadService.modLeadStat(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getLeadScheAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getLeadScheAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
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
			
		List<HashMap<String, String>> scheList = iLeadService.getLeadSche(params);
		
		
		modelMap.put("scheList", scheList);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getClientListAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getClientListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
			
		List<HashMap<String, String>> list = iLeadService.getClient(params);
		int cnt = iLeadService.getClientCnt(params);

		modelMap.put("cnt", cnt);
		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getClientListCntAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getClientListCntAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		int cnt = iLeadService.getClientCnt(params);

		modelMap.put("cnt", cnt);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/getLeadOpinAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getLeadOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iLeadService.getLeadOpinCnt(params);
		
		List<HashMap<String, String>> opinList = iLeadService.getLeadOpin(params);
		
		modelMap.put("cnt", cnt);
		modelMap.put("opinList", opinList);
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/addLeadOpinAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addLeadOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iLeadService.addLeadOpin(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/delLeadOpinAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String delLeadOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iLeadService.delLeadOpin(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/insertChnAjax", method=RequestMethod.POST, produces="text/json;charset=UTF-8")
	@ResponseBody
	public String insertChnAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			
			int chk = iLeadService.chkBssChn(params);
			
			if(chk > 0) {
				modelMap.put("res", "FALSE");
			} else {
				iLeadService.insertChn(params);
				modelMap.put("res", "SUCCESS");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	
}
