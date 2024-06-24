package com.donggu.demo.Controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class mainController {

    @CrossOrigin(origins = "*")
    @GetMapping("/")
    public String test() {
        return "{ name:동구 }";
    }

}