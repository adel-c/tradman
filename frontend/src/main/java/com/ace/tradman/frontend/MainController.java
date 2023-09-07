package com.ace.tradman.frontend;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/")
@AllArgsConstructor
public class MainController {

    @GetMapping()
    public String main(@ModelAttribute("model") ModelMap model, @RequestParam Map<String, String> allRequestParams
    ) {

        return "index";
    }



}
