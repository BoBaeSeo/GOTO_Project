package com.Hotel.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.ReviewDTO;
import com.Hotel.service.ReviewService;

@Controller
public class ReviewController {

	private ModelAndView mav;
	
	@Autowired
	private ReviewService reviewService;
	
	// 리뷰 등록
	@RequestMapping(value="writeReview")
	public @ResponseBody String writeReview(ReviewDTO reviewDTO, String hocode) {
		System.out.println("writeReview");
		String data = reviewService.writeReview(reviewDTO, hocode);
		return data;
	}
	
	// 리뷰 삭제
	@RequestMapping(value = "deleteReview")
	public @ResponseBody Map<String, Object> deleteReview(String vcode, String hocode){
		System.out.println("deleteReview");
		Map<String, Object> data = reviewService.deleteReview(vcode, hocode);
		return data;
	}
	
	// 리뷰 수정
	@RequestMapping(value = "modifyReview")
	public @ResponseBody Map<String, Object> modifyReview(ReviewDTO reviewDTO, String hocode){
		System.out.println("modifyReview");
		Map<String, Object> data = reviewService.modifyReview(reviewDTO, hocode);
		return data;
	}
	
	// 리뷰 좋아요
	@RequestMapping(value = "likeProcess")
	public @ResponseBody String likeProcess(String vcode, String loginId, String hocode){
		System.out.println("likeProcess");
		String data = reviewService.likeProcess(vcode, loginId, hocode);
		return data;
	}
	
	// 리뷰 좋아요 취소
	@RequestMapping(value = "unlikeProcess")
	public @ResponseBody String unlikeProcess(String vcode, String loginId, String hocode){
		System.out.println("likeProcess");
		String data = reviewService.unlikeProcess(vcode, loginId, hocode);
		return data;
	}
}
