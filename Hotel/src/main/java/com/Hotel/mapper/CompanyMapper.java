package com.Hotel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Hotel.dto.CompanyDTO;

public interface CompanyMapper {

	ArrayList<CompanyDTO> a_approveJoin();

	int comDecline(String cmcode);

	int comApprove(String cmcode);
	
	public String AdminLogin(CompanyDTO companyDTO);
	
	@Select("SELECT * FROM COMPANY WHERE CMCODE=#{cmcode}")
	public CompanyDTO cpInfoView(String cmcode);

	public CompanyDTO CompanyModify(String cmcode);
	@Update("UPDATE COMPANY SET CMNAME=#{cmname}, CMEMAIL=#{cmemail},CMPHONE=#{cmphone},CMADDRESS=#{cmaddress} WHERE CMCODE=#{cmcode}")
	public int CompanyModifyProcess(CompanyDTO companyDTO);

}
