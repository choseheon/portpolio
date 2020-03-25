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
import com.smart.mango.web.inside.service.IBssDetService;
import com.smart.mango.web.inside.service.ICompService;

@Controller
public class BssDetController {

	@Autowired
	public IBssDetService iBssDetService;
	@Autowired
	public IPagingService iPagingService;

	@Autowired
	public ICommonService iCommonService;

	@Autowired
	public ICompService iCompService;

	// 영업상세조회창
	@RequestMapping(value = "/bssDet")
	public ModelAndView bssDet(HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		try {
			HashMap<String, String> bssNoData = iBssDetService.getBssNo(params);
			mav.addObject("bssNoData", bssNoData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("bss/bssDet");
		return mav;
	}
	// 맨처음 화면에서 진행상태가져오기.

	@RequestMapping(value = "getFirstAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getFirstAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			HashMap<String, String> data = iBssDetService.getFirst(params);
			modelMap.put("data", data);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAILED", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}

	// 기회가져오기
	@RequestMapping(value = "getChnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getChnAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			HashMap<String, String> data = iBssDetService.getChn(params);
			modelMap.put("data", data);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAILED", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}

	// 기회 -- 사업유형
	@RequestMapping(value = "getBssTypeAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBssTypeAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			List<HashMap<String, String>> list = iBssDetService.getBssType(params);
			modelMap.put("list", list);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAILED", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	} 
			// 기회 -- 사업유형
			@RequestMapping(value = "getBssTypeEndAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String getBssTypeEndAjax(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
					throws Throwable {
				ObjectMapper mapper = new ObjectMapper();
				Map<String, Object> modelMap = new HashMap<String, Object>();

				try {
					List<HashMap<String, String>> list = iBssDetService.getBssTypeEnd(params);
					modelMap.put("list", list);
					modelMap.put("SUCCESS", "SUCCESS");

				} catch (Exception e) {
					e.printStackTrace();
					modelMap.put("FAILED", "FAILED");
				}
				return mapper.writeValueAsString(modelMap);
			}
	// 기회 -- 매출구분
	@RequestMapping(value = "getBssSalesDivAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBssSalesDivAjax(@RequestParam HashMap<String, String> params, HttpSession session,
			ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			List<HashMap<String, String>> list = iBssDetService.getBssSalesDiv(params);
			modelMap.put("list", list);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAILED", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}

	// 담당자 목록 Get
	@RequestMapping(value = "/getBssEmpPopAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBssEmpPopAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iBssDetService.getEmpCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page")), cnt, 7, 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iBssDetService.getEmpList(params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	} // 예금주 조회
	@RequestMapping(value = "/getBssDepPopAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBssDepPopAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		int cnt = iBssDetService.getDepCnt(params);

		PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page3")), cnt, 7, 5);
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		List<HashMap<String, String>> list = iBssDetService.getDepList(params);

		modelMap.put("list", list);
		modelMap.put("pb", pb);

		return mapper.writeValueAsString(modelMap);
	}
	// 상품팝업 -- 상품구분
	@RequestMapping(value = "/getSelectProdDivAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getSelectProdDivAjax(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iBssDetService.getSelectProdDiv(params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	// 상품팝업 -- 상품유형
	@RequestMapping(value = "/getSelectProdTypeAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getSelectProdTypeAjax(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		List<HashMap<String, String>> list = iBssDetService.getSelectProdType(params);

		modelMap.put("list", list);

		return mapper.writeValueAsString(modelMap);
	}

	// 상품팝업 -- 기본상품테이블
	@RequestMapping(value = "/getProdDefaultListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getProdDefaultListAjax(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			int cnt = iBssDetService.getProdDefaultListCnt(params);

			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page1")), cnt, 5, 5);
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iBssDetService.getProdDefaultList(params);

			modelMap.put("list", list);
			modelMap.put("pb", pb);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}

	// 상품팝업 -- 현재상품
	@RequestMapping(value = "/getProdNowistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getProdNowistAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			int cnt = iBssDetService.getProdNowListCnt(params);

			PagingBean pb = iPagingService.getPagingBean(Integer.parseInt(params.get("page2")), cnt, 7, 5);
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			System.out.println(params);
			List<HashMap<String, String>> list = iBssDetService.getProdNowList(params);

			modelMap.put("list", list);
			modelMap.put("pb", pb);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAIELD", "FAIELD");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// 상품팝업 -- 현재상품등록
	@RequestMapping(value = "/getPopBssNoProdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getPopBssNoProdAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			int cnt = iBssDetService.getPopBssNoProd(params);
			modelMap.put("cnt", cnt);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAIELD", "FAIELD");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// 상품팝업 -- 현재상품등록
	@RequestMapping(value = "/updateNowProdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateNowProdAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iBssDetService.updateNowProd(params);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAIELD", "FAIELD");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// 상품팝업 -- 현재상품삭제
	@RequestMapping(value = "/deleteNowProdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String deleteNowProdAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iBssDetService.deleteNowProd(params);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAIELD", "FAIELD");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// 상품팝업 -- 현재상품수량저장
	@RequestMapping(value = "/updateNowProdEndAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateNowProdEndAjax(@RequestParam HashMap<String, String> params, ModelAndView mav)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iBssDetService.updateNowProdend(params);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAIELD", "FAIELD");
		}

		return mapper.writeValueAsString(modelMap);
	}

	// 상품 DROPDOWNLIST
	@RequestMapping(value = "/getProdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getProdAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			List<HashMap<String, String>> listGoods = iBssDetService.getProdGoods(params);
			modelMap.put("listGoods", listGoods);
			List<HashMap<String, String>> listService = iBssDetService.getProdService(params);
			modelMap.put("listService", listService);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAIELD", "FAIELD");
		}

		return mapper.writeValueAsString(modelMap);
	}
	/* 다음 단계로 넘어갈때 다음 단계의 테이블 생성*/
	@RequestMapping(value = "/bssNextProgAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bssNextProgAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			//다음 단계로 갈 때 현재 있는 단계의 종료 날짜를 UPDATE를 하기
			iBssDetService.updateBssEndDt(params);
			//다음 단계로 넘어가는 테이블 만들기.
			iBssDetService.makeNextProgTbl(params);
			//다음 단계의 테이블 번호가져오기.
			int bssNo = iBssDetService.getNextBssNo(params);
			modelMap.put("bssNo", bssNo);
			//list로 가져옵시다. 전 단계의 상품들을
			List<HashMap<String, String>> list = iBssDetService.getListBeforeProd(params);
			modelMap.put("list", list);
			//iBssDetService.makeNextProg(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	/*다음 단계로 넘어갔을 때 다음 단계의 상품테이블 만들기*/
	@RequestMapping(value = "/bssNextProgProdAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bssNextProgProdAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			
			//다음 단계의 번호를 가져왓지 그게 bssNo값이고
			//전 다음 단계의 번호로 전 단계의 테이블을 가져와서 생성하면되것네 그러면 전 단계의 데이터를 list로 가져와야겠죠?
			//값 : BssNO : 단계번호 ProdNo, Cnt, Price
			iBssDetService.updateBssNextProgProd(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapper.writeValueAsString(modelMap);
	}
	/* 영업진행상태마감확인 */
	@RequestMapping(value = "/bssProgChkAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String bssProgChkAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			//버튼  마감, 실패, 보류, 완료시 넘어가기...
			iBssDetService.updateProg(params);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			List<HashMap<String, String>> list = iBssDetService.getBssSche(params);
			modelMap.put("SUCCESS", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAILED", "FAILED");
		}

		return mapper.writeValueAsString(modelMap);
	}
	//제안시작날짜가져오기.
	@RequestMapping(value = "/getSgtChnDtAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getSgtChnDtAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			HashMap<String, String> data = iBssDetService.getSgtChnDt(params);
			modelMap.put("data", data);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	//제안읽어오기 
	@RequestMapping(value = "/getSgtAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getSgtAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			HashMap<String, String> data = iBssDetService.getSgt(params);
			modelMap.put("data", data);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	//협상시작날짜읽어오기.
	//협상읽어오기
	@RequestMapping(value = "/getNgtAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getNgtAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			HashMap<String, String> data = iBssDetService.getNgt(params);
			modelMap.put("data", data);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	// 계약그리기..
	@RequestMapping(value = "/getCtractAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getCtractAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			HashMap<String, String> data = iBssDetService.getCtract(params);
			modelMap.put("data", data);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	// 영업 의견 목록 Get
	@RequestMapping(value = "/getBssOpinAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBssOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {

			List<HashMap<String, String>> opin = iBssDetService.getBssOpin(params);
			int cnt = iBssDetService.getBssOpinCnt(params);

			modelMap.put("opin", opin);
			modelMap.put("cnt", cnt);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}

	// 영업 의견 Insert
	@RequestMapping(value = "/insertBssOpinAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String insertBssOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			iBssDetService.insertBssOpin(params);
			res = "SUCCESS";
		} catch (Exception e) {
			res = "FAILED";
			e.printStackTrace();
		}

		modelMap.put("res", res);

		return mapper.writeValueAsString(modelMap);
	}

	// 영업 의견 Delete
	@RequestMapping(value = "/delBssOpinAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delBssOpinAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		String res = "";
		try {
			iBssDetService.delBssOpin(params);
			res = "SUCCESS";
		} catch (Exception e) {
			res = "FAILED";
		}

		modelMap.put("res", res);

		return mapper.writeValueAsString(modelMap);
	}

	// 영업 관련 활동일정 Get
	@RequestMapping(value = "/getBssScheAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getBssScheAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		String str = "";
		if (params.get("acti0") != null) {
			str += "OR CC2.CODE_S_CATE = 0 ";
		}
		if (params.get("acti1") != null) {
			str += "OR CC2.CODE_S_CATE = 1 ";
		}
		if (params.get("acti2") != null) {
			str += "OR CC2.CODE_S_CATE = 2 ";
		}
		if (params.get("acti3") != null) {
			str += "OR CC2.CODE_S_CATE = 3 ";
		}
		if (params.get("acti3") != null) {
			str += "OR CC2.CODE_S_CATE = 4 ";
		}
		if (params.get("acti3") != null) {
			str += "OR CC2.CODE_S_CATE = 5 ";
		}
		if (params.get("acti3") != null) {
			str += "OR CC2.CODE_S_CATE = 6 ";
		}
		if (params.get("acti3") != null) {
			str += "OR CC2.CODE_S_CATE = 7 ";
		}
		if (params.get("acti3") != null) {
			str += "OR CC2.CODE_S_CATE = 8 ";
		}
		if (str.equals("")) {
			str += "1 != 1";
			params.put("filter", str);
		} else {
			params.put("filter", str.substring(3));
		}

		System.out.println(params + "\n\n\n");

		try {
			List<HashMap<String, String>> list = iBssDetService.getBssSche(params);
			modelMap.put("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_제안첨부자료 등록 Ajax */
	@RequestMapping(value = "/sgtInsertAttatchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String sgtInsertAttatchAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBssDetService.insertSgtAttach(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_협상첨부자료 등록 Ajax */
	@RequestMapping(value = "/ngtInsertAttatchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String ngtInsertAttatchAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBssDetService.insertNgtAttach(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_계약첨부자료 등록 Ajax */
	@RequestMapping(value = "/ctractInsertAttatchAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String ctractInsertAttatchAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBssDetService.insertCtractAttach(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_제안첨부자료 목록 Ajax */
	@RequestMapping(value = "/sgtAttatchListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String sgtAttatchListAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			List<HashMap<String, String>> list =  iBssDetService.sgtAttachList(params);
			modelMap.put("list", list);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_협상첨부자료 목록 Ajax */
	@RequestMapping(value = "/ngtAttatchListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String ngtAttatchListAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			List<HashMap<String, String>> list =  iBssDetService.ngtAttachList(params);
			modelMap.put("list", list);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_계약첨부자료 목록 Ajax */
	@RequestMapping(value = "/ctractAttatchListAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String ctractAttatchListAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			List<HashMap<String, String>> list =  iBssDetService.ctractAttachList(params);
			modelMap.put("list", list);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_첨부자료 삭제 Ajax */
	@RequestMapping(value = "/sgtAttatchDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String sgtAttatchDelAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBssDetService.delSgtAttach(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_첨부자료 삭제 Ajax */
	@RequestMapping(value = "/ngtAttatchDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String ngtAttatchDelAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBssDetService.delNgtAttach(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	/* 상세_첨부자료 삭제 Ajax */
	@RequestMapping(value = "/ctractAttatchDelAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8;")
	@ResponseBody
	public String ctractAttatchDelAjax(ModelAndView mav, HttpSession session, @RequestParam HashMap<String, String> params)
			throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			iBssDetService.delCtractAttach(params);
			modelMap.put("res", "SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", "FAILED");
		}
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/updateBssChnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String updateBssChnAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		try {
			iBssDetService.updateBssChn(params);
			modelMap.put("SUCCESS", "SUCCESS");

		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("FAIELD", "FAIELD");
		}

		return mapper.writeValueAsString(modelMap);
	}

}
