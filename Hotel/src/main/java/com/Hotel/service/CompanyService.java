package com.Hotel.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

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
	
	//관리자로그인부분 세션값 ALoginId
	public ModelAndView AdminLogin(CompanyDTO companyDTO) {
		mav = new ModelAndView();
		
		String ALoginId = companyMapper.AdminLogin(companyDTO);
		System.out.println("ALoginId:::"+ALoginId);
		session.setAttribute("ALoginId", ALoginId);
		
		if (ALoginId!=null) {
			mav.setViewName("redirect:/");
		}else {
			mav.setViewName("company/AdminLoginForm");
		}
		mav.addObject("companyDTO", companyDTO);
		return mav;
	}

	//업체정보 상세보기
	public ModelAndView cpInfoView(String cmcode) {
		mav = new ModelAndView();
		CompanyDTO companyDTO = companyMapper.cpInfoView(cmcode);
		mav.addObject("companyDTO",companyDTO);
		mav.setViewName("company/cpInfoView");
		return mav;
	}

	//업체정보수정 폼
	public ModelAndView CompanyModify(String cmcode) {
		mav = new ModelAndView();
		CompanyDTO companyDTO = companyMapper.cpInfoView(cmcode);
		mav.addObject("companyDTO", companyDTO);
		mav.setViewName("company/CompanyModifyForm");
		
		return mav;
	}

	//업체정보수정 부분
	public ModelAndView CompanyModifyProcess(CompanyDTO companyDTO) {
		mav = new ModelAndView();
		int UpdateResult = companyMapper.CompanyModifyProcess(companyDTO);
		System.out.println("cmcode ::"+ companyDTO.getCmcode());
		System.out.println("UpdateResult::"+UpdateResult);
		mav.setViewName("redirect:/cpInfoView?cmcode="+companyDTO.getCmcode());
		
		return mav;
	}
	
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

	// 추가
	public ModelAndView companySales() {
		mav = new ModelAndView();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String loginId = (String) session.getAttribute("ALoginId");
		loginId = "AACM";
		Calendar firstDate = Calendar.getInstance();
		firstDate.set(firstDate.get(Calendar.YEAR), Calendar.JANUARY, 1);
		Calendar lastDate = Calendar.getInstance();
		lastDate.set(lastDate.get(Calendar.YEAR), Calendar.DECEMBER, 31);
		
		String firstDateFormat = format.format(firstDate.getTime());
		String lastDateFormat = format.format(lastDate.getTime());
		
		List<Map<String, Object>> salesList = companyMapper.salesList(firstDateFormat, lastDateFormat, loginId);
		System.out.println(salesList);
		
		
		
		mav.addObject("salesList", salesList);
		return null;
	}

}
