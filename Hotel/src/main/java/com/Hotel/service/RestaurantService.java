package com.Hotel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.RestaurantDTO;
import com.Hotel.mapper.RestaurantMapper;

@Service
public class RestaurantService {
	
	private ModelAndView mav;
	
	@Autowired
	private RestaurantMapper restaurantMapper;

	public ModelAndView restaurantList(int page) {
		mav = new ModelAndView();
		
		int pageLimit = 2; // ���������� ������ ȸ���� ����
		int pageNumLimit = 3; // ���������� ������ ������ ��ȣ ����
		
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		ArrayList<RestaurantDTO> restaurantList = restaurantMapper.restaurantList(pageDTO);
		
		System.out.println(restaurantList);
		
		int restaurantListCnt = restaurantMapper.getrestaurantListCnt();
		int maxPage = (int)(Math.ceil((double)restaurantListCnt/pageLimit));
		int startPage = ((int)(Math.ceil((double)page/pageLimit)) - 1) * pageNumLimit + 1;
		int endPage = startPage + pageNumLimit - 1;
		/* �ִ� �� ������ ���� ���� ���� ������, �װ��� �ø� */
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		pageDTO.setPage(page);
		pageDTO.setStartpage(startPage);
		pageDTO.setEndpage(endPage);
		pageDTO.setMaxpage(maxPage);
		
		
		mav.addObject("restaurantList", restaurantList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("member/restaurantList");
		
		return mav;
	}

	public ModelAndView searchingRestaurant(String re_ctcode) {
		mav = new ModelAndView();
		
		ArrayList<RestaurantDTO> restaurantList = null;
	
		restaurantList = restaurantMapper.searchingRestaurant(re_ctcode);
		
		mav.addObject("restaurantList", restaurantList);
		mav.setViewName("member/restaurantList");
		
		return mav;
	}

}
