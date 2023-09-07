package com.ace.tradman.rest;

import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
@AllArgsConstructor
public class RestApiController {

    @GetMapping("/get")
    public String main( @RequestParam Map<String, String> allRequestParams
    ) {



        return
        //language=json
    """
            {
      "machin": true,
      "truc": "asddd"
    }""";
    }



}
