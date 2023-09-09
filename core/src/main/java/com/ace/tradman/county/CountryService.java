package com.ace.tradman.county;

import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class CountryService {

    public List<Country> findAll() {
        return List.of(
                new Country("FR", "France", "fr"),
                new Country("UK", "UK", "en"),
                new Country("ES", "Spain", "es")
        );
    }
}
