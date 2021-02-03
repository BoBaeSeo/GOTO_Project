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

	//업체 로그인
	public CompanyDTO AdminLogin(CompanyDTO companyDTO);
	
	//업체정보 select
	@Select("SELECT * FROM COMPANY WHERE CMID=#{loginId}")
	public CompanyDTO cpInfoView(@Param("loginId") String loginId);

	//업체정보 수정 폼
	public CompanyDTO CompanyModify(String cmcode);
	
	//업체정보 수정
	@Update("UPDATE COMPANY SET CMNAME=#{cmname}, CMEMAIL=#{cmemail},CMPHONE=#{cmphone},CMADDRESS=#{cmaddress} WHERE CMCODE=#{cmcode}")
	public int CompanyModifyProcess(CompanyDTO companyDTO);

	//업체 회원가입 승인
	ArrayList<CompanyDTO> a_approveJoin();

	//업체 회원가입 승인 거절
	int comDecline(String cmcode);

	//업체 회원가입 승인 수락
	int comApprove(String cmcode);
	
	//1대1문의 리스트
	public ArrayList<HelpDTO> a_questionList();

	//레스토랑 등록
	public int JoinRestaurant(RestaurantDTO restaurantDTO);

	//max re코드 select
	public String getRecode();

	//아이디 확인
	public String cmidCheck(String cmid);

	//업체 회원가입
	public int companyJoin(CompanyDTO comdto);

	//max cm코드 select
	public String getMaxNum();

	//업체 리스트
	public ArrayList<CompanyDTO> companyList();

	//업체 삭제
	public int companyDelete(String cmid);
	
	//업체 매출 리스트
	List<Map<String, Object>> salesList(@Param("firstDateFormat") String firstDateFormat, @Param("lastDateFormat") String lastDateFormat, @Param("loginId") String loginId);

	//매출 년도 리스트
	ArrayList<Integer> yearList(String loginId);
	
	// 업체 로그인 아이디 비밀번호
	@Select("SELECT CMPASSWORD FROM COMPANY WHERE CMID = #{ALoginId}")
	public String getloginPw(String aLoginId);


}
