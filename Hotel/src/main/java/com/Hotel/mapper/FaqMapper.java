package com.Hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;

import com.Hotel.dto.FaqDTO;


public interface FaqMapper {

	ArrayList<FaqDTO> FaqList();

	@Delete("DELETE FROM FAQ WHERE FAQCODE=#{faqcode}")
	public int FaqDelete(String faqcode);

}
