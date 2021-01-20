package com.Hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.FaqDTO;
import com.Hotel.dto.HelpDTO;
import com.Hotel.mapper.HelpMapper;
import com.Hotel.mapper.FaqMapper;

@Service
public class HelpService {

	@Autowired
	private HelpMapper helpMapper;

	@Autowired
	private FaqMapper faqMapper;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	// 1대1 문의 작성부분
	public String HelpWrite(HelpDTO helpDTO) {
		// hecode 만들기
		String gethecode = helpMapper.gethecode(); // 가장 큰 hecode 가져오기
		String hecode;
		int hecodeNum = 0;
		if (gethecode == null) hecode = "HE001";
		else hecodeNum = Integer.parseInt(gethecode.substring(2, 5)) + 1; // hecode에서 숫자부분만 따로 뽑아서 1을 더해준다.
		if (hecodeNum < 10) {
			hecode = "HE" + "00" + hecodeNum; // 더한 hecodeNum이 한자리 숫자면
		} else if (hecodeNum < 100) { // 더한 hecodeNum이 두자리 숫자면
			hecode = "HE" + "0" + hecodeNum;
		} else { // 더한 hecodeNum이 세자리 숫자면
			hecode = "HE" + hecodeNum;
		}
		helpDTO.setHecode(hecode);

		// HELP 테이블에 INSERT
		int WriteResult = helpMapper.HelpWrite(helpDTO);
		System.out.println("WriteResult:::" + WriteResult);
		String result = "NO";
		if(WriteResult > 0) {
			result = "OK";
		}
		return result;
	}

	// 자주묻는리스트를 ArrayList로 불러오는 부분
	public ModelAndView FaqList(FaqDTO faqDTO) {
		mav = new ModelAndView();
		ArrayList<FaqDTO> FaqList = faqMapper.FaqList();
		System.out.println("FaqList:::" + FaqList);
		mav.addObject("faqDTO", faqDTO);
		mav.addObject("FaqList", FaqList);
		mav.setViewName("help/FaqListForm");
		return mav;
	}

	// 자주묻는리스트 faqcode로 삭제
	public ModelAndView FaqListDel(String faqcode) {
		mav = new ModelAndView();
		int DeleteResult = faqMapper.FaqDelete(faqcode);
		System.out.println("DeleteResult::" + DeleteResult);
		mav.setViewName("redirect:/FaqList");
		return mav;
	}

//	자주묻는질문 
	public ModelAndView selectFaq() {
		mav = new ModelAndView();
		List<Map<String, Object>> FaqList = helpMapper.selectFAQList();
		mav.addObject("FaqList", FaqList);
		mav.setViewName("help/c_FaqListForm");
		return mav;
	}

//	1:1문의 답변
	public ModelAndView helpAnswer(String hecode) {
		mav = new ModelAndView();
		Map<String, Object> map = helpMapper.helpAnswer(hecode);
		mav.addObject("helpAnswer", map);
		mav.setViewName("admin/a_answerForm");
		return mav;
	}

//	답변 등록
	public String answerUpdate(String hecode, String heanswer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hecode", hecode);
		map.put("heanswer", heanswer);
		int updateResult = helpMapper.updateAnswer(map);
		String result = "NO";
		if (updateResult > 0) {
			result = "OK";
		}
		return result;
	}

	// 1대1질문 목록
	public ModelAndView questionList() {
		mav = new ModelAndView();

		String loginId = (String) session.getAttribute("MLoginId");
		System.out.println("loginId::" + loginId);
		ArrayList<HelpDTO> questionList = helpMapper.questionList(loginId);
		System.out.println(questionList);

		mav.addObject("questionList", questionList);
		mav.setViewName("member/c_questionList");
		return mav;
	}

	// 자묻질 작성
	public ModelAndView faqWriteForm(FaqDTO faqDTO) {
		mav = new ModelAndView();

		// 자묻질코드
		String faqcode;
		// 최대코드수
		String maxFaqNum = helpMapper.maxFaqNum();
		// faqcodeNum에 뒤숫자 3자리를 가져와 +1를 한다
		int faqcodeNum = Integer.parseInt(maxFaqNum.substring(2, 5)) + 1;

		if (faqcodeNum < 10) {
			faqcode = "FA" + "00" + faqcodeNum;
		} else if (faqcodeNum < 100) {
			faqcode = "FA" + "0" + faqcodeNum;
		} else {
			faqcode = "FA" + faqcodeNum;
		}
		faqDTO.setFaqcode(faqcode);

		int faqWrite = helpMapper.faqWriteForm(faqDTO);
		System.out.println("faqWriteForm::" + faqWrite);

		mav.setViewName("redirect:/FaqList");
		return mav;
	}

}
