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
	
	@RequestMapping(value="writeReview")
	public @ResponseBody Map<String, Object> writeReview(ReviewDTO reviewDTO, String hocode) {
		System.out.println("writeReview");
		Map<String, Object> data = reviewService.writeReview(reviewDTO, hocode);
		return data;
	}
	
	@RequestMapping(value = "deleteReview")
	public @ResponseBody Map<String, Object> deleteReview(String vcode, String hocode){
		System.out.println("deleteReview");
		Map<String, Object> data = reviewService.deleteReview(vcode, hocode);
		return data;
	}
}
