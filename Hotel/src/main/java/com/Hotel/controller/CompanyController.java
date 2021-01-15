package com.Hotel.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.CompanyDTO;
import com.Hotel.service.CompanyService;

@Controller
public class CompanyController {
	@Autowired
	private CompanyService companyService;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 관리자로그인 페이지
	@RequestMapping(value = "/AdminLoginForm")
	public String AdminLoginForm() {
		System.out.println("관리자로그인 폼!!");
		return "company/AdminLoginForm";
	}

	// 관리자로그인 부분
	@RequestMapping(value = "/AdminLogin")
	public ModelAndView AdminLogin(CompanyDTO companyDTO) {
		System.out.println("/AdminLogin");
		System.out.println("관리자로그인 넘어가는..");
		mav = companyService.AdminLogin(companyDTO);
		System.out.println(companyDTO);
		return mav;
	}


	// 업체정보상세보기
	@RequestMapping(value = "/cpInfoView")
	public ModelAndView cpInfoView(String cmcode) {
		System.out.println("/cpInfoView");
		System.out.println("업체정보수정 view부분");
		System.out.println("cmcode::" + cmcode);
		mav = companyService.cpInfoView(cmcode);
		return mav;
	}

	// 업체정보수정 폼 
	@RequestMapping(value = "/CompanyModify")
	public ModelAndView CompanyModify(String cmcode) {
		System.out.println("/CompanyModify");
		System.out.println("업체정보수정폼");
		System.out.println("cmcode::" + cmcode);
		mav = companyService.CompanyModify(cmcode);
		return mav;
	}
	
	// 업체정보수정!!부분
		@RequestMapping(value = "/CompanyModifyProcess")
		public ModelAndView CompanyModifyProcess(CompanyDTO companyDTO) {
			System.out.println("/CompanyModifyProcess");
			System.out.println("업체정보수정부분");
			mav = companyService.CompanyModifyProcess(companyDTO);
			System.out.println(companyDTO);
			return mav;
		}
		
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
		
		// 추가
		// 업체 매출 확인
		@RequestMapping(value = "companySales")
		public ModelAndView companySales(@RequestParam(value = "year", defaultValue = "0") int year) {
			System.out.println("companySales");
			mav = companyService.companySales(year);
			return mav;
		}
	
}
