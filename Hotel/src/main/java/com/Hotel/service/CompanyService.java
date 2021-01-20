package com.Hotel.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Hotel.dto.CompanyDTO;
import com.Hotel.dto.HelpDTO;
import com.Hotel.dto.HotelDTO;
import com.Hotel.dto.LandmarkDTO;
import com.Hotel.dto.RestaurantDTO;
import com.Hotel.mapper.CompanyMapper;
import com.Hotel.mapper.HotelMapper;
import com.Hotel.mapper.LandmarkMapper;
import com.Hotel.mapper.RestaurantMapper;

@Service
public class CompanyService {

	@Autowired
	private CompanyMapper companyMapper;
	
	@Autowired
	private RestaurantMapper restaurantMapper;
	
	@Autowired
	private LandmarkMapper landmarkMapper;
	
	@Autowired
	private HotelMapper hotelMapper;
	
	@Autowired
	private HttpSession session;
	
	private ModelAndView mav;
	
	//관리자로그인부분 세션값 ALoginId
	public ModelAndView AdminLogin(CompanyDTO companyDTO) {
		mav = new ModelAndView();
		
		String ALoginId = companyMapper.AdminLogin(companyDTO);
		System.out.println("ALoginId:::"+ALoginId);
		session.setAttribute("ALoginId", ALoginId);
		
		String result;
		if (ALoginId!=null) {
			mav.setViewName("company/companyMain");
			result = "OK";
		}else {
			mav.setViewName("company/a_LoginForm");
			result = "NO";
		}
		mav.addObject("loginResult",result);
		return mav;
	}

	//업체정보 상세보기
	public ModelAndView cpInfoView(String cmid) {
		mav = new ModelAndView();
		
		String loginId = (String) session.getAttribute("ALoginId");
		System.out.println("loginId:::"+loginId);
		CompanyDTO companyDTO = companyMapper.cpInfoView(cmid,loginId);
		mav.addObject("companyDTO",companyDTO);
		mav.setViewName("company/a_InfoView");
		return mav;
	}

	//업체정보수정 폼
	public ModelAndView CompanyModify(String cmid) {
		mav = new ModelAndView();
		String loginId = (String) session.getAttribute("ALoginId");

		CompanyDTO companyDTO = companyMapper.cpInfoView(cmid,loginId);
		mav.addObject("companyDTO", companyDTO);
		mav.setViewName("company/a_ModifyForm");
		
		return mav;
	}

	//업체정보수정 부분
	public ModelAndView CompanyModifyProcess(CompanyDTO companyDTO) {
		mav = new ModelAndView();
		int UpdateResult = companyMapper.CompanyModifyProcess(companyDTO);
		System.out.println("cmcode ::"+ companyDTO.getCmcode());
		System.out.println("UpdateResult::"+UpdateResult);
		mav.setViewName("redirect:/cpInfoView");
		
		return mav;
	}
	
	public ModelAndView a_approveJoin() {
		mav = new ModelAndView();
		// 업체리스트 select
		ArrayList<CompanyDTO> companyList = companyMapper.a_approveJoin();
		System.out.println(companyList);
		mav.addObject("companyList", companyList);
		mav.setViewName("admin/a_approveJoin");
		return mav;
	}

	public String comDecline(String cmcode) {
		// 회원가입 승인 거절
		int updateResult = companyMapper.comDecline(cmcode);
		String result = "NO";
		if(updateResult > 0) {
			result = "OK";
		}
		return result;
	}
	
	public String comApprove(String cmcode) {
		// 회원가입 승인 허락
		int updateResult = companyMapper.comApprove(cmcode);
		String result = "NO";
		if(updateResult > 0) {
			result = "OK";
		}
		return result;
	}
	
	public ModelAndView adminRestaurantList() {
		// adminRestaurant Controller
		
		mav = new ModelAndView();
		
		ArrayList<RestaurantDTO> restaurantList = restaurantMapper.adminRestaurantList();
		
		mav.addObject("restaurantList", restaurantList);
		mav.setViewName("admin/adminRestaurantList");
		
		return mav;
	}

