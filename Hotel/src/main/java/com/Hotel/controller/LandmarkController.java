package com.Hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.service.LandmarkService;

@Controller
public class LandmarkController {
	
	private ModelAndView mav;
	
	@Autowired
	private LandmarkService landmarkService;
	
	@RequestMapping(value="/landmarkList")
	public ModelAndView landmarkList(@RequestParam(value="page", defaultValue="1") int page, String ctcode) {
		// landmarkList
		
		mav = landmarkService.landmarkList(page, ctcode);
		
		return mav;
	}
	
	@RequestMapping(value="/searchingLandmark")
	public ModelAndView searchingLandmark(String la_ctcode) {
		// searchingLandmark
		
		mav = landmarkService.searchingLandmark(la_ctcode);
		
		return mav;
	}

}
