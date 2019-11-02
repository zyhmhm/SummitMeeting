package com.cy.dingcan.entity;

import lombok.Data;

@Data
public class Goods {
	//商品id
	private Integer id;
	//商品名称
	private String goodName;
	//商品价格
	private Double price;
	//商品描述
	private String des;
	//商品点赞数
	private Integer daulous;
	//商品图片路径
	private String imageUrl;
	//商品被购买数量
	private Integer number;
	//商品状态，是否下架
	private Integer statue;
	//商品类别id
	private Integer generId;
	//商品归属的店铺id
	private Integer shopId;
}
