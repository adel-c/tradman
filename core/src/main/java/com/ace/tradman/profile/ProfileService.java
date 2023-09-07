package com.ace.tradman.profile;

import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProfileService {
    public List<Profile> findProfiles() {
        return List.of(
                new Profile("pro1", "Profile 1"),
                new Profile("pro2", "Profile 2"),
                new Profile("pro3", "Profile 3")
        );
    }
}
