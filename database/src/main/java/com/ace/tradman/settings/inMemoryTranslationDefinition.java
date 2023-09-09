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
    List<TranslationDefinition> settingDefinitions = new ArrayList<>();

    {
        TranslationDefinition build2 = TranslationDefinition.builder()
                .id(UUID.randomUUID().toString())
                .key("set1.enabled")
                .build();
        settingDefinitions.add(build2);
    }

    @Override
    public List<TranslationDefinition> listAllDefinitions() {
        return settingDefinitions;
    }

    @Override
    public TranslationDefinition upsertTranslationDefinition(TranslationDefinition settingDefinition) {
        Optional<TranslationDefinition> first = settingDefinitions.stream().filter(d -> d.getKey().equals(settingDefinition.getKey())).findFirst();
        if (first.isPresent()){
            return first.get();
        }else {
            settingDefinition.setId(UUID.randomUUID().toString());
            settingDefinitions.add(settingDefinition);
            return settingDefinition;
        }


    }

    @Override
    public void deleteTranslationDefinition(String settingDefinitionId) {
        Predicate<TranslationDefinition> hasExpectedId = settingDefinition -> settingDefinition.getKey().equals(settingDefinitionId);
        settingDefinitions = settingDefinitions.stream().filter(not(hasExpectedId)).toList();
    }


}
