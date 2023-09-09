package com.ace.tradman.translation;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TranslationDefinition {
    private String id;
    private String key;

}
