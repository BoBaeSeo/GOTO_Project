package com.Hotel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class LandmarkDTO {

	private String la_ctcode;
	private String lacode;
	private String laname;
	private String laaddr;
	private MultipartFile laphoto;
	private String laintro;
	private String laphotoname;
}
