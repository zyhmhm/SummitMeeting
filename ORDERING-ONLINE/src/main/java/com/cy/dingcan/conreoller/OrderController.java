package com.cy.dingcan.conreoller;

import com.cy.common.vo.JsonResult;
import com.cy.dingcan.entity.Orders;
import com.cy.dingcan.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order/")
@CrossOrigin
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping("doFindObject")
	public JsonResult doFindObject(String username,Integer pageCurrent) {
		
		return new JsonResult(orderService.doFindObjectByUserId(username, pageCurrent));
	}
	@RequestMapping("doFindObjects")
	public JsonResult doFindObjects(){
		return new JsonResult(orderService.doFindObjects());
	}
	@RequestMapping("doInsertObject")
	public JsonResult doInsertObject(Orders order,Integer[] goodIds) {
		return new JsonResult(orderService.doInsertObject(order, goodIds));
	}
	@RequestMapping("doDeleteObject")
	public JsonResult doDeleteObject(Integer id) {
		return new JsonResult(orderService.doDeleteObject(id));
	}
	@RequestMapping("doFindObjectById")
	public JsonResult doFindObjectById(Integer goodsId) {
		return new JsonResult(orderService.doFindObjectById(goodsId));
	}
	/*@RequestMapping("doSaveObject")
	public JsonResult doSaveObject(){

	}*/

}
