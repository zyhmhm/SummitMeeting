package com.cy.dingcan.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;
@Data
public class Orders implements Serializable{

	private static final long serialVersionUID = 6895429399317481132L;
	//订单编号
	private Integer id;
	//商店id
	private Integer shopId;
	//用户id
	private Integer userId;
	//订单状态
	private Integer statu;
	//创建订单的时间
	private Date createTime;
	//支付的时间
	private Date payTime;
	//订单价格
	private Double price;
	//联系人姓名
	private String contactName;
	//联系人电话
	private String contactTell;
	//联系人地址
	private String contactAddr;
	//订单备注
	private String remarks;
	
}
