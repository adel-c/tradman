package com.ace.tradman.translation;

import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SearchTranslationQuery {
    enum Sort {
        ASC,
        DESC,
        NONE;

        public Sort toggle() {
            return switch (this) {
                case NONE, ASC -> DESC;
                case DESC -> ASC;
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
