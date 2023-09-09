package com.ace.tradman.partner;

import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PartnerService {
    public List<Partner> findPartners(){
        return List.of(
                new Partner("par1","Partner1"),
                new Partner("par2","Partner2"),
                new Partner("par3","Partner3")
        );
    }
}
