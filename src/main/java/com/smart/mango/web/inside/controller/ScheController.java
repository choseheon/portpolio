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
import com.smart.mango.web.inside.service.IBssDetService;
import com.smart.mango.web.inside.service.IClientService;
import com.smart.mango.web.inside.service.ILeadService;
import com.smart.mango.web.inside.service.IScheService;

@Controller
public class ScheController {

	@Autowired
	public ICommonService iCommonService;

	@Autowired
	public IScheService iScheService;

	@Autowired
	public IClientService iClientService;

	@Autowired
	public ILeadService iLeadService;

	@Autowired
	public IBssDetService iBssService;

	@Autowired
	public IPagingService iPagingService;

	/* 일정 달력 View */
	@RequestMapping(value = "/scheCalendar")
	public ModelAndView scheCalendar(ModelAndView mav,HttpSession session) throws Throwable {

		mav.setViewName("sche/scheCalendar");

		return mav;
	}

	/* 일정 조회 View */
	@RequestMapping(value = "/scheList")
	public ModelAndView scheList(ModelAndView mav,HttpSession session) throws Throwable {
		mav.setViewName("sche/scheList");

		return mav;
	}

	/* 일정 조회 View Test용 - 김현 */
	@RequestMapping(value = "/scheListTest")
	public ModelAndView scheListTest(ModelAndView mav,HttpSession session) throws Throwable {

		mav.setViewName("sche/scheListTest");

		return mav;
	}

