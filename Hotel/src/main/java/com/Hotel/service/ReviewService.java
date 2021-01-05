package com.Hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Hotel.dto.HistoryDTO;
import com.Hotel.dto.ReviewDTO;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private HotelMapper hotelMapper;
	
	public String writeReview(ReviewDTO reviewDTO, String hocode) {
		// vcode 만들기
		String getVcode = reviewMapper.getvcode();
		String vcode;
		System.out.println(hocode);
		if(getVcode == null) {
			vcode = "RV" + "001";
		} else {
			int vcodeNum = Integer.parseInt(getVcode.substring(2,5)) + 1;
			if(vcodeNum < 10) {
				vcode = "RV" + "00" +vcodeNum;
			} else if(vcodeNum < 100) {
				vcode = "RV" + "0" + vcodeNum;
			} else {
				vcode = "RV" + vcodeNum;
			}
		}
		reviewDTO.setVcode(vcode);
		reviewDTO.setV_hocode(hocode);
		
		String data = "NO";
		// review insert & hoscore update
		int insertResult = reviewMapper.insertReview(reviewDTO);
		if(insertResult > 0) {
			int updateResult = hotelMapper.updateScore(hocode);
			data = "OK";
		}
		return data;
	}

	public Map<String, Object> deleteReview(String vcode, String hocode) {
		// review delete & hoscore update
		int deleteResult = reviewMapper.deleteReview(vcode);
		if(deleteResult > 0) {
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
		// review update & hoscore update
		int updateRVResult = reviewMapper.modifyReview(reviewDTO);
		if(updateRVResult > 0) {
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
		loginId = "치킨";
		history.setHi_vcode(vcode);
		history.setHiid(loginId);
		
		// 좋아요 insert
		int insertResult= reviewMapper.likeProcess(history);
		String data = "NO";
		if(insertResult > 0) {
			data = "OK";
		}
		return data;
	}

	public String unlikeProcess(String vcode, String loginId, String hocode) {
		HistoryDTO history = new HistoryDTO();
		loginId = "치킨";
		history.setHi_vcode(vcode);
		history.setHiid(loginId);
		
		// 좋아요 delete
		int deleteResult= reviewMapper.unlikeProcess(history);
		String data = "NO";
		if(deleteResult > 0) {
			data = "OK";
		}
		return data;
	}


}
