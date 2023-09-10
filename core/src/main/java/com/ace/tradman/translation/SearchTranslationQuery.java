package com.ace.tradman.translation;

import lombok.*;

import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.function.Function;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SearchTranslationQuery {
    public enum Sort {
        ASC,
        DESC,
        NONE;

        public Sort toggle() {
            return switch (this) {
                case NONE, ASC -> DESC;
                case DESC -> ASC;
            };
        }
        public Optional<Comparator<Translation>> buildComparator(Function<Translation,String> getter){

            return switch (this){
                case NONE -> Optional.empty();
                case ASC -> Optional.of(Comparator.comparing(getter).reversed());
                case DESC -> Optional.of(Comparator.comparing(getter));
            };
        }
    }

    List<String> partners;
    List<String> countries;
    List<String> profiles;
    List<String> languages;
    String key;
    Sort partnerSort;
    Sort countrySort;
    Sort profileSort;
    Sort languageSort;
    Sort keySort;
    Sort valueSort;

    public void resetSort(){
        partnerSort=Sort.NONE;
        countrySort=Sort.NONE;
        profileSort=Sort.NONE;
        languageSort=Sort.NONE;
        keySort=Sort.NONE;
        valueSort=Sort.NONE;
    }
    public QuerySort getQuerySort() {


        return QuerySort.builder()
                .partnerSort(partnerSort)
                .countrySort(countrySort)
                .profileSort(profileSort)
                .languageSort(languageSort)
                .keySort(keySort)
                .valueSort(valueSort)
                .build().setNullsToNone();
    }


    @Getter
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class QuerySort {
        Sort partnerSort;
        Sort countrySort;
        Sort profileSort;
        Sort languageSort;
        Sort keySort;
        Sort valueSort;
        public QuerySort setNullsToNone(){
            if(partnerSort == null){
                partnerSort =Sort.NONE;
            }
            if(countrySort == null){
                countrySort =Sort.NONE;
            }
            if(profileSort == null){
                profileSort =Sort.NONE;
            }
            if(languageSort == null){
                languageSort =Sort.NONE;
            }
            if(keySort == null){
                keySort =Sort.NONE;
            }
            if(valueSort == null){
                valueSort =Sort.NONE;
            }
            return this;
        }

    }
}
