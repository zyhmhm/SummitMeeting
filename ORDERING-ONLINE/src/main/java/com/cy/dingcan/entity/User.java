package com.cy.dingcan.entity;

import lombok.Data;

@Data
public class User {
	//用户id
	private Integer id;
	//用户名
	private String username;
	//用户密码
	private String pwd;
	//盐值
	private String salt;
	//电子邮箱
	private String emial;
	//电话
	private String tell;
	//地址
	private String addr;
	//用户标记
	private Integer mark;

}
