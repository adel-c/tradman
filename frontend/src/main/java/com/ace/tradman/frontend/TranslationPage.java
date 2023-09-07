package com.ace.tradman.frontend;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/translation-definition")
@AllArgsConstructor
public class TranslationPage {

    @GetMapping()
    public String main(@ModelAttribute("model") ModelMap model, @RequestParam Map<String, String> allRequestParams
    ) {
        model.addAttribute("time", new Date());
        model.addAttribute("carList", List.of());
        model.addAttribute("fragment", "/page/main");
        return "translationDefinition";
    }
}
