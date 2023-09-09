package com.ace.tradman.frontend;

import com.ace.tradman.county.Country;
import com.ace.tradman.county.CountryService;
import com.ace.tradman.language.LanguageService;
import com.ace.tradman.partner.Partner;
import com.ace.tradman.partner.PartnerService;
import com.ace.tradman.profile.Profile;
import com.ace.tradman.profile.ProfileService;
import com.ace.tradman.translation.Translation;
import com.ace.tradman.translation.TranslationDefinition;
import com.ace.tradman.translation.TranslationDefinitionService;
import com.ace.tradman.translation.TranslationService;
import lombok.AllArgsConstructor;
import lombok.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.zip.CheckedOutputStream;

@Controller
@RequestMapping("/translation")
@AllArgsConstructor
public class TranslationPage {
    private final TranslationDefinitionService translationDefinitionService;
    private final TranslationService translationService;
    private final CountryService countryService;
    private final ProfileService profileService;
    private final PartnerService partnerService;
    private final LanguageService languageService;

    @GetMapping()
    public String main(Model model, @RequestParam Map<String, String> allRequestParams
    ) {
        model.addAttribute("translations", translationService.findAll());
        model.addAttribute("translationKeys", toSelectOptions(translationDefinitionService.allKeys()));
        model.addAttribute("partners", toSelectOptions(partnerService.findAll(), Partner::id, Partner::name));
        model.addAttribute("countries", toSelectOptions(countryService.findAll(), Country::getId, Country::getLabel));
        model.addAttribute("profiles", toSelectOptions(profileService.findAll(), Profile::id, Profile::name));
        model.addAttribute("languages", toSelectOptions(languageService.findAll()));
        return "translation";
    }

    public <T> List<SelectOption> toSelectOptions(List<T> values, Function<T, String> valueGetter, Function<T, String> labelGetter) {
        return values.stream().map(v -> new SelectOption(valueGetter.apply(v), labelGetter.apply(v))).toList();
    }

    public List<SelectOption> toSelectOptions(List<String> values) {
        return toSelectOptions(values, Function.identity(), Function.identity());
    }

    @PostMapping()
    public String post(Model model,
                       @ModelAttribute Translation translation
    ) {


        Translation translation1 = translationService.upsertTranslation(translation);
        model.addAttribute("translations", translationService.findAll());
        return "./translation_definition/translation_table";
    }

    @Value
    public static class SelectOption {
        String value;
        String label;
    }

}
