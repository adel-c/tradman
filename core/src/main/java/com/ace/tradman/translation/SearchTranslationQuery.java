package com.ace.tradman.translation;

import lombok.Value;

import java.util.List;

@Value
public class SearchTranslationQuery {

    List<String> partners;
    List<String> countries;
    List<String> profiles;
    List<String> languages;
    String key;
}
