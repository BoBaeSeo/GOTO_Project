package com.Hotel.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.Hotel.mapper.LandmarkMapper;
import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.PageDTO;


@Service
public class LandmarkService {
	
	private ModelAndView mav;
	
	@Autowired
	private LandmarkMapper landmarkMapper;

	public ModelAndView landmarkList(int page) {
		
		mav = new ModelAndView();
		
		int pageLimit = 2; // ���������� ������ ȸ���� ����
		int pageNumLimit = 3; // ���������� ������ ������ ��ȣ ����
		
		int startRow = (page - 1) * pageLimit + 1;
		int endRow = page * pageLimit;
		
		PageDTO pageDTO = new PageDTO();
		
		pageDTO.setStartrow(startRow);
		pageDTO.setEndrow(endRow);
		
		ArrayList<LandmarkDTO> landmarkList = landmarkMapper.landmarkList(pageDTO);
		System.out.println(landmarkList);
		
		int landmarkListCnt = landmarkMapper.getlandmarkListCnt();
		int maxPage = (int)(Math.ceil((double)landmarkListCnt/pageLimit));
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
		
		mav.addObject("landmarkList", landmarkList);
		mav.addObject("pageDTO", pageDTO);
		mav.setViewName("member/landmarkList");
		
		return mav;

	}

	public ModelAndView searchingLandmark(String la_ctcode) {
		mav = new ModelAndView();
		
		ArrayList<LandmarkDTO> landmarkList = landmarkMapper.searchingLandmark(la_ctcode);
		
		mav.addObject("landmarkList", landmarkList);
		mav.setViewName("member/landmarkList");
		
		return mav;
	}

}
