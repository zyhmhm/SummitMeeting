package com.cy.dingcan.dao;


import com.cy.dingcan.entity.Orders;
import com.cy.dingcan.vo.OrderFindVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OrderDao {
	public List<OrderFindVo>findObjectByUserId(@Param("id")Integer id,
			@Param("startIndex") Integer startIndex,
			@Param("pageSize") Integer pageSize);
	int getRows(Integer id);
	
	int insertObject(Orders order);
	int deleteObject(Integer id);
	int updateObject(Orders order);
	OrderFindVo findObjectById(Integer id);
	List<OrderFindVo> doFindObjects();
}
