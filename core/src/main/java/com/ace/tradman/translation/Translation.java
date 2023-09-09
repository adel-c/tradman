package com.ace.tradman.translation;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Translation {
    private String id;
    private String partner;
    private String country;
    private String profile;
    private String lang;
    private String key;
    private String value;
}
