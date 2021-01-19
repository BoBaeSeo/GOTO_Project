package com.Hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.service.RestaurantService;

@Controller
public class RestaurantController {
	
	private ModelAndView mav;
	
	@Autowired
	private RestaurantService restaurantService;
	
	@RequestMapping(value="/restaurantList")
	public ModelAndView restrauntList(@RequestParam(value="page", defaultValue="1") int page) {
		// restaurantList
		
		System.out.println("/restrauntList");
		
		 mav = restaurantService.restaurantList(page);
		
		return mav;
	}

	
	@RequestMapping(value="/searchingRestaurant")
	public ModelAndView searchingRestaurant(String re_ctcode) {
		// searchingRestaurant
		
		System.out.println("/searchingRestaurant " + re_ctcode );
		
		mav = restaurantService.searchingRestaurant(re_ctcode);
		
		return mav;
	}
	
}

