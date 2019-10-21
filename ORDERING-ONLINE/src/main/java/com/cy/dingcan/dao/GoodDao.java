package com.cy.dingcan.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cy.dingcan.entity.Good;

@Repository
@Mapper
public interface GoodDao {
	List<Good> findObjectsByIds(Integer[] ids);

}