	public ModelAndView restaurantModify(RestaurantDTO restaurantDTO, RedirectAttributes ra) throws IllegalStateException, IOException {
		// restaurant Modify
		
		mav = new ModelAndView();
		MultipartFile rephoto = null;
		String rephotoName = null;
		String savePath = "C:\\Users\\seeth\\git\\Hotel\\Hotel\\src\\main\\webapp\\resources\\img\\restaurantFile\\";
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		
		if ( restaurantDTO.getRephoto() != null ) {
			
		rephoto = restaurantDTO.getRephoto(); 
		rephotoName = uuid.toString() + "_" + rephoto.getOriginalFilename();
		System.out.println("rephotoName : " + rephotoName);
		
		if(!rephoto.isEmpty()) {
			/* ������� true, �������� false�� ������ */
			rephoto.transferTo(new File(savePath+rephotoName));
			
		}
		
		} else {
			rephotoName = restaurantMapper.getRephotoname(restaurantDTO.getRecode());
		}
		
		restaurantDTO.setRefilename(rephotoName);
		 //board ���̺� insert
		 int insertResult = restaurantMapper.restaurantModify(restaurantDTO);
		 // ��ġ ����
		 ra.addFlashAttribute("modalRecode", insertResult);
		 ra.addFlashAttribute("msg", "Modify");
		 
		
		mav.setViewName("redirect:/adminRestaurantList");
		return mav;
	}

	public ModelAndView restaurantDelete(String recode, RedirectAttributes ra) {
		// restaurant Delete
		mav = new ModelAndView();
		
		String deleteProfile = restaurantMapper.getRephotoname(recode);
		String savePath = "C:\\Users\\seeth\\git\\Hotel\\Hotel\\src\\main\\webapp\\resources\\img\\restaurantFile\\";
		
		File file = new File(savePath + deleteProfile);
		file.delete();

		
		int deleteResult = restaurantMapper.restaurantDelete(recode);
		System.out.println("deleteResult:"+deleteResult);
		ra.addFlashAttribute("modalRecode", recode);
		ra.addFlashAttribute("msg","delete");
		mav.setViewName("redirect:/adminRestaurantList");
		return mav;
	}

	public ModelAndView restaurantModifyForm(String recode) {
		// restaurantModifyForm
		
		mav = new ModelAndView();
		
		RestaurantDTO restaurantDTO = restaurantMapper.restaurantModifyForm(recode);
		
		mav.addObject("rList", restaurantDTO);
		mav.setViewName("admin/restaurantModify");
		
		return mav;
	}

	public ModelAndView adminLandmarkList() {
		// adminLandmarkList
		
		mav = new ModelAndView();
		
		ArrayList<LandmarkDTO> landmarkList = landmarkMapper.adminLandmarkList();
		
		mav.addObject("landmarkList", landmarkList);
		mav.setViewName("admin/adminLandmarkList");
		
		return mav;
	}
	
	public ModelAndView landmarkModifyForm(String lacode) {
		// landmarkModifyForm
		
		mav = new ModelAndView();
		
		LandmarkDTO landmarkDTO = landmarkMapper.landmarkModifyForm(lacode);
		
		mav.addObject("lList", landmarkDTO);
		mav.setViewName("admin/landmarkModify");
		
		return mav;
	}

	public ModelAndView landmarkDelete(String lacode, RedirectAttributes ra) {
		// landmarkDelete
		
		mav = new ModelAndView();
		
		String deleteProfile = landmarkMapper.getLaphotoname(lacode);
		String savePath = "C:\\Users\\seeth\\git\\Hotel\\Hotel\\src\\main\\webapp\\resources\\img\\landmarkFile\\";
		
		File file = new File(savePath + deleteProfile);
		file.delete();
		
		int deleteResult = landmarkMapper.landmarkDelete(lacode);
		
		System.out.println("deleteResult:"+deleteResult);
		ra.addFlashAttribute("modalLacode", lacode);
		ra.addFlashAttribute("msg","delete");
		mav.setViewName("redirect:/adminLandmarkList");
		
		return mav;
	}

	public ModelAndView landmarkModify(LandmarkDTO landmarkDTO, RedirectAttributes ra) throws IllegalStateException, IOException {
		// landmarkModify
		
		mav = new ModelAndView();
		MultipartFile laphoto = null;
		String laphotoName = null;
		String savePath = "C:\\Users\\seeth\\git\\Hotel\\Hotel\\src\\main\\webapp\\resources\\img\\landmarkFile\\";
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		
		if ( landmarkDTO.getLaphoto() != null ) {
			
		laphoto = landmarkDTO.getLaphoto(); 
		laphotoName = uuid.toString() + "_" + laphoto.getOriginalFilename();
		System.out.println("laphotoName : " + laphotoName);
		
		if(!laphoto.isEmpty()) {
			/* ������� true, �������� false�� ������ */
			laphoto.transferTo(new File(savePath+laphotoName));
			
		}
		
		} else {
			laphotoName = landmarkMapper.getLaphotoname(landmarkDTO.getLacode());
		}
		
		landmarkDTO.setLafilename(laphotoName);
		 //board ���̺� insert
		 int insertResult = landmarkMapper.landmarkModify(landmarkDTO);
		 // ��ġ ����
		 ra.addFlashAttribute("modalLacode", insertResult);
		 ra.addFlashAttribute("msg", "modify");
		 
		
		mav.setViewName("redirect:/adminLandmarkList");
		return mav;
	}

