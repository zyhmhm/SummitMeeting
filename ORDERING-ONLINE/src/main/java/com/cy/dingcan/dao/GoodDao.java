package com.cy.dingcan.dao;


import com.cy.dingcan.vo.GoodFindVo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GoodDao {
	//List<Good> findObjectsByIds(Integer[] ids);
	List<GoodFindVo> findObjects();
}
