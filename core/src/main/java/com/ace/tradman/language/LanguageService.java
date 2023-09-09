package com.ace.tradman.language;

import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class LanguageService {

    public List<String> findAll() {
        return List.of(
                "fr",
                "en", "es", "it"
        );
    }
}
