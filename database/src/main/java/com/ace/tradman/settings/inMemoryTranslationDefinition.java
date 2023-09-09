package com.ace.tradman.settings;

import com.ace.tradman.translation.TranslationDefinition;
import com.ace.tradman.translation.TranslationDefinitionRepository;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.function.Predicate;

import static java.util.function.Predicate.not;

@Component
public class inMemoryTranslationDefinition implements TranslationDefinitionRepository {
    List<TranslationDefinition> translationDefinitions = new ArrayList<>();

    {
        translationDefinitions.add(tradDef("f1.key1"));
        translationDefinitions.add(tradDef("f1.key2"));
        translationDefinitions.add(tradDef("f1.key3"));
        translationDefinitions.add(tradDef("f2.key1"));
        translationDefinitions.add(tradDef("f2.key2"));
        translationDefinitions.add(tradDef("f3.key1"));
    }

    private static TranslationDefinition tradDef(String key) {
        TranslationDefinition build2 = TranslationDefinition.builder()
                .id(UUID.randomUUID().toString())
                .key(key)
                .build();
        return build2;
    }

    @Override
    public List<TranslationDefinition> listAllDefinitions() {
        return translationDefinitions;
    }

    @Override
    public TranslationDefinition upsertTranslationDefinition(TranslationDefinition settingDefinition) {
        Optional<TranslationDefinition> first = translationDefinitions.stream().filter(d -> d.getKey().equals(settingDefinition.getKey())).findFirst();
        if (first.isPresent()){
            return first.get();
        }else {
            settingDefinition.setId(UUID.randomUUID().toString());
            translationDefinitions.add(settingDefinition);
            return settingDefinition;
        }


    }

    @Override
    public void deleteTranslationDefinition(String settingDefinitionId) {
        Predicate<TranslationDefinition> hasExpectedId = settingDefinition -> settingDefinition.getKey().equals(settingDefinitionId);
        translationDefinitions = translationDefinitions.stream().filter(not(hasExpectedId)).toList();
    }


}
