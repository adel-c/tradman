package com.ace.tradman.translation;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class TranslationService {

    private TranslationRepository translationRepository;

    public List<Translation> findAll() {
        return translationRepository.listAll();
    }

    public Optional<Translation> searchFor(String partner,String country,String profile,String lang,String key) {
        return translationRepository.listAll().stream().filter(t->
                        t.getPartner().equals(partner) &&
                        t.getCountry().equals(country) &&
                        t.getProfile().equals(profile) &&
                        t.getLang().equals(lang) &&
                        t.getKey().equals(key)

                ).findFirst();
    }

    public List<Translation> filterBy(SearchTranslationQuery searchTranslationQuery) {
        if (searchTranslationQuery == null) {
            return findAll();
        }

        return findAll().stream().filter(t -> matchTranslation(t, searchTranslationQuery)).toList();
    }

    private boolean matchTranslation(Translation t, SearchTranslationQuery q) {
        return equalOrNull(t.getPartner(), q.getPartners()) &&
                equalOrNull(t.getCountry(), q.getCountries()) &&
                equalOrNull(t.getProfile(), q.getProfiles()) &&
                equalOrNull(t.getLang(), q.getLanguages()) &&
                containsOrNull(t.getKey(), q.getKey());
    }

    private boolean containsOrNull(String s1, String s2) {
        if (!StringUtils.hasText(s2)) {
            return true;
        }
        return s1.toLowerCase().contains(s2.toLowerCase());
    }

    private boolean equalOrNull(String s1, List<String> s2) {
        return s2 == null || s2.contains(s1);
    }

    public Translation upsertTranslation(Translation translation) {
        return translationRepository.upsertTranslation(translation);
    }

    public void deleteTranslation(String translationId) {
        translationRepository.deleteTranslation(translationId);
    }
}
