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
	private String hophotoName;
}