	/* 리스트 테스트 용 */
	@RequestMapping(value = "/listAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String listAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iScheService.scheList(params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	/*
	 * ---------------------------------------------일정 등록, 수정, 세부사항 공통
	 * -------------------------------------------------------
	 */

	/* 의견 등록 (일정 등록,수정,세부사항 ) */
	@RequestMapping(value = "/scheInsertOpinAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheInsertOpinAjax(ModelAndView mav, HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));

		try {
			iScheService.insertOpin(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	/* 의견 삭제 (일정 수정,세부사항 ) */
	@RequestMapping(value = "/scheOpinDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheOpinDelAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));

		try {
			iScheService.deleteOpin(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	/* 첨부자료,일정상품,의견 리스트 출력 (일정 수정,세부사항 ) */
	@RequestMapping(value = "/loadOpinListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loadOpinListAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iScheService.getOpinCnt(params);
		int attachCnt = iScheService.getAttachCnt(params);
		int minutesCnt = iScheService.getMinutesCnt(params);
		int prodCnt = iScheService.getProdCnt(params);

		List<HashMap<String, String>> list = iScheService.getOpinList(params);
		List<HashMap<String, String>> attachlist = iScheService.getAttachList(params);
		List<HashMap<String, String>> minuteslist = iScheService.getMinutesList(params);
		List<HashMap<String, String>> prodlist = iScheService.getProdList(params);

		modelMap.put("cnt", cnt);
		modelMap.put("attachCnt", attachCnt);
		modelMap.put("minutesCnt", minutesCnt);
		modelMap.put("prodCnt", prodCnt);
	
		modelMap.put("list", list);
		modelMap.put("attachlist", attachlist);
		modelMap.put("minuteslist", minuteslist);
		modelMap.put("prodlist", prodlist);

		return mapper.writeValueAsString(modelMap);
	}

	/* 일정구분, 활동분류 리스트 출력 (일정 등록,수정 ) */
	@RequestMapping(value = "/scheSelectListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheSelectListAjax(ModelAndView mav, HttpSession session,
			@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> radio = iScheService.getRadioList(params);
		
		if(params.get("scheDivNoM") == "") {
			params.put("scheDivNoM","10");
		}
		
		List<HashMap<String, String>> option = iScheService.getOptionList(params);

		modelMap.put("radio", radio);
		modelMap.put("option", option);

		return mapper.writeValueAsString(modelMap);
	}

	/* 고객,리드,기회 검색 ( 일정 등록,수정 ) */
	@RequestMapping(value = "scheClientSearchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheClientSearchAjax(@RequestParam HashMap<String, String> params,HttpSession session, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		if (Integer.parseInt(params.get("schDivNo")) == 0) {
			int cnt = iScheService.getClientCnt(params);

			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 7, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iScheService.getClientList(params);

			modelMap.put("list", list);
			modelMap.put("pb", pb);
		} else if (Integer.parseInt(params.get("schDivNo")) == 1) {
			int cnt = iScheService.getLeadCnt(params);

			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 7, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iScheService.getLeadList(params);

			modelMap.put("list", list);
			modelMap.put("pb", pb);
		} else if (Integer.parseInt(params.get("schDivNo")) == 2) {
			int cnt = iScheService.getBssCnt(params);

			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 7, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iScheService.getBssList(params);

			modelMap.put("list", list);
			modelMap.put("pb", pb);
		}

		return mapper.writeValueAsString(modelMap);
	}

	/* 일정 세부사항, 수정 화면 데이터 출력 */
	@RequestMapping(value = "scheDataAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheDataAjax(@RequestParam HashMap<String, String> params,HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		 String address = iScheService.getScheFixData(params);
		  
		 modelMap.put("address",address);

		HashMap<String, String> scheData = iScheService.getScheData(params);

		if (Integer.parseInt(params.get("scheDivNoM")) == 0) {
			HashMap<String, String> scheDivData = iScheService.getCiData(params);	
			modelMap.put("scheDivData", scheDivData);
		} else if (Integer.parseInt(params.get("scheDivNoM")) == 1) {
			HashMap<String, String> scheDivData = iScheService.getLeadData(params);
			modelMap.put("scheDivData", scheDivData);
		} else if (Integer.parseInt(params.get("scheDivNoM")) == 2) {
			HashMap<String, String> scheDivData = iScheService.getBssData(params);
			modelMap.put("scheDivData", scheDivData);
		}

		modelMap.put("scheData", scheData);

		return mapper.writeValueAsString(modelMap);

	}

	/*
	 * ---------------------------------------------일정 등록, 수정, 세부사항 공통
	 * end-------------------------------------------------------
	 */

	/*
	 * ----------------------------------------------------------일정
	 * 등록-----------------------------------------------------------
	 */
	/* 일정 등록 View */
	@RequestMapping(value = "/scheAdd")
	public ModelAndView scheAdd(@RequestParam HashMap<String, String> params, ModelAndView mav,HttpSession session) throws Throwable {

		if (params.get("client_no") != null) {
			HashMap<String, String> client = iClientService.getClientData(params);
			mav.addObject("client", client);
		} else if (params.get("lead_no") != null) {
			HashMap<String, String> lead = iLeadService.getLeadData(params);
			mav.addObject("lead", lead);
		} else if (params.get("chnNo") != null) {
			HashMap<String, String> bss = iBssService.getChn(params);
			mav.addObject("bss", bss);
		}

		mav.setViewName("sche/scheAdd");

		return mav;
	}

	/* 일정 등록 Ajax */
	@RequestMapping(value = "/scheAddAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String scheAddAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));

		try {

			iScheService.insertSche(params);
			int cnt = iScheService.getScheNo(params);
			params.put("ScheNo", Integer.toString(cnt));
			if (Integer.parseInt(params.get("scheDivNoM")) == 0) {
				iScheService.insertScheClient(params);
			} else if (Integer.parseInt(params.get("scheDivNoM")) == 1) {
				iScheService.insertScheLead(params);
				params.put("cNo", "");
				iScheService.insertScheClient(params);
			} else if (Integer.parseInt(params.get("scheDivNoM")) == 2) {
				int prog_cnt = iScheService.getScheBssProgNo(params);
				params.put("progCnt", Integer.toString(prog_cnt));
				iScheService.insertScheBss(params);
				params.put("cNo", "");
				iScheService.insertScheClient(params);
			}

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);

	}

	/*----------------------------------------------------------일정 등록 end-----------------------------------------------------------*/

	/*----------------------------------------------------------일정수정-----------------------------------------------------------*/

	/* 일정 수정 View */
	@RequestMapping(value = "/scheFix")
	public ModelAndView scheFix(ModelAndView mav, @RequestParam HashMap<String, String> params,HttpSession session) throws Throwable {
		
		mav.setViewName("sche/scheFix");
		
		return mav;
	}
	
	
	/* 일정 수정 Ajax */
	@RequestMapping(value = "/scheFixAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String scheFixAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {

			iScheService.updateSche(params);
			
			if (Integer.parseInt(params.get("scheDivNoM")) == 0) {
				try {
					iScheService.updateScheClient(params);
				}catch(Exception e) {
					e.printStackTrace();
				}
			} else if (Integer.parseInt(params.get("scheDivNoM")) == 1) {
				iScheService.updateScheLead(params);
				params.put("cNo", "");
				iScheService.updateScheClient(params);
			} else if (Integer.parseInt(params.get("scheDivNoM")) == 2) {
				int prog_cnt = iScheService.getScheBssProgNo(params);
				params.put("progCnt", Integer.toString(prog_cnt));
				iScheService.updateScheBss(params);
				params.put("cNo", "");
				iScheService.updateScheClient(params);
			}
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);

	}
	
	/* 일정 수정_삭제 Ajax */
	@RequestMapping(value = "/scheFixDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String scheFixDeleteAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {

			iScheService.deleteSche(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);

	}
	
	/* 일정 수정_첨부자료 등록 Ajax */
	@RequestMapping(value = "/scheInsertAttatchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String scheInsertAttatchAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {

			iScheService.insertScheAttach(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);

	}
	
	/* 일정 수정_첨부자료 삭제 Ajax */
	@RequestMapping(value = "/scheAttachDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheAttachDelAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));

		try {
			iScheService.deleteAttach(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	/* 일정 수정_회의록 등록 Ajax */
	@RequestMapping(value = "/scheInsertMinutesAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String scheInsertMinutesAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));
		
		try {
			iScheService.insertScheMinutes(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);

	}
	
	/* 일정 수정_회의록 선택 데이터 출력 Ajax */
	@RequestMapping(value = "scheMinutesDetAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheMinutesDetAjax(@RequestParam HashMap<String, String> params,HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		HashMap<String, String> minutesData = iScheService.getMinutesData(params);

		modelMap.put("minutesData", minutesData);

		return mapper.writeValueAsString(modelMap);

	}
	
	/* 일정 수정_회의록 삭제 Ajax */
	@RequestMapping(value = "/scheMinutesDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheMinutesDelAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));

		try {
			iScheService.deleteMinutes(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	/* 일정 수정_회의록 수정 Ajax */
	@RequestMapping(value = "/scheUpdateMinutesjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String scheUpdateMinutesjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("sEmpNo", String.valueOf(session.getAttribute("sEmpNo")));
		
		try {

			iScheService.updatesMinutes(params);
			
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);

	}
	
	/* 일정 수정_일정상품 데이터 리스트 출력 Ajax */
	@RequestMapping(value = "loadProdListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String loadProdListAjax(@RequestParam HashMap<String, String> params,HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> prodList = iScheService.schePordList(params);

		modelMap.put("prodList", prodList);

		return mapper.writeValueAsString(modelMap);

	}
	
	/* 일정 수정_일정상품 등록 Ajax */
	@RequestMapping(value = "/scheInsertProdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String scheInsertProdAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iScheService.insertScheProd(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);

	}
	
	/* 일정 수정_회의록 삭제 Ajax */
	@RequestMapping(value = "/scheProdDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheProdDelAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iScheService.deleteProd(params);

			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}

	/*----------------------------------------------------------일정 수정 end-----------------------------------------------------------*/
	
	/* 일정 세부사항 View */
	@RequestMapping(value = "/scheDet")
	public ModelAndView scheDet(ModelAndView mav,HttpSession session, @RequestParam HashMap<String, String> params) throws Throwable {

		mav.setViewName("sche/scheDet");

		return mav;
	}

	/*-----------------------------------------일정 List----------------------------------*/
	@RequestMapping(value = "scheListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheListAjax(@RequestParam HashMap<String, String> params,HttpSession session, ModelAndView modelAndView)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int cnt = iScheService.getScheListCnt(params);
		
		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		try {
			List<HashMap<String, String>> list = iScheService.getScheList(params);
			modelMap.put("list", list);	
		} catch (Exception e) {
			e.printStackTrace();			
		}
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap);
	}
	/*-------------------------------일정 Calendar------------------------------------*/
	@RequestMapping(value="scheCalendarAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String scheCalendarAjax(@RequestParam HashMap<String, String> params,HttpSession session, ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			List<HashMap<String, String>> list = iScheService.getScheCalendar(params);
			
			modelMap.put("list", Utils.toLowerListMapKey(list));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mapper.writeValueAsString(modelMap);
	}
}
