package com.Hotel.mapper;

import java.util.ArrayList;

import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.PageDTO;
import com.Hotel.dto.RestaurantDTO;

public interface RestaurantMapper {

	public ArrayList<RestaurantDTO> restaurantList(PageDTO pageDTO);

	public ArrayList<RestaurantDTO> searchingRestaurant(String re_ctcode);

	public int getrestaurantListCnt();

	public ArrayList<RestaurantDTO> adminRestaurantList();

	public int restaurantModify(RestaurantDTO restaurantDTO);

	public String getRephotoname(String recode);

	public int restaurantDelete(String recode);

	public RestaurantDTO restaurantModifyForm(String recode);

}
