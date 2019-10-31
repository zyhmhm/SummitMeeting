package com.cy.dingcan.service.impl;

import com.cy.dingcan.dao.ShopDao;
import com.cy.dingcan.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ShopServiceImpl implements ShopService {
    @Autowired
    private ShopDao shopDao;
    @Override
    public List<Map<String, Object>> doFindObjects() {
        List<Map<String, Object>> shops = shopDao.findObjects();
        return shops;
    }
}
