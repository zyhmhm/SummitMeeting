package com.cy.dingcan.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.cy.dingcan.entity.Good;

import lombok.Data;

@Data
public class OrderFindVo implements Serializable{
	private static final long serialVersionUID = 6895429399317481132L;
	//订单编号
	private Integer id;
	//商店名称
	private String shopName;
	//用户名称
	private String userName;
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
	//商品的id
	private List<Integer> goodIds;
	//商品的信息
	private List<Good> goods;
}
