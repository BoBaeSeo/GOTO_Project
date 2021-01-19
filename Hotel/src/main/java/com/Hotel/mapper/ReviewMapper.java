package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.Hotel.dto.HistoryDTO;
import com.Hotel.dto.ReviewDTO;

public interface ReviewMapper {

	int insertReview(ReviewDTO reviewDTO);

	String getvcode();

	ReviewDTO getNewReview(String vcode);

	ArrayList<ReviewDTO> getReviewList(String hocode);

	int getReviewCnt(String hocode);

	int deleteReview(String vcode);

	int modifyReview(ReviewDTO reviewDTO);

	ArrayList<HistoryDTO> getlikeList(String loginId);

	int likeProcess(HistoryDTO history);

	int unlikeProcess(HistoryDTO history);

	public ArrayList<ReviewDTO> reviewList(String MloginId);
	
	public int reviewDelete(String vcode);

	public int historyDelete(String vcode);

	public ArrayList<ReviewDTO> reviewPage( @Param("startRow") int startRow,  @Param("endRow") int endRow, @Param("MloginId") String MloginId);

	public int getReviewListCnt();

	List<Map<String,Object>> selectReviewList();
	
	int deleteHistory(String vcode);
}