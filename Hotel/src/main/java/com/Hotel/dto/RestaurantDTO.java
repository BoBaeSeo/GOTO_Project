package com.Hotel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RestaurantDTO {

	private String re_ctcode;
	private String recode;
	private String rename;
	private String readdr;
	private MultipartFile rephoto;
	private String reintro;
	private String rephotoname;
}
