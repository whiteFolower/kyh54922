package kr.or.ddit.vo;

import java.io.Serializable;
import java.time.LocalDate;

import lombok.Data;

@Data
public class AttencanceDetailVO implements Serializable {
	private String adId;
	private String empId;
	private String adContent;
	private String adCatagory;
	private LocalDate adStrDate;
	private LocalDate adEndDay;
}
