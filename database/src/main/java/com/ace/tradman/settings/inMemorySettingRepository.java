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
    List<Translation> translations = new ArrayList<>();

    {
        translations.add(trad("par1", "FR", "pro1", "f1.key1", "fr", "p1f1k1Fr"));
        translations.add(trad("par1", "FR", "pro1", "f1.key2", "fr", "p1f1k2Fr"));
        translations.add(trad("par1", "FR", "pro3", "f2.key1", "fr", "p1f2k1Fr"));
        translations.add(trad("par1", "UK", "pro2", "f1.key1", "en", "p1f1k1en"));
        translations.add(trad("par1", "FR", "pro1", "f3.key1", "fr", "p1f3k1Fr"));


        translations.add(trad("par2", "FR", "pro1", "f1.key1", "fr", "p2f1k1Fr"));
        translations.add(trad("par2", "FR", "pro1", "f1.key2", "fr", "p2f1k2Fr"));
        translations.add(trad("par2", "FR", "pro1", "f2.key1", "fr", "p2f2k1Fr"));
        translations.add(trad("par2", "UK", "pro1", "f1.key1", "en", "p2f1k1en"));
        translations.add(trad("par2", "FR", "pro2", "f3.key1", "fr", "p2f3k1Fr"));

        translations.add(trad("par3", "FR", "pro3", "f1.key1", "es", "p3f1k1Es"));
        translations.add(trad("par3", "FR", "pro1", "f1.key2", "fr", "p3f1k2Fr"));
        translations.add(trad("par3", "FR", "pro2", "f2.key1", "fr", "p3f2k1Fr"));
        translations.add(trad("par3", "UK", "pro1", "f1.key1", "en", "p3f1k1en"));
        translations.add(trad("par3", "FR", "pro2", "f3.key1", "fr", "p3f3k1Fr"));
    }

    private Translation trad(String partner, String country, String profile, String key, String lang, String value) {
        return Translation.builder()
                .partner(partner)
                .country(country)
                .profile(profile)
                .key(key)
                .lang(lang)
                .value(value)
                .build();
    }


    @Override
    public List<Translation> listAll() {
        return translations;
    }

    @Override
    public Translation upsertTranslation(Translation translation) {
        Optional<Translation> exists = translations.stream().filter(s ->
                s.getKey().equals(translation.getKey()) &&
                        s.getCountry().equals(translation.getCountry()) &&
                        s.getPartner().equals(translation.getPartner()) &&
                        s.getProfile().equals(translation.getProfile())
        ).findFirst();
        if (exists.isPresent()) {
            Translation oldValue = exists.get();
            oldValue.setValue(translation.getValue());
            return oldValue;
        } else {
            translation.setId(UUID.randomUUID().toString());
            translations.add(translation);
            return translation;
        }



    }

    @Override
    public void deleteTranslation(String settingId) {
        Predicate<Translation> hasExpectedId = setting -> setting.getId().equals(settingId);
        translations = translations.stream().filter(not(hasExpectedId)).toList();
    }
}
