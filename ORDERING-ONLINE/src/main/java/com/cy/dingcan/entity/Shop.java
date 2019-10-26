package com.cy.dingcan.entity;

import lombok.Data;

@Data
public class Shop {
    //店铺id
    private Integer id;
    //店铺名称
    private String shopName;
    //店铺地址
    private String addr;
    //店铺电话
    private String tell;
    //店铺管理人id
    private Integer userId;
    //店铺开门时间
    private String openTime;
    //店铺关门时间
    private String closeTime;
    //店铺图片地址
    private String imageUrl;
}
