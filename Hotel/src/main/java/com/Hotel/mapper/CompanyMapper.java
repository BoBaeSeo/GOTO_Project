package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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

	//추가
	List<Map<String, Object>> salesList(@Param("firstDateFormat") String firstDateFormat, @Param("lastDateFormat") String lastDateFormat, @Param("loginId") String loginId);

	ArrayList<Integer> yearList(String loginId);

}
