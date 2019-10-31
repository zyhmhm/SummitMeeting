package com.cy.dingcan.conreoller;

import com.cy.common.vo.JsonResult;
import com.cy.dingcan.service.ShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/shop/")
@CrossOrigin
public class ShopController {
    @Autowired
    private ShopService shopService;
    @RequestMapping("doFindObjects")
    public JsonResult doFindObjects(){
        return new JsonResult(shopService.doFindObjects());
    }
}
