package com.Hotel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Hotel.dto.ReviewDTO;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;
	
	@Autowired
	private HotelMapper hotelMapper;
	
	public Map<String, Object> writeReview(ReviewDTO reviewDTO, String hocode) {
		// vcode 만들기
		String getVcode = reviewMapper.getvcode();
		String vcode;
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
		
		// review insert & hoscore update
		int insertResult = reviewMapper.insertReview(reviewDTO);
		if(insertResult > 0) {
			int updateResult = hotelMapper.updateScore(reviewDTO);
		}
		// review 내용, 개수, hotel 별점 가져오기
		ReviewDTO newReview = reviewMapper.getNewReview(vcode);
		int reviewCnt = reviewMapper.getReviewCnt(hocode);
		float hoscore = hotelMapper.getHoscroe(hocode);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("newReview", newReview);
		data.put("reviewCnt", reviewCnt);
		data.put("hoscore", hoscore);
		return data;
	}

	public Map<String, Object> deleteReview(String vcode, String hocode) {
		// review delete
		int deleteResult = reviewMapper.deleteReview(vcode);
		System.out.println(deleteResult);
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


}
