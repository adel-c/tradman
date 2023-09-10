package com.ace.tradman.translation;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Stream;

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
        Optional<Comparator<Translation>> translationComparator = buildCompartor(searchTranslationQuery.getQuerySort());
        if(translationComparator.isPresent()){
            list= new ArrayList<>(list);
            list.sort(translationComparator.get());
        }
        Page page1 = buildPageFrom(page, list);
        return page1;
    }

    private  Optional<Comparator<Translation>> buildCompartor(SearchTranslationQuery.QuerySort querySort) {
        Optional<Comparator<Translation>> reduce = Stream.of(querySort.getPartnerSort().buildComparator(Translation::getPartner),
                        querySort.getCountrySort().buildComparator(Translation::getCountry),
                        querySort.getProfileSort().buildComparator(Translation::getProfile),
                        querySort.getLanguageSort().buildComparator(Translation::getLang),
                        querySort.getKeySort().buildComparator(Translation::getKey),
                        querySort.getValueSort().buildComparator(Translation::getValue))
                .filter(Optional::isPresent)
                .map(Optional::get)

                .reduce((v, acc) -> acc.thenComparing(v));

        return reduce;
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
