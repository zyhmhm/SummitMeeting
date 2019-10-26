package com.cy.dingcan.service;

import com.cy.dingcan.entity.Gener;

import java.util.List;

public interface GenerService {
    List<Gener> doFindObject();
    int doDeleteObject(Integer[] ids);
    int doInsertObject(Gener gener);
}