	public ModelAndView landmarkInsert(LandmarkDTO landmarkDTO, RedirectAttributes ra) throws IllegalStateException, IOException {
		// landmarkInsert
		
		mav = new ModelAndView();
		
		String addr1 = landmarkDTO.getLaaddr_address();
		String addr2 = landmarkDTO.getLaaddr_detailAddress();
		String addr3 = landmarkDTO.getLaaddr_postcode();
		String addr4 = landmarkDTO.getLaaddr_extraAddress();
		
		String laaddr = addr4 + addr1 + addr2 + addr3;
		
		landmarkDTO.setLaaddr(laaddr);
		System.out.println("laaddr : " + laaddr);
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());

			
		MultipartFile laphoto = landmarkDTO.getLaphoto(); 
		String savePath = "C:\\Users\\seeth\\git\\Hotel\\Hotel\\src\\main\\webapp\\resources\\img\\landmarkFile\\";
		String laphotoName = uuid.toString() + "_" + laphoto.getOriginalFilename();
		System.out.println("laphotoName : " + laphotoName);
		
		landmarkDTO.setLafilename(laphotoName);
		if(!laphoto.isEmpty()) {
			/* ������� true, �������� false�� ������ */
			laphoto.transferTo(new File(savePath+laphotoName));
			
		}
		
		
		 //board ���̺� insert
		 int insertResult = landmarkMapper.landmarkInsert(landmarkDTO);
		 // ��ġ ����
		 ra.addFlashAttribute("modalLacode", insertResult);
		 ra.addFlashAttribute("msg", "insert");
		 
		
		mav.setViewName("redirect:/adminLandmarkList");
		return mav;
	}
	
	public ModelAndView landmarkInsertForm() {
	      mav = new ModelAndView();
	      
	      // lacode
	       String getLacode = landmarkMapper.getlacode();
	       String lacode;
	       int lacodeNum = Integer.parseInt(getLacode.substring(2, 5)) + 1; // bocode + 1
	       if (lacodeNum < 10) {
	          lacode = "LA" + "00" + lacodeNum;
	         } else if (lacodeNum < 100) {
	            lacode = "LA" + "0" + lacodeNum;
	         } else {
	            lacode = "LA" + lacodeNum;
	         }
	       System.out.println(lacode);
	       
	       mav.addObject("lacode", lacode);
	       mav.setViewName("admin/landmarkInsert");
	      
	      return mav;
	   }


	public String lanameCheck(String inputLaname) {
		// lanameCheck
		
		String check = null;
		String searchResult = landmarkMapper.lanameCheck(inputLaname);
		System.out.println("searchResult : " + searchResult);
		
		if ( searchResult != null ) {
			check = "NO";
		} else {
			check = "OK";
		}
		
		
		return check;
	}

	public String lacodeCheck(String inputLacode) {
		// lacodeCheck
		
		String check = null;
		String searchResult = landmarkMapper.lacodeCheck(inputLacode);
		System.out.println("searchResult : " + searchResult);
		
		if ( searchResult != null ) {
			check = "NO";
		} else {
			check = "OK";
		}
		
		
		return check;
	}

	//1대1문의 리스트
		public ModelAndView a_questionList() {
			mav = new ModelAndView();
			System.out.println("view");
			ArrayList<HelpDTO> questionList = companyMapper.a_questionList();
			System.out.println("view2");
			mav.addObject("questionList", questionList);
			mav.setViewName("company/questionList");
			
			return mav;
		}
		//맛집 등록
		public ModelAndView JoinRestaurant(RestaurantDTO restaurantDTO, RedirectAttributes ra) throws IllegalStateException, IOException {
		      mav = new ModelAndView();
		      UUID uuid = UUID.randomUUID();
		      
		      String getRecode = companyMapper.getRecode();
		      String recode;
		      if(getRecode == null) {
		         recode = "RE"+"001";
		      }else {
		         int recodeNum = Integer.parseInt(getRecode.substring(2, 5))+1;
		         if(recodeNum < 10) {
		            recode = "RE" +"00"+recodeNum;
		         }else if(recodeNum < 100) {
		            recode = "RE"+"0"+recodeNum; 
		         }else {
		            recode = "RE" + recodeNum;
		         }
		      }
		      MultipartFile rephoto = restaurantDTO.getRephoto();
		      String refileName = uuid.toString()+"_"+rephoto.getOriginalFilename();
		      System.out.println("refileName::"+refileName);
		      
		      String savePath = "C:\\Users\\seeth\\git\\Hotel\\Hotel\\src\\main\\webapp\\resources\\img\\restaurantFile\\";
		      
		      if(!rephoto.isEmpty()) {
		         rephoto.transferTo(new File(savePath+refileName));
		      }
		      restaurantDTO.setRecode(recode);
		      restaurantDTO.setRefilename(refileName);
		      
		      int insertResult = companyMapper.JoinRestaurant(restaurantDTO);
		      System.out.println("reJoin");
		      mav.setViewName("redirect:/adminRestaurantList");
		      return mav;
		   }

		//회원가입시 아이디 중복확인
		public String cmidCheck(String cmid) {
			String cmidCheck = companyMapper.cmidCheck(cmid);
			
			String checkResult = null;
			if(cmidCheck==null) {
				checkResult = "OK";
			} else {
				checkResult = "NO";
			}
			return checkResult;
		}


		//회원가입
		public ModelAndView companyJoin(CompanyDTO comdto, RedirectAttributes ra) {
			mav = new ModelAndView();
			System.out.println("service :: companyJoin");
			
			comdto.setCmemail(comdto.getCmmailid()
											+ "@" 
											+ comdto.getCmdomain());
					
			comdto.setCmaddress("(" + comdto.getCmpost() + ")" 
											+ comdto.getCmaddr()
											+ comdto.getCmexaddr()
											+ comdto.getCmdetail());

			String cmcode;//업체 코드
			String maxNum = companyMapper.getMaxNum();//최대 코드수
			
			int cmNum = Integer.parseInt(maxNum.substring(2,5))+1;//cmNum에 뒤숫자 3자리를 가져와 +1를 한다
			
			if(cmNum < 10) {//뒤숫자에 앞에 문자를 붙어주자
				cmcode = "CM"+"00"+cmNum;
			} else if(cmNum < 100) {
				cmcode = "CM"+"0"+cmNum;
			} else {
				cmcode = "CM"+cmNum;
			}
			comdto.setCmcode(cmcode);
			
			int companyJoin = companyMapper.companyJoin(comdto);
			if (companyJoin > 0) {
				String msg = comdto.getCmid() + " 님 가입되었습니다.";
				mav.addObject("msg", msg);
			}
			
			System.out.println("companyJoin :: "+ companyJoin);
			
			mav.setViewName("index");
			return mav;
		}


		//업체리스트
		public ModelAndView companyList() {
			mav = new ModelAndView();
			
			ArrayList<CompanyDTO> companyList = companyMapper.companyList();
			System.out.println(companyList);
			
			mav.addObject("companyList", companyList);
			mav.setViewName("admin/a_companyList");
			return mav;
		}


		//업체삭제
		public ModelAndView companyDelete(String cmid) {
			mav = new ModelAndView();
			
			int companyDelete = companyMapper.companyDelete(cmid);
			System.out.println("companyDelete::" + companyDelete);
			
			mav.setViewName("redirect:/a_companyList");
			return mav;
		}
		
		
		// 업체 매출 현황
		public ModelAndView companySales(int year) {
			mav = new ModelAndView();
			// 이번년도 월별 매출 select
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String loginId = (String) session.getAttribute("ALoginId");
			Calendar firstDate = Calendar.getInstance();
			firstDate.set(firstDate.get(Calendar.YEAR), Calendar.JANUARY, 1);
			Calendar lastDate = Calendar.getInstance();
			lastDate.set(lastDate.get(Calendar.YEAR), Calendar.DECEMBER, 31);
			if(year != 0) {
				firstDate.set(Calendar.YEAR, year);
				lastDate.set(Calendar.YEAR, year);
				mav.setViewName("company/a_companySalesYear");
			} else {
				mav.setViewName("company/a_companySales");
			}
			
			String firstDateFormat = format.format(firstDate.getTime());
			String lastDateFormat = format.format(lastDate.getTime());
			
			List<Map<String, Object>> salesList = companyMapper.salesList(firstDateFormat, lastDateFormat, loginId);
			System.out.println(salesList);
			// hotel 조회수 select
			ArrayList<HotelDTO> hotelHitList = hotelMapper.gethitList(loginId);
			System.out.println(hotelHitList);
			// 호텔에 booking 내역이 있는 year select
			ArrayList<Integer> yearList = companyMapper.yearList(loginId);
			System.out.println(yearList);
			
			mav.addObject("salesList", salesList);
			mav.addObject("hotelHitList", hotelHitList);
			mav.addObject("yearList", yearList);
			
			return mav;
		}

	

}
