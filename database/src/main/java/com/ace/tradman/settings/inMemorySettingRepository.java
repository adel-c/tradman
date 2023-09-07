package com.ace.tradman.settings;

import com.ace.tradman.translation.Translation;
import com.ace.tradman.translation.TranslationRepository;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import java.util.function.Predicate;

import static java.util.function.Predicate.not;

@Component
public class inMemorySettingRepository implements TranslationRepository {
    List<Translation> settings = new ArrayList<>();


    @Override
    public List<Translation> listAll() {
        return settings;
    }

    @Override
    public Translation upsertTranslation(Translation setting) {
        Optional<Translation> exists = settings.stream().filter(s ->
                s.getKey().equals(setting.getKey()) &&
                        s.getCountryId().equals(setting.getCountryId()) &&
                        s.getPartnerId().equals(setting.getPartnerId()) &&
                        s.getProfileId().equals(setting.getProfileId())
        ).findFirst();
        if (exists.isPresent()) {
            Translation oldValue = exists.get();
            oldValue.setValue(setting.getValue());
        } else {
            setting.setId(UUID.randomUUID().toString());
            settings.add(setting);
        }


        return setting;
    }

    @Override
    public void deleteTranslation(String settingId) {
        Predicate<Translation> hasExpectedId = setting -> setting.getId().equals(settingId);
        settings = settings.stream().filter(not(hasExpectedId)).toList();
    }
}
