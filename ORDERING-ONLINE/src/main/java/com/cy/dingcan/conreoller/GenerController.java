package com.cy.dingcan.conreoller;

import com.cy.common.vo.JsonResult;
import com.cy.dingcan.entity.Gener;
import com.cy.dingcan.service.GenerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/gener")
public class GenerController {

    @Autowired
    private GenerService generService;

    @RequestMapping("/doFindObject")
    public JsonResult doFindObject(){
        return new JsonResult(generService.doFindObject());
    }
    @RequestMapping("/doDeleteObject")
    public JsonResult doDeleteObject(Integer[] ids){
        return new JsonResult(generService.doDeleteObject(ids));
    }
    @RequestMapping("/doInsertObject")
    public JsonResult doInsetrObject(Gener entity){
        return new JsonResult(generService.doInsertObject(entity));
    }
}
