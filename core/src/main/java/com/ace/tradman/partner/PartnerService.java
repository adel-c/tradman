package com.ace.tradman.partner;

import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PartnerService {
    public List<Partner> findPartners(){
        return List.of(
                new Partner("P1","le premier P"),
                new Partner("P2","PP2"),
                new Partner("P3","Pp3")
        );
    }
}
