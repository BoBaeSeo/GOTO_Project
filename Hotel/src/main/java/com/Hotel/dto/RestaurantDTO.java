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
	private String refilename;
	public String getRe_ctcode() {
		return re_ctcode;
	}
	public void setRe_ctcode(String re_ctcode) {
		this.re_ctcode = re_ctcode;
	}
	public String getRecode() {
		return recode;
	}
	public void setRecode(String recode) {
		this.recode = recode;
	}
	public String getRename() {
		return rename;
	}
	public void setRename(String rename) {
		this.rename = rename;
	}
	public String getReaddr() {
		return readdr;
	}
	public void setReaddr(String readdr) {
		this.readdr = readdr;
	}
	public MultipartFile getRephoto() {
		return rephoto;
	}
	public void setRephoto(MultipartFile rephoto) {
		this.rephoto = rephoto;
	}
	public String getReintro() {
		return reintro;
	}
	public void setReintro(String reintro) {
		this.reintro = reintro;
	}
	public String getRefilename() {
		return refilename;
	}
	public void setRefilename(String refilename) {
		this.refilename = refilename;
	}
	@Override
	public String toString() {
		return "RestaurantDTO [re_ctcode=" + re_ctcode + ", recode=" + recode + ", rename=" + rename + ", readdr="
				+ readdr + ", rephoto=" + rephoto + ", reintro=" + reintro + ", refilename=" + refilename + "]";
	}
	
	
	
}
