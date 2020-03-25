package com.smart.mango.web.out.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smart.mango.web.out.dao.ICmpDao;

@Service
public class CmpService implements ICmpService{
	
	@Autowired
	public ICmpDao iCmpdao;
	
	@Override
	public HashMap<String, String> getTarget(String[] boxx, String[] chh, HashMap<String, String> params) throws Throwable {
		
		HashMap<String, String> term = new HashMap<String, String>();
		String str = "";
		String ch = "";
		  System.out.println("-----------------------------------------");
		
		if(boxx==null || chh==null) {
			System.out.println("22");
		}
		
		
		//조건문 str의 시작을 "AND( (" 로 함
		
		//boxx에있는 조건문 "_"를 기준으로 자르기
		if(boxx != null) {
			str ="AND( ( ";
			ch =" ";
			if(boxx.length==0 && chh.length==0) {
				str ="";
				ch="";
			}
			String[][] b = new String[boxx.length][2];
			
			for(int i = 0 ; i < boxx.length; i++) {
				b[i] = boxx[i].split("_");
			}
			if(boxx.length==0) {
				if(chh.length!=0) {
					str="";
					ch +="AND ( ( ";
				}
			}
			
			else {
				//boxx
				
				for(int i = 0; i<boxx.length; i++) {
					
						if(i != 0 ) {
							//앞에있는 조건이랑 뒤에조건이 다를때는 AND를 찍는다
							if(!b[i][0].equals( b[i-1][0])) {
								str += ") AND ( ";
							}
							//앞에 조건이랑 같으면 OR을 찍는다
							else if(b[i][0].equals(b[i-1][0])){
								str += " OR ";
							}
						} 
						//조건문 처음찍을때 i=0 구문
						switch (b[i][0]) {
						
						case "1":
							str += "GENDER = ";
							break;
						case "2":
							str += "ADDRESS = ";
							break;
						case "3":
							str += "PAY_MONEY  BETWEEN " ;
							break;
						case "4":
							str += "ABS(TO_CHAR(BIRTHD,'YYYY')-TO_CHAR(SYSDATE, 'YYYY') ) BETWEEN " ;
							break;
						case "5":
							str += "ABS(TO_CHAR(JDATE,'YYYY')-TO_CHAR(SYSDATE, 'YYYY') ) " ;
							break;
						}
						
//						if(b[i][1].equals("16")) {
//							str += " 10 AND 19";
//						}
//						else if(b[i][1].equals("17")) {
//							str += " 20 AND 29";
//						}
//						else if(b[i][1].equals("18")) {
//							str += " 30 AND 39";
//						}
//						else if(b[i][1].equals("19")) {
//							str += " 40 AND 49";
//						}
//						else if(b[i][1].equals("20")) {
//							str += " 50 AND 59";
//						}
//						else if(b[i][1].equals("21")) {
//							str += " 60 AND 69";
//						}
						
						
						str += b[i][1];
				
						//System.out.println(b[4][1]);
						if(i+1==boxx.length) {
							if(chh == null || chh.length==0) {
								
								str += ")  )";
							}
							else {
								str += "  )";
							}
							
						}
					
				} //for문 끝
				
			}
			
		}
		
		//chh배열에있는 조건문 "_" 기준으로 자르기
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		
		if(chh != null) { 
			if(boxx==null) {
				str = "";
				ch += " AND ( (";
			}
			if(boxx==null && chh.length==0) {
				str ="";
				ch="";
			}
			String[][] c = new String[chh.length][2];
			
			for(int i = 0 ; i < chh.length; i++) {
				c[i] = chh[i].split("_");
			}
			
			if(chh.length==0) {
				if(boxx!=null) {
					
					str +=") ";
					ch +="";
				}
			
			} else {
				
				//chh
				
				for(int i = 0; i<chh.length; i++) {
					if(i==0 && boxx!=null) {
						ch+=" AND ( ";
					}
					else if(i!=0 && boxx==null){
						ch+=" OR ";
					}
					else if(i!=0 && boxx!=null) {
						ch+=" OR ";
					}
					
						
					switch(c[i][1]) {
					case "1":
						ch += "PH_DR=1";
						break;
					case "2":
						ch += "PH_DR=1";
						break;
					case "3":
						ch += "EMAIL_DR=1";
						break;
					}
					
					if(i+1==chh.length) {
						if(boxx==null) {
							
							ch+= " ) )";
						}
						else {
							ch += " ) )";
						}
					}
					
				}
			}
			
		}
		
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@		 

		term = params;
		term.put("str", str+ch);
		
		
		return term;
	}


	@Override
	public int clientCnt(HashMap<String, String> params) throws Throwable {		return iCmpdao.clientCnt(params);
	}


	@Override
	public List<HashMap<String, String>> getClientList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCmpdao.getClientList(params);
	}

	@Override
	public int getCmpCnt(HashMap<String, String> params) throws Throwable {
		return iCmpdao.getCmpCnt(params);
	}

	@Override
	public void channelSelect(HashMap<String, String> params) throws Throwable {
		iCmpdao.channelSelect(params);
	}

	@Override
	public List<HashMap<String, String>> getCmpList(HashMap<String, String> params) throws Throwable {
		return iCmpdao.getCmpList(params);
	}

	@Override
	public void cmpAdd(HashMap<String, String> params) throws Throwable {
		iCmpdao.cmpAdd(params);	
	}

	@Override
	public void updateS(HashMap<String, String> params) throws Throwable {
		iCmpdao.updateS(params);
	}

	@Override
	public List<HashMap<String, String>> getsms(HashMap<String, String> params) throws Throwable {
		return iCmpdao.getsms(params);
	}


	@Override
	public List<HashMap<String, String>> getmms(HashMap<String, String> params) throws Throwable {
		return iCmpdao.getmms(params);
	}

	@Override
	public List<HashMap<String, String>> getemail(HashMap<String, String> params) throws Throwable {
		return iCmpdao.getemail(params);
	}


	@Override
	public List<HashMap<String, String>> getSim_result(HashMap<String, String> params) throws Throwable {
		return iCmpdao.getSim_result(params);
	}


	


	@Override
	public int searchClientCnt(HashMap<String, String> params) throws Throwable {
		return iCmpdao.searchClientCnt(params);
	}


	@Override
	public HashMap<String, String> getCmpS(HashMap<String, String> params) throws Throwable {
		return iCmpdao.getCmpS(params);
	}


	@Override
	public List<HashMap<String, String>> selectCbox(HashMap<String, String> params) throws Throwable {
		return iCmpdao.selectCbox(params);
	}


	@Override
	public void insertT(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iCmpdao.insertT(params);
	}


	@Override
	public List<HashMap<String, String>> selectCh(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iCmpdao.selectCh(params);
	}


	@Override
	public void save(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iCmpdao.save(params);
	}


	@Override
	public List<HashMap<String, String>> getCmpType(HashMap<String, String> params) throws Throwable {
		return iCmpdao.getCmpType(params);
	}


	@Override
	public List<HashMap<String, String>> cmpTypeList(HashMap<String, String> params) throws Throwable {
		return iCmpdao.cmpTypeList(params);
	}

}
