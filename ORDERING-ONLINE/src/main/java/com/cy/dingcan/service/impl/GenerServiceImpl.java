package com.cy.dingcan.service.impl;

import com.cy.common.exception.ServiceException;
import com.cy.dingcan.dao.GenerDao;
import com.cy.dingcan.entity.Gener;
import com.cy.dingcan.service.GenerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GenerServiceImpl implements GenerService {
    @Autowired
    private GenerDao generDao;
    @Override
    public List<Gener> doFindObject() {
        List<Gener> generList = generDao.findObject();
        if(generList==null) throw new ServiceException("当前还没有添加商品类别");
        return generList;
    }

    @Override
    public int doDeleteObject(Integer[] ids) {
        if(ids==null || ids.length==0) throw new ServiceException("请至少传入一个参数");
        int rows;
        try {
            rows = generDao.deleteObject(ids);
        }catch (Exception e){
            e.printStackTrace();
            throw new ServiceException("服务器异常正在维修中");
        }
        if(rows<=0) throw new ServiceException("当前记录已经不存在了");
        return rows;
    }

    @Override
    public int doInsertObject(Gener gener) {
        int rows;
        try {
            rows = generDao.insertObject(gener);
        }catch (Exception e){
            e.printStackTrace();
            throw new ServiceException("服务器异常正在维修中");
        }
        return rows;
    }
}
