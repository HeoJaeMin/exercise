package com.hanghae.exec.test.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class TextController{

    @GetMapping("/health")
    fun helloWorld(): String {
        return "OK"
    }
}