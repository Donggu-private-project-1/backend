package com.donggu.demo.Controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class mainController {

    @CrossOrigin(origins = {"http://donggu-1-nginx/"})
    @GetMapping("/api/test")
    public String test() {
        return "{ name:동구 }";
    }

}