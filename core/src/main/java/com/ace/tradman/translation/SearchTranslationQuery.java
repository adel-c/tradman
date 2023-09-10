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
    }
}
