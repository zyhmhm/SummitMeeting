package com.cy.dingcan.conreoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class PageController {

    @RequestMapping("/doPageIndexUI")
    public String doPageIndexUI(){
        return "index";
    }
    @RequestMapping("{modudle}/{page}")
    public String doPageUI(@PathVariable String page){
        return "page";
    }
}
