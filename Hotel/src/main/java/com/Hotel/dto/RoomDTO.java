package com.Hotel.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RoomDTO {

	private String ro_hocode;
	private String rocode;
	private String roname;
	private MultipartFile rophoto;
	private String rodetail;
	private int rominper;
	private int romaxper;
	private int roprice;
	private int ronum;
	private String roFileName;
}
