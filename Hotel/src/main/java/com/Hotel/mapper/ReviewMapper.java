package com.Hotel.mapper;

import java.util.ArrayList;

import com.Hotel.dto.ReviewDTO;

public interface ReviewMapper {

	int insertReview(ReviewDTO reviewDTO);

	String getvcode();

	ReviewDTO getNewReview(String vcode);

	ArrayList<ReviewDTO> getReviewList(String hocode);

	int getReviewCnt(String hocode);

	int deleteReview(String vcode);


}
