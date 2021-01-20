package com.Hotel.mapper;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.Hotel.dto.FaqDTO;
import com.Hotel.dto.HelpDTO;

public interface HelpMapper {
	
	public int HelpWrite(HelpDTO helpDTO);

	List<Map<String, Object>> selectFAQList();

	Map<String, Object> helpAnswer(String hecode);
	
	int updateAnswer(Map<String, Object> map);
	
	public ArrayList<HelpDTO> questionList(String loginId);

	public int faqWriteForm(FaqDTO faqDTO);

	public String maxFaqNum();

	public String gethecode();
	

}
