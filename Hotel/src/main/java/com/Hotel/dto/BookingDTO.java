package com.Hotel.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookingDTO {

	private String bcode;
	private String b_mcode;
	private String b_ctcode;
	private String b_hocode;
	private String b_rocode;
	private int bperson;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date bcheckin;
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date bcheckout;
	private Date bdrawup;
	private String brequest;
	private int bprice;
}
