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

    public Page filterBy(int page, SearchTranslationQuery searchTranslationQuery) {
        List<Translation> list = findAll();
        if (searchTranslationQuery != null) {
            list = list.stream().filter(t -> matchTranslation(t, searchTranslationQuery)).toList();
        }
        return buildPageFrom(page, list);
    }

    Page buildPageFrom(int page, List<Translation> translations) {
        int pageSize = 5;
        Page.PageBuilder pageBuilder = Page.builder();
        int startElement = Integer.max(page * pageSize, 0);
        int endElement = Integer.min((page + 1) * pageSize, translations.size());
        List<Translation> translations1 = translations.subList(startElement, endElement);

        pageBuilder.currentPage(page)
                .translations(translations1)
                .pageSize(pageSize)
                .totalElement(translations.size())
                .hasNextPage(endElement < translations.size());

        return pageBuilder.build();
    }

    public Optional<Translation> searchFor(String partner, String country, String profile, String lang, String key) {
        return translationRepository.listAll().stream().filter(t ->
                t.getPartner().equals(partner) &&
                        t.getCountry().equals(country) &&
                        t.getProfile().equals(profile) &&
                        t.getLang().equals(lang) &&
                        t.getKey().equals(key)

        ).findFirst();
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
