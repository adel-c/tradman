package com.ace.tradman.translation;

import lombok.Value;

@Value
public class SearchTranslationQuery {

    String partner;
    String country;
    String profile;
    String lang;
    String key;
    String value;
}
