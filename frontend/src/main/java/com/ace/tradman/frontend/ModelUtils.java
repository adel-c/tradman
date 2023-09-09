package com.ace.tradman.frontend;

import org.springframework.ui.Model;

import static com.ace.tradman.frontend.TriggersConst.RELOAD_TRANSLATION_TABLE;

public class ModelUtils {

    public static void addConstToModel(Model model){
            model.addAttribute("trigger_reload_translation_table",RELOAD_TRANSLATION_TABLE);
    }
}
