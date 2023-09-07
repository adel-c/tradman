package com.ace.tradman.translation;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class TranslationDefinitionService {
    List<TranslationDefinition> listAllDefinitions() {
        return List.of();
    }
    TranslationDefinition upsertSettingDefinition(TranslationDefinition translationDefinition){
        return translationDefinition;
    }
    void deleteSettingDefinition(String translationDefinitionId) {}
}
