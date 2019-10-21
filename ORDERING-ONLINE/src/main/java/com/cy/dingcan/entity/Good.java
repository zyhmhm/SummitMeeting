package com.cy.dingcan.entity;

import lombok.Data;

@Data
public class Good {
	private Integer id;
	private String goodName;
	private Double price;
	private String des;
	private Integer generId;
}
