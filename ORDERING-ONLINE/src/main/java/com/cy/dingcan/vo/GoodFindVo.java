package com.cy.dingcan.vo;

import lombok.Data;

import java.io.Serializable;

@Data
public class GoodFindVo implements Serializable {

    private static final long serialVersionUID = -8617762414899338287L;
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
    //商品类别名
    private String generName;
    //商品归属店铺名称
    private String shopName;
}
