package com.ace.tradman.rest;

import com.ace.tradman.translation.SearchTranslationQuery;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class RestApiController {

    @GetMapping("/download-file")
    public void main( HttpServletResponse response,
                      @RequestParam("partners") List<String> partners,
                      @RequestParam("countries") List<String> countries,
                      @RequestParam("profiles") List<String> profiles,
                      @RequestParam("languages") List<String> languages,
                      @RequestParam("key") String key


    ) throws IOException {
        System.out.println(profiles);
        SearchTranslationQuery build = SearchTranslationQuery
                .builder()
                .partners(partners)
                .countries(countries)
                .profiles(profiles)
                .languages(languages)
                .key(key)
                .build();
        System.out.println(build.toString());
        String csvFileName = "books.csv";

        response.setContentType("text/csv");

        // creates mock data
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"",
                csvFileName);
        response.setHeader(headerKey, headerValue);


        PrintWriter writer = response.getWriter();
       writer.println("""
    machin;truc;much
    v1;v2;v3
    v4;v5;v6
    """);
       writer.close();

    }



}
