package com.Hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.HistoryDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.ReviewDTO;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	@Autowired
	private HotelMapper hotelMapper;

	@Autowired
	private HttpSession session;

	private ModelAndView mav;

	public String writeReview(ReviewDTO reviewDTO, String hocode, String v_bcode) {
		// vcode 만들기
		String getVcode = reviewMapper.getvcode(); // 가장 큰 vcode 가져오기
		String vcode;
		System.out.println(hocode);
		if(getVcode == null) getVcode = "RV000";
		int vcodeNum = Integer.parseInt(getVcode.substring(2, 5)) + 1; // vcode에서 숫자부분만 따로 뽑아서 1을 더해준다.
		if (vcodeNum < 10) {
			vcode = "RV" + "00" + vcodeNum; // 더한 vcodeNum이 한자리 숫자면
		} else if (vcodeNum < 100) { // 더한 vcodeNum이 두자리 숫자면
			vcode = "RV" + "0" + vcodeNum;
		} else { // 더한 vcodeNum이 세자리 숫자면
			vcode = "RV" + vcodeNum;
		}
		System.out.println(v_bcode);
		reviewDTO.setV_bcode(v_bcode);
		reviewDTO.setVcode(vcode);
		reviewDTO.setV_hocode(hocode);

		String data = "NO";
		// review insert & hotel 별점 update
		int insertResult = reviewMapper.insertReview(reviewDTO);
		if (insertResult > 0) {
			int updateResult = hotelMapper.updateScore(hocode);
			data = "OK";
		}
		return data;
	}

	public Map<String, Object> deleteReview(String vcode, String hocode) {
		// review delete & hotel 별점 update
		int deleteResult = reviewMapper.deleteReview(vcode);
		if (deleteResult > 0) {
			int updateResult = hotelMapper.updateScore(hocode);
		}

		// reviewList, 개수, hotel 별점 가져오기
		ArrayList<ReviewDTO> reviewList = reviewMapper.getReviewList(hocode);
		int reviewCnt = reviewMapper.getReviewCnt(hocode);
		float hoscore = hotelMapper.getHoscroe(hocode);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("reviewList", reviewList);
		data.put("reviewCnt", reviewCnt);
		data.put("hoscore", hoscore);
		return data;
	}

	public Map<String, Object> modifyReview(ReviewDTO reviewDTO, String hocode) {
		// review update & hotel 별점 update
		int updateRVResult = reviewMapper.modifyReview(reviewDTO);
		if (updateRVResult > 0) {
			int updateHOResult = hotelMapper.updateScore(hocode);
		}

		// reviewList, 개수, hotel 별점 가져오기
		ArrayList<ReviewDTO> reviewList = reviewMapper.getReviewList(hocode);
		int reviewCnt = reviewMapper.getReviewCnt(hocode);
		float hoscore = hotelMapper.getHoscroe(hocode);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("reviewList", reviewList);
		data.put("reviewCnt", reviewCnt);
		data.put("hoscore", hoscore);
		return data;
	}

	public String likeProcess(String vcode, String loginId, String hocode) {
		HistoryDTO history = new HistoryDTO();
		history.setHi_vcode(vcode);
		history.setHiid(loginId);

		// 좋아요 insert
		int insertResult = reviewMapper.likeProcess(history);
		String data = "NO";
		if (insertResult > 0) {
			data = "OK";
		}
		return data;
	}

	public String unlikeProcess(String vcode, String loginId, String hocode) {
		HistoryDTO history = new HistoryDTO();
		history.setHi_vcode(vcode);
		history.setHiid(loginId);

		// 좋아요 delete
		int deleteResult = reviewMapper.unlikeProcess(history);
		String data = "NO";
		if (deleteResult > 0) {
			data = "OK";
		}
		return data;
	}

	// 나의 리뷰 삭제
	public ModelAndView reviewDelete(String vcode) {
		mav = new ModelAndView();

		int historyDelete = reviewMapper.historyDelete(vcode);

		int reviewDelete = reviewMapper.reviewDelete(vcode);
		System.out.println("delete");
		mav.setViewName("redirect: /reviewPage");
		return mav;
	}

	public ModelAndView reviewPage(int page) {
		mav = new ModelAndView();
		String MloginId = (String) session.getAttribute("MLoginId");
		int pageLimit = 5;
		int pageNumLimit = 3;

		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;

		PageDTO pageDTO = new PageDTO();
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);

		ArrayList<ReviewDTO> reviewList = reviewMapper.reviewPage(startRow, endRow, MloginId);
		System.out.println(page);

		int reviewListCnt = reviewMapper.getReviewListCnt();
		int maxPage = (int) (Math.ceil((double) reviewListCnt / pageLimit));
		int startPage = ((int) (Math.ceil((double) page / pageNumLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);

		mav.addObject("reviewList", reviewList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("member/reviewPage");
		return mav;
	}

	// 관리자
	// 후기리스트
	public ModelAndView a_selectReviewList() {
		mav = new ModelAndView();
		List<Map<String, Object>> reviewList = reviewMapper.selectReviewList();
		mav.addObject("reviewList", reviewList);
		mav.setViewName("admin/a_reviewList");
		return mav;
	}
	
	//후기리스트삭제 
	@Transactional(rollbackFor = Exception.class)
	public ModelAndView reviewListDel(String vcode) {
		mav = new ModelAndView();
		int HistoryDel = reviewMapper.historyDelete(vcode);
		int ReviewDel = reviewMapper.deleteReview(vcode);
		System.out.println("HistoryDel::" + HistoryDel);
		System.out.println("ReviewDel::" + ReviewDel);
		mav.setViewName("redirect:/a_reviewList");
		return mav;
	}

}
