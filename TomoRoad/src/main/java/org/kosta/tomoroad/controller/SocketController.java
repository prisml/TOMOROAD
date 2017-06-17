package org.kosta.tomoroad.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketController {
     
    @RequestMapping("echo")
    public String viewChattingPage() {
        return "templates/chat.tiles";
    }
}


