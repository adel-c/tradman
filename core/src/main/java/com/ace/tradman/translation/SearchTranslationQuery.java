package com.ace.tradman.translation;

import lombok.*;

import java.util.List;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SearchTranslationQuery {

    List<String> partners;
    List<String> countries;
    List<String> profiles;
    List<String> languages;
    String key;
}
