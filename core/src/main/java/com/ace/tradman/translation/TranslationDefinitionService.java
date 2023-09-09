package com.ace.tradman.translation;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@AllArgsConstructor
@Service
public class TranslationDefinitionService {
    private TranslationDefinitionRepository translationDefinitionRepository;
    public List<TranslationDefinition> findAll() {
        return translationDefinitionRepository.listAllDefinitions();
    }
    public TranslationDefinition upsertSettingDefinition(TranslationDefinition translationDefinition){
        return translationDefinitionRepository.upsertTranslationDefinition(translationDefinition);
    }
    public void deleteSettingDefinition(String translationDefinitionId) {

        translationDefinitionRepository.deleteTranslationDefinition(translationDefinitionId);
    }

    public List<String> allKeys() {
        return findAll().stream().map(TranslationDefinition::getKey).toList();
    }
}
