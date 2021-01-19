package com.Hotel.mapper;

import java.util.ArrayList;

import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.MemberDTO;
import com.Hotel.dto.PageDTO;

public interface LandmarkMapper {

	public ArrayList<LandmarkDTO> landmarkList(PageDTO pageDTO);

	public int getlandmarkListCnt();

	public ArrayList<LandmarkDTO> searchingLandmark(String la_ctcode);

	public ArrayList<LandmarkDTO> adminLandmarkList();

	public LandmarkDTO landmarkModifyForm(String lacode);

	public int landmarkDelete(String lacode);

	public String getLaphotoname(String lacode);

	public int landmarkModify(LandmarkDTO landmarkDTO);

	public int landmarkInsert(LandmarkDTO landmarkDTO);

	public String lanameCheck(String inputLaname);

	public String lacodeCheck(String inputLacode);

	public String getlacode();

}
