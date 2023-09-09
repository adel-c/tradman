package com.ace.tradman.rest;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class RestApiController {

    @GetMapping("/download-file")
    public void main( HttpServletResponse response
    ) throws IOException {


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
