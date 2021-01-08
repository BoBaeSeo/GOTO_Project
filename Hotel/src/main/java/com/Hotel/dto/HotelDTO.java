package com.Hotel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class HotelDTO {

	private String ho_ctcode;
	private String hocode;
	private String honame;
	private MultipartFile hophoto;
	private String hoaddr;
	private float hoscore;
	private String hopublicize;
	private String hofileName;
	private String ho_cid;
	private String hopost;   //우편번호
	private String hoaddress;   //주소
	private String hoexaddr;  //참고항목
	private String hodetail; //상세주소
}
