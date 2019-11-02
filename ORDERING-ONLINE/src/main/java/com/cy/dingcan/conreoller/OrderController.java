package com.cy.dingcan.conreoller;

import com.cy.common.vo.JsonResult;
import com.cy.dingcan.entity.Orders;
import com.cy.dingcan.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order/")
@CrossOrigin
public class OrderController {
	
	@Autowired
	private OrdersService ordersService;
	
	@RequestMapping("doFindObject")
	public JsonResult doFindObject(String username,Integer pageCurrent) {
		
		return new JsonResult(ordersService.doFindObjectByUserId(username, pageCurrent));
	}
	@RequestMapping("doFindObjects")
	public JsonResult doFindObjects(){
		return new JsonResult(ordersService.doFindObjects());
	}
	@RequestMapping("doInsertObject")
	public JsonResult doInsertObject(Orders order,Integer[] goodIds) {
		return new JsonResult(ordersService.doInsertObject(order, goodIds));
	}
	@RequestMapping("doDeleteObject")
	public JsonResult doDeleteObject(Integer id) {
		return new JsonResult(ordersService.doDeleteObject(id));
	}
	@RequestMapping("doFindObjectById")
	public JsonResult doFindObjectById(Integer orderId) {
		return new JsonResult(ordersService.doFindObjectById(orderId));
	}
	/*@RequestMapping("doSaveObject")
	public JsonResult doSaveObject(){

	}*/

}
