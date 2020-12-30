package com.Hotel.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {

	private String mcode;
	private String mid;
	private String mpassword;
	private String mname;
	private String mphone;
	private Date mbirth;
	private String memail;
}
