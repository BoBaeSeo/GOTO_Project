package com.Hotel.mapper;

import java.util.ArrayList;

import com.Hotel.dto.CompanyDTO;

public interface CompanyMapper {

	ArrayList<CompanyDTO> a_approveJoin();

	int comDecline(String cmcode);

	int comApprove(String cmcode);

}
