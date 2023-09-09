package com.ace.tradman.translation;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class Page {
    int totalElement;
    List<Translation> translations;
    int currentPage;
    boolean hasNextPage;
    int pageSize;
}
