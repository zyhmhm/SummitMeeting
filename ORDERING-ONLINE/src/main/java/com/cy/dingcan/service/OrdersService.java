package com.cy.dingcan.service;


import com.cy.common.vo.PageObject;
import com.cy.dingcan.entity.Orders;
import com.cy.dingcan.vo.OrderFindVo;

import java.util.List;

public interface OrdersService {

	PageObject<OrderFindVo> doFindObjectByUserId(String username,Integer pageCurrent);
	int doInsertObject(Orders order,Integer[] goodIds);
	int doDeleteObject(Integer orderId);
	int doUpdateObject(Orders order,Integer[] goodIds);
	Orders doFindObjectById(Integer id);
	List<OrderFindVo> doFindObjects();
}
