package com.ace.tradman.frontend;

import com.ace.tradman.translation.TranslationDefinition;
import com.ace.tradman.translation.TranslationDefinitionService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
@RequestMapping("/translation")
@AllArgsConstructor
public class TranslationPage {
    private final TranslationDefinitionService translationDefinitionService;
    @GetMapping()
    public String main(Model model, @RequestParam Map<String, String> allRequestParams
    ) {
        model.addAttribute("translationDefinitions", translationDefinitionService.listAllDefinitions());
        return "translationDefinition";
    }


    @PostMapping()
    public String post(Model model, @RequestParam Map<String, String> allRequestParams
    ) {
        String id = allRequestParams.get("id");
        String key = allRequestParams.get("key");
        String definition = allRequestParams.get("definition");
        String expandString = allRequestParams.getOrDefault("expand","off");

        TranslationDefinition build = TranslationDefinition.builder()
                .id(id)
                .key(key)

                .build();

        TranslationDefinition translationDefinition = translationDefinitionService.upsertSettingDefinition(build);
        model.addAttribute("translationDefinitions", translationDefinitionService.listAllDefinitions());
        return "./translation_definition/translation_definition_table";
    }
}
