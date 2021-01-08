package com.Hotel.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewDTO {

	private String vcode;
	private String v_hocode;
	private String vwriter;
	private String vcontent;
	private int vscore;
	private Date vdrawup;
	private String honame;
}
