package com.Hotel.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.CompanyDTO;
import com.Hotel.mapper.CompanyMapper;

@Service
public class CompanyService {

	private ModelAndView mav;
	
	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	HttpSession session;
	
	public ModelAndView a_approveJoin() {
		mav = new ModelAndView();
		// 업체리스트 select
		ArrayList<CompanyDTO> companyList = companyMapper.a_approveJoin();
		System.out.println(companyList);
		mav.addObject("companyList", companyList);
		mav.setViewName("admin/a_approveJoin");
		return mav;
	}

	public String comDecline(String cmcode) {
		// 회원가입 승인 거절
		int updateResult = companyMapper.comDecline(cmcode);
		String result = "NO";
		if(updateResult > 0) {
			result = "OK";
		}
		return result;
	}
	
	public String comApprove(String cmcode) {
		// 회원가입 승인 허락
		int updateResult = companyMapper.comApprove(cmcode);
		String result = "NO";
		if(updateResult > 0) {
			result = "OK";
		}
		return result;
	}

}
