package com.ace.tradman.translation;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Translation {
    private String id;
    private String countryId;
    private String partnerId;
    private String profileId;
    private String lang;
    private String key;
    private String value;
}
