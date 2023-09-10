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
    QuerySort querySort;

    public QuerySort getQuerySort() {
        if(querySort == null){
            return new QuerySort().setNullsToNone();
        }
        return querySort.setNullsToNone();
    }

    @Getter
    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class QuerySort {
        private Sort partner;
        private Sort country;
        private Sort profile;
        private Sort language;
        private Sort key;
        private Sort value;

        public QuerySort setNullsToNone(){
            if(partner == null){
                partner=Sort.NONE;
            }
            if(country == null){
                country=Sort.NONE;
            }
            if(profile == null){
                profile=Sort.NONE;
            }
            if(language == null){
                language=Sort.NONE;
            }
            if(key == null){
                key=Sort.NONE;
            }
            if(value == null){
                value=Sort.NONE;
            }
            return this;
        }
    }
}
