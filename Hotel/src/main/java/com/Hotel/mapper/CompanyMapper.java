package com.Hotel.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.Hotel.dto.CompanyDTO;
import com.Hotel.dto.HelpDTO;
import com.Hotel.dto.RestaurantDTO;

public interface CompanyMapper {

	public CompanyDTO AdminLogin(CompanyDTO companyDTO);
	
	@Select("SELECT * FROM COMPANY WHERE CMID=#{loginId}")
	public CompanyDTO cpInfoView(@Param("cmid") String cmid,@Param("loginId") String loginId);

	public CompanyDTO CompanyModify(String cmcode);
	
	@Update("UPDATE COMPANY SET CMNAME=#{cmname}, CMEMAIL=#{cmemail},CMPHONE=#{cmphone},CMADDRESS=#{cmaddress} WHERE CMCODE=#{cmcode}")
	public int CompanyModifyProcess(CompanyDTO companyDTO);

	ArrayList<CompanyDTO> a_approveJoin();

	int comDecline(String cmcode);

	int comApprove(String cmcode);
	
	public ArrayList<HelpDTO> a_questionList();

	public int JoinRestaurant(RestaurantDTO restaurantDTO);

	public String getRecode();

	public String cmidCheck(String cmid);

	public int companyJoin(CompanyDTO comdto);

	public String getMaxNum();

	public ArrayList<CompanyDTO> companyList();

	public int companyDelete(String cmid);
	
	List<Map<String, Object>> salesList(@Param("firstDateFormat") String firstDateFormat, @Param("lastDateFormat") String lastDateFormat, @Param("loginId") String loginId);

	ArrayList<Integer> yearList(String loginId);
	
	@Select("SELECT CMPASSWORD FROM COMPANY WHERE CMID = #{ALoginId}")
	public String getloginPw(String aLoginId);


}
