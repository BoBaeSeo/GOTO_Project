package com.Hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.service.CompanyService;

@Controller
public class CompanyController {

	private ModelAndView mav;
	
	@Autowired
	private CompanyService companyService;
	
	// 업체 회원가입 승인 페이지 (관리자) 
	@RequestMapping(value = "a_approveJoin")
	public ModelAndView a_approveJoin() {
		System.out.println("a_approveJoin");
		mav = companyService.a_approveJoin(); 
		return mav;
	}
	
	// 회원가입 거절
	@RequestMapping(value = "comDecline")
	public @ResponseBody String comDecline(String cmcode) {
		System.out.println("comDecline");
		String result = companyService.comDecline(cmcode);
		return result;
	}

	// 회원가입 승인
	@RequestMapping(value = "comApprove")
	public @ResponseBody String comApprove(String cmcode) {
		System.out.println("comApprove");
		String result = companyService.comApprove(cmcode);
		return result;
	}
}
