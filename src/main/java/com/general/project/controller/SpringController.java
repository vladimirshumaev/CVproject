package com.general.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SpringController {

    @GetMapping("/spring")
    public String getSpringMapping() {
        return "spring";
    }

}

