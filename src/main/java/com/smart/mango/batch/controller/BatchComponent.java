package com.smart.mango.batch.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.smart.mango.batch.service.IBatchService;

import com.smart.mango.web.inside.service.ILeadService;

@Component
public class BatchComponent {
	@Autowired
	public IBatchService iBatchService;
	
	// 초 분 시 일 월 요일
	// * - 모든
	// ? - 월, 요일에 사용. 신경안씀이라는 의미
	// 월은 1 - 12
	// 요일은 1(일) - 7(토). ,(컴마)로 복수지정가능. 예)월수금 - 2,4,6
	// 숫자1/숫자2의 경우 숫자1에서 시작하여 매 숫자2마다 실행. 예) 분에 0/5이면 0분부터 5분마다 실행
	// 일에서 L은 달의 마지막날. W는 지정일자가 휴일(토, 일)이면 인접한 평일에 수행.
	// 예) 25W인경우 25일이 일요일이면 26일 월요일 실행.
	// LW는 마지막 평일
	// 요일에서 숫자1#숫자2의경우 숫자2번째 주의 숫자1번 요일에 실행.
	// 예) 2#4 - 4번째주 월요일에 실행.

	@Autowired
	public ILeadService iLeadService;
	
	@Scheduled(cron = "0 40 11 * * *")
	public void leadHistoryReset() throws Throwable {
		iLeadService.leadchkreset();
	}
	
	// 발송기 랜덤 처리
	@Scheduled(cron = "0 43 17 * * *")
	public void runRandomMachine() {
		System.out.println("ㅈㅊㄱㅈㅊㄱ ㅇㅇㅇ! ");
		try {
			
			iBatchService.randomMachine();
			List<HashMap<String, String>> list = iBatchService.getContent();
			
			
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
	// 기간종료 캠페인 정보업데이트
	@Scheduled(cron = "0 0 1 * * *")
	public void cmpMachineEnd() {
		try {
			iBatchService.cmpMachineEnd();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

}
