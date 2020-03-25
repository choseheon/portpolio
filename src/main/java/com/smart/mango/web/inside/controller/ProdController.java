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
import com.smart.mango.web.inside.service.IProdService;

@Controller
public class ProdController {
	@Autowired
	public IProdService iProdService;
	@Autowired
	public ICommonService iCommonService;
	@Autowired
	public IPagingService iPagingService;

	@RequestMapping(value = "/prodList")
	public ModelAndView prodList(ModelAndView mav) {

		mav.setViewName("prod/prodList");
		return mav;
	}

	@RequestMapping(value = "/goodsAdd")
	public ModelAndView goodsAdd(ModelAndView mav) {

		mav.setViewName("prod/goodsAdd");
		return mav;
	}
	@RequestMapping(value = "/goodsUpdate")
	public ModelAndView goodsUpdate(ModelAndView mav, HashMap<String, String> params) throws Throwable {
		
				 
		
		mav.setViewName("prod/goodsUpdate");
		return mav;
	}

	@RequestMapping(value = "/goodsDet")
	public ModelAndView goodsDet(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Throwable {
		try {
			HashMap<String, String> data = iProdService.getdata(params);
			mav.addObject("data", data);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		/*
		 * HashMap<String, String> dataprod = iProdService.getproddata(params);
		 * mav.addObject("dataprod", dataprod);
		 */
		 
		

		mav.setViewName("prod/goodsDet");
		return mav;
	}

	// 상품 -> 서비스 리스트
	@RequestMapping(value = "/ServicelistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ServicelistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
			HashMap<String, String> data = iProdService.getdata(params);
			mav.addObject("data", data);

		 int cnt2 = iProdService.getservicelistCnt(params);

		 PagingBean pb2 =
		 iPagingService.getPagingBean(Integer.parseInt(params.get("page2")), cnt2, 10,
		 5);
		 params.put("startCnt", Integer.toString(pb2.getStartCount()));
		 params.put("endCnt", Integer.toString(pb2.getEndCount()));

		List<HashMap<String, String>> Service = iProdService.getServiceList(params);

		modelMap.put("Service", Service);
		 modelMap.put("pb2", pb2);

		return mapper.writeValueAsString(modelMap);
	}

	// 상품 -> 제품 리스트
	@RequestMapping(value = "/GoodslistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String GoodslistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, String> data = iProdService.getdata(params);
		mav.addObject("data", data);
		
		 int cnt1 = iProdService.getgoodslistCnt(params);
		 
		 PagingBean pb1 = iPagingService.getPagingBean(Integer.parseInt(params.get("page1")), cnt1, 10,
		 5);
		 params.put("startCnt", Integer.toString(pb1.getStartCount()));
		 params.put("endCnt", Integer.toString(pb1.getEndCount()));
		 
		List<HashMap<String, String>> Goods = iProdService.getGoodsList(params);
		
		modelMap.put("Goods", Goods);
		modelMap.put("pb1", pb1);
		
		return mapper.writeValueAsString(modelMap);
	}

//제품등록
	@RequestMapping(value = "/AddGoodsAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String AddGoodsAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iProdService.addgoodsdata(params);

			modelMap.put("res", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
//서비스 등록

	@RequestMapping(value = "/AddServiceAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String AddServiceAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			iProdService.addservicedata(params);
			
			modelMap.put("res", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	//상품등록
	@RequestMapping(value = "/AddProdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String AddProdAjax(@RequestParam HashMap<String, String> params, Map<String, String> SEQ ,ModelAndView mav)
			throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iProdService.addproddata(params);
			HashMap<String, String> data = iProdService.getLastProd(params);
			modelMap.put("data", data);
			modelMap.put("res", "SUCCESS");
			
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	//상세보기 안에서 글삭제
	@RequestMapping(value = "/DetdeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String DetdeleteAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
			iProdService.Detdeletedata(params);
			

		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value = "/Detdelete2Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	
	@ResponseBody
	public String Detdelete2Ajax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		iProdService.Detdeletedata2(params);
		
		
		return mapper.writeValueAsString(modelMap);
	}
	//글수정
	@RequestMapping(value = "/DetupdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String DetupdateAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iProdService.updatedata(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}
	//글수정2
	@RequestMapping(value = "/Detupdate2Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String Detupdate2Ajax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iProdService.update2data(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}

}