package com.cy.dingcan.dao;


import com.cy.dingcan.entity.Good;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GoodDao {
	//List<Good> findObjectsByIds(Integer[] ids);
	List<Good> findObjects();
}
