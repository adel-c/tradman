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

    {
        settings.add(trad("pra1", "FR", "pro1", "f1.key1", "fr", "p1f1k1Fr"));
        settings.add(trad("pra1", "FR", "pro1", "f1.key2", "fr", "p1f1k2Fr"));
        settings.add(trad("pra1", "FR", "pro3", "f2.key1", "fr", "p1f2k1Fr"));
        settings.add(trad("pra1", "UK", "pro2", "f1.key1", "en", "p1f1k1en"));
        settings.add(trad("pra1", "FR", "pro1", "f3.key1", "fr", "p1f3k1Fr"));


        settings.add(trad("pra2", "FR", "pro1", "f1.key1", "fr", "p2f1k1Fr"));
        settings.add(trad("pra2", "FR", "pro1", "f1.key2", "fr", "p2f1k2Fr"));
        settings.add(trad("pra2", "FR", "pro1", "f2.key1", "fr", "p2f2k1Fr"));
        settings.add(trad("pra2", "UK", "pro1", "f1.key1", "en", "p2f1k1en"));
        settings.add(trad("pra2", "FR", "pro2", "f3.key1", "fr", "p2f3k1Fr"));

        settings.add(trad("pra3", "FR", "pro3", "f1.key1", "es", "p3f1k1Es"));
        settings.add(trad("pra3", "FR", "pro1", "f1.key2", "fr", "p3f1k2Fr"));
        settings.add(trad("pra3", "FR", "pro2", "f2.key1", "fr", "p3f2k1Fr"));
        settings.add(trad("pra3", "UK", "pro1", "f1.key1", "en", "p3f1k1en"));
        settings.add(trad("pra3", "FR", "pro2", "f3.key1", "fr", "p3f3k1Fr"));
    }

    private Translation trad(String partner, String country, String profile, String key, String lang, String value) {
        return Translation.builder()
                .partnerId(partner)
                .countryId(country)
                .profileId(profile)
                .key(key)
                .lang(lang)
                .value(value)
                .build();
    }


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
