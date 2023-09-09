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
        return equalOrNull(t.getPartner(), q.getPartner()) &&
                equalOrNull(t.getCountry(), q.getCountry()) &&
                equalOrNull(t.getProfile(), q.getProfile()) &&
                equalOrNull(t.getLang(), q.getLang()) &&
                containsOrNull(t.getKey(), q.getKey());
    }

    private boolean containsOrNull(String s1, String s2) {
        if (!StringUtils.hasText(s2)) {
            return true;
        }
        return s1.toLowerCase().contains(s2.toLowerCase());
    }

    private boolean equalOrNull(String s1, String s2) {
        return s2 == null || s2.equals(s1);
    }

    public Translation upsertTranslation(Translation translation) {
        return translationRepository.upsertTranslation(translation);
    }

    public void deleteTranslation(String translationId) {
        translationRepository.deleteTranslation(translationId);
    }
}
