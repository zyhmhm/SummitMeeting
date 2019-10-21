package com.cy.dingcan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface OrderGoodsDao {
	int insertObject(@Param("orderId") Integer orderId,@Param("goodId") Integer[] goodId);
	int deleteObject(Integer orderId);
}
