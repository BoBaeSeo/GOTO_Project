package com.Hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class BookingDTO {

	private String bcode;
	private String b_mcode;
	private String b_ctcode;
	private String b_hocode;
	private String b_rocode;
	private Integer bperson;
	private Date bcheckin;
	private Date bcheckout;
	private Date bdrawup;
	private String brequest;
	private Integer bprice;
}
