package com.cy.dingcan.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserDao {
	int doFindIdByUserName(String name);
}
