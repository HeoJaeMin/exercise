package com.hanghae.exec.test.controller

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/test")
class TextController{

    @GetMapping("/test")
    fun helloWorld(): String {
        return "test done"
    }
}