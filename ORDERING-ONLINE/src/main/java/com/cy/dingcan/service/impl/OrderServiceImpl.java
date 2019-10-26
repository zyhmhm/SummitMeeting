package com.cy.dingcan.service.impl;

import com.cy.common.exception.ServiceException;
import com.cy.common.vo.PageObject;
import com.cy.dingcan.dao.GoodDao;
import com.cy.dingcan.dao.OrderDao;
import com.cy.dingcan.dao.OrderGoodsDao;
import com.cy.dingcan.dao.UserDao;
import com.cy.dingcan.entity.Orders;
import com.cy.dingcan.service.OrderService;
import com.cy.dingcan.vo.OrderFindVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private OrderGoodsDao orderGoodsDao;
	@Autowired
	private GoodDao goodDao;

	@Override
	public PageObject<OrderFindVo> doFindObjectByUserId(String username,Integer pageCurrent) {
		//判断传入的参数是不是合法
		//if(username==null) throw new IllegalArgumentException("传入的参数不合法"); 
		//查询当前用户名所对应的id
		if(pageCurrent==null||pageCurrent<1) throw new IllegalArgumentException("传入的参数不合法");
		Integer id=null;
		if(username!=null) {
			id = userDao.doFindIdByUserName(username);
		}
		//if(id==null) throw new ServiceException("没有当前用户");
		//计算分页信息
		PageObject<OrderFindVo> pageObject = new PageObject<>();
		int rows = orderDao.getRows(id);
		int pageSize = 2;
		int startIndex = (pageCurrent-1)*pageSize;
		int pageCount = (rows-1)/pageSize+1;
		if(pageCurrent>pageCount) throw new ServiceException("当前页码不合法");
		//查询符合条件的订单
		List<OrderFindVo> orderList = orderDao.findObjectByUserId(id,startIndex,pageSize);
		if(orderList==null) throw new ServiceException("当前用户没有相应 的订单");
		pageObject.setPageCount(pageCount);
		pageObject.setPageCurrent(pageCurrent);
		pageObject.setPageSize(pageSize);
		pageObject.setRecords(orderList);
		pageObject.setRowCount(rows);
		return pageObject;
	}
	@Override
	public int doInsertObject(Orders order,Integer[] goodIds) {
		if(order==null || order.getId()==null) throw new ServiceException("请传入一个订单信息");

		if(goodIds.length==0) throw new ServiceException("请选择商品");
		if(order.getContactAddr()==null) throw new ServiceException("请输入订单的地址");
		if(order.getContactName()==null) throw new ServiceException("请输入联系人姓名");
		if(order.getContactTell()==null) throw new ServiceException("请输入联系人电话");
		int row;
		try {
			row = orderDao.insertObject(order);
			orderGoodsDao.insertObject(order.getId(),goodIds);
		}catch(Exception e) {
			throw new ServiceException("服务器正在维修中");
		}
		return row;
	}
	@Override
	public int doDeleteObject(Integer orderId) {
		if(orderId==null || orderId<=0)
			throw new ServiceException("请选中一个订单");
		orderGoodsDao.deleteObject(orderId);
		int rows = orderDao.deleteObject(orderId);
		if(rows==0) throw new ServiceException("该订单信息已经不存在");
		return rows;
	}
	@Override
	public int doUpdateObject(Orders order, Integer[] goodIds) {
		if(goodIds==null||goodIds.length==0) throw new ServiceException("请选择商品");
		if(order==null||order.getContactAddr()==null) throw new ServiceException("请输入订单的地址");
		if(order.getContactName()==null) throw new ServiceException("请输入联系人姓名");
		if(order.getContactTell()==null) throw new ServiceException("请输入联系人电话");
		int rows;
		try {
			rows = orderDao.updateObject(order);
			orderGoodsDao.deleteObject(order.getId());
			orderGoodsDao.insertObject(order.getId(), goodIds);
		}catch (Exception e) {
			throw new ServiceException("服务器故障，正在抢修");
		}
		return rows;
	}
	@Override
	public OrderFindVo doFindObjectById(Integer id) {
		if(id==null||id<1) throw new IllegalArgumentException("请选择一个订单");
		OrderFindVo order = orderDao.findObjectById(id);
		if(order==null) throw new ServiceException("该订单信息已经不存在");
		
		return order;
	}

	@Override
	public List<OrderFindVo> doFindObjects() {
		return orderDao.doFindObjects();
	}


}
