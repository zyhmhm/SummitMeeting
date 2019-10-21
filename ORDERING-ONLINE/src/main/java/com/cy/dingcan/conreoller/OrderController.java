package com.cy.dingcan.conreoller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cy.common.vo.JsonResult;
import com.cy.dingcan.entity.Orders;
import com.cy.dingcan.service.OrderService;

@RestController
@RequestMapping("/order/")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("doFindObject")
	public JsonResult doFindObject(String username,Integer pageCurrent) {
		
		return new JsonResult(orderService.doFindObjectByUserId(username, pageCurrent));
	}
	@RequestMapping("doInsertObject")
	public JsonResult doInsertobject(Orders order,Integer[] goodIds) {
		return new JsonResult(orderService.doInsertObject(order, goodIds));
	}
	@RequestMapping("doDeleteObject")
	public JsonResult doDeleteobject(Integer id) {
		return new JsonResult(orderService.doDeleteObject(id));
	}
	@RequestMapping("doFindObjectById")
	public JsonResult doFindObjectById(Integer goodsId) {
		return new JsonResult(orderService.doFindObjectById(goodsId));
	}

}
