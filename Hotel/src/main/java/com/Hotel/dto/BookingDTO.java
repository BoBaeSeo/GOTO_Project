package com.Hotel.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BookingDTO {

	private String bocode;
	private String bo_mcode;
	private String bo_hocode;
	private String bo_rocode;
	private int boperson;
	private Date bocheckin;
	private Date bocheckout;
	private Date bodrawup;
	private String borequest;
}
