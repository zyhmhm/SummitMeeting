package com.cy.dingcan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface ShopDao {
    List<Map<String,Object>> findObjects();
}
