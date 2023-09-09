package com.ace.tradman.translation;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

@Service
@AllArgsConstructor
public class TranslationService {

    private TranslationRepository translationRepository;

    public List<Translation> findAll() {
        return translationRepository.listAll();
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
