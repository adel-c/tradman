package com.ace.tradman.translation;

import java.util.List;

public interface TranslationDefinitionRepository {
    List<TranslationDefinition> listAllDefinitions() ;
    TranslationDefinition upsertTranslationDefinition(TranslationDefinition translationDefinition);
    void deleteTranslationDefinition(String translationDefinitionId) ;
}
