package com.cy.dingcan.dao;

import com.cy.dingcan.entity.Gener;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface GenerDao {
    List<Gener> findObject();
    int deleteObject(Integer[] ids);
    int insertObject(Gener gener);
}
