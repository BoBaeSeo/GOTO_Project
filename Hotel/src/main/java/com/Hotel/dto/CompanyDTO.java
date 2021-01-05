package com.Hotel.dto;

import lombok.Data;

@Data
public class CompanyDTO {

	private String cmcode;
	private String cmid;
	private String cmpassword;
	private String cmname;
	private String cmphone;
	private String cmemail;
	private String cmaddress;
	private int cmcheck;
	private String cmmailid; //메일앞쪽
	private String cmdomain;  //도메인뒷쪽
	private String cmpost;   //우편번호
	private String cmaddr;   //주소
	private String cmexaddr;  //참고항목
	private String cmdetail; //상세주소
}
