package com.ace.tradman.translation;


import java.util.List;

public interface TranslationRepository {

    List<Translation> listAll() ;
    Translation upsertTranslation(Translation translation) ;
    void deleteTranslation(String translationId);
}
